/*
 * Copyright (c) 2020 Chanus
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.chanus.yuntao.boot.framework.base.controller;

import com.chanus.yuntao.boot.common.constant.MsgCodeConstants;
import com.chanus.yuntao.boot.common.pojo.CustomMap;
import com.chanus.yuntao.boot.common.pojo.Message;
import com.chanus.yuntao.utils.core.IOUtils;
import com.chanus.yuntao.utils.core.RandomUtils;
import com.chanus.yuntao.utils.core.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Objects;

/**
 * Controller 基类
 *
 * @author Chanus
 * @date 2020-07-30 10:46:43
 * @since 0.0.1
 */
public class BaseController {
    protected final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // 设置 List 的最大长度
        binder.setAutoGrowCollectionLimit(10000);
    }

    /**
     * 获取 Request 对象
     *
     * @return {@link HttpServletRequest}
     */
    protected HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
    }

    /**
     * 获取 Response 对象
     *
     * @return {@link HttpServletResponse}
     */
    protected HttpServletResponse getResponse() {
        return ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getResponse();
    }

    /**
     * 获取 Session 对象
     *
     * @return {@link HttpSession}
     */
    protected HttpSession getSession() {
        return ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest().getSession();
    }

    /**
     * 将请求参数组装成 Map
     *
     * @return 请求参数 Map 集合
     */
    protected CustomMap getParams() {
        CustomMap params = CustomMap.create();
        Map<String, String[]> parameterMap = getRequest().getParameterMap();
        for (String k : parameterMap.keySet()) {
            String[] v = parameterMap.get(k);
            if (v.length == 1) {
                if (StringUtils.isNotBlank(v[0]))
                    params.put(k, v[0]);
            } else if (v.length > 1) {
                params.put(k, v);
            }
        }

        return params;
    }

    /**
     * 读取 HTTP 请求的 body 内容
     *
     * @return HTTP 请求的 body 字符串
     */
    protected String getRequestBody() {
        BufferedReader bufferedReader = null;
        StringBuilder stringBuilder = new StringBuilder();
        try {
            bufferedReader = getRequest().getReader();
            String s;
            while ((s = bufferedReader.readLine()) != null) {
                stringBuilder.append(s);
            }
            bufferedReader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(bufferedReader);
        }

        return stringBuilder.toString();
    }

    /**
     * 单文件上传
     *
     * @param file
     * @param path 文件保存路径
     * @return {@link Message}
     */
    protected Message upload(MultipartFile file, String path) {
        return upload(file, path, RandomUtils.getRandomUniqueNo());
    }

    /**
     * 单文件上传
     *
     * @param file
     * @param path     文件保存路径
     * @param fileName 文件名，不包含后缀
     * @return {@link Message}
     */
    protected Message upload(MultipartFile file, String path, String fileName) {
        Message message = new Message(MsgCodeConstants.SUCCESS, "文件上传成功");
        if (file != null && file.getSize() > 0) {
            // 保存路径
            String realFileName = file.getOriginalFilename();
            fileName = fileName + realFileName.substring(realFileName.lastIndexOf("."));
            File f = new File(path, fileName);
            if (!f.exists())
                f.mkdirs();
            try {
                file.transferTo(f);
                // 返回文件保存的路径，文件真实名称，文件保存的名称
                message.setMap(CustomMap.create().putNext("filePath", path).putNext("realFileName", realFileName).putNext("fileName", fileName));
            } catch (Exception e) {// 图片上传失败
                return Message.init(MsgCodeConstants.FAIL, "文件上传失败");
            }
        }

        return message;
    }

    /**
     * 文件下载
     *
     * @param fileParh 文件存储绝对路径
     * @param realName 返回的文件名称，若为空则返回原始文件名称
     */
    protected void download(String fileParh, String realName) {
        HttpServletRequest request = getRequest();
        HttpServletResponse response = getResponse();
        response.reset();// 清空输出流
        // 设置响应类型
        response.setContentType("text/html;charset=UTF-8");
        response.setBufferSize(10240);// 设定缓冲大小

        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            // 解决中文名称乱码问题
            request.setCharacterEncoding("UTF-8");
            if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0) {// 火狐浏览器
                realName = new String(realName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
            } else {// IE浏览器、谷歌浏览器
                realName = java.net.URLEncoder.encode(realName, "UTF-8");
            }

            response.setHeader("Content-Disposition", "attachment; filename=" + (StringUtils.isBlank(realName) ? fileParh.substring(fileParh.lastIndexOf("/")) : realName) + fileParh.substring(fileParh.lastIndexOf(".")));
            response.setHeader("Content-Length", String.valueOf(new File(fileParh).length()));

            bis = new BufferedInputStream(new FileInputStream(fileParh));
            bos = new BufferedOutputStream(response.getOutputStream());

            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (Exception e) {
            LOGGER.error("文件下载异常", e);
        } finally {
            if (bos != null) {
                try {
                    bos.flush();
                    bos.close();
                } catch (IOException e) {
                    LOGGER.error("关闭输出流异常", e);
                }
            }
            if (bis != null) {
                try {
                    bis.close();
                } catch (IOException e) {
                    LOGGER.error("关闭输入流异常", e);
                }
            }
        }
    }
}
