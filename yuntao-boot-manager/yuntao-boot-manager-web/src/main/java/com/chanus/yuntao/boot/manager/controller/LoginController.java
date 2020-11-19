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
package com.chanus.yuntao.boot.manager.controller;

import com.chanus.yuntao.boot.common.constant.Constants;
import com.chanus.yuntao.boot.common.pojo.LoginUser;
import com.chanus.yuntao.boot.common.pojo.SessionSave;
import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.manager.annotation.Log;
import com.chanus.yuntao.boot.manager.common.CacheData;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.service.LogService;
import com.chanus.yuntao.boot.manager.service.LoginUserService;
import com.chanus.yuntao.utils.core.GoogleAuthenticatorUtils;
import com.chanus.yuntao.utils.core.IpUtils;
import com.chanus.yuntao.utils.core.StringUtils;
import com.chanus.yuntao.utils.core.VerifyCodeUtils;
import com.chanus.yuntao.utils.core.encrypt.RSAUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Map;

/**
 * 登录、退出
 *
 * @author Chanus
 * @date 2020-08-01 11:53:20
 * @since 1.0.0
 */
@Controller
public class LoginController extends BaseController {
    @Autowired
    private LoginUserService loginUserService;
    @Autowired
    private LogService logService;

    /**
     * 用户跳转到登录界面
     *
     * @param model
     * @return
     */
    @GetMapping(value = "login")
    public String login(Model model) {
        model.addAttribute("isCheckVerifyCode", CacheData.SYSTEM_PARAMS_MAP.get("sys_check_verify_code"));
        model.addAttribute("isCheckGoogleAuthenticator", CacheData.SYSTEM_PARAMS_MAP.get("sys_check_google_authenticator"));
        return "login";
    }

    /**
     * 跳转到重新登录界面
     *
     * @return
     */
    @GetMapping(value = "relogin")
    public String relogin() {
        return "relogin";
    }

    /**
     * 点击登录时获取RSA公钥，服务器保存私钥
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "rsa-public-key")
    public String rsaPublicKey() {
        Map<String, String> rsaKey = CacheData.getRsaKey();
        CacheData.RSA_KEYS_MAP.put(rsaKey.get(RSAUtils.PUBLIC_KEY), rsaKey.get(RSAUtils.PRIVATE_KEY));
        return rsaKey.get(RSAUtils.PUBLIC_KEY);
    }

    /**
     * 生成验证码
     *
     * @param response
     * @throws IOException
     */
    @GetMapping(value = "verify-code")
    public void verifyCode(HttpServletResponse response) throws IOException {
        VerifyCodeUtils verifyCodeUtils = new VerifyCodeUtils();
        // 获取生成的随机数字
        Map<String, Object> verifyCodeMap = verifyCodeUtils.generate();
        // 将四位数字的验证码保存到Session中
        getSession().setAttribute("verifyCode", verifyCodeMap.get("randomCode").toString());
        // 禁止图像缓存
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        // 将图像输出到Servlet输出流中
        ServletOutputStream sos = response.getOutputStream();
        ImageIO.write((BufferedImage) verifyCodeMap.get("buffImg"), "jpeg", sos);
        sos.close();
    }

    /**
     * 账号登录验证:验证码校验、用户信息校验
     *
     * @return
     */
    @ResponseBody
    @Log(logType = LogTypeEnum.LOGIN)
    @PostMapping(value = "login", produces = "application/json; charset=utf-8")
    public Message login() {
        HttpSession session = getSession();
        Map<String, Object> params = getParams();
        String rsaPublicKey = (String) params.get("rsaPublicKey");

        if ("1".equals(CacheData.SYSTEM_PARAMS_MAP.get("sys_check_verify_code"))) {// 需要验证码校验
            String verifyCode = (String) params.get("verifyCode");
            String realVerifyCode = (String) session.getAttribute("verifyCode");

            if (StringUtils.isBlank(verifyCode)) {
                CacheData.RSA_KEYS_MAP.remove(rsaPublicKey);
                return Message.fail("验证码不能为空");
            }
            if (!verifyCode.equalsIgnoreCase(realVerifyCode)) {
                CacheData.RSA_KEYS_MAP.remove(rsaPublicKey);
                return Message.fail("验证码输入错误");
            }
        }

        if ("1".equals(CacheData.SYSTEM_PARAMS_MAP.get("sys_check_google_authenticator"))) {// 启用谷歌验证器
            String googleAuthenticatorCode = (String) params.get("googleAuthenticatorCode");

            if (StringUtils.isBlank(googleAuthenticatorCode))
                return Message.fail("动态验证码不能为空");

            if (!StringUtils.isNumeric(googleAuthenticatorCode))
                return Message.fail("动态验证码不正确");

            String secret = CacheData.SYSTEM_PARAMS_MAP.get("sys_google_authenticator_secret");
            if (!GoogleAuthenticatorUtils.checkCode(secret, Long.parseLong(googleAuthenticatorCode)))
                return Message.fail("动态验证码不正确");
        }

        String loginname = (String) params.get("loginname");
        String roleCode = (String) params.get("roleCode");
        String password = (String) params.get("password");
        try {
            password = RSAUtils.decryptByPrivateKey(password, CacheData.RSA_KEYS_MAP.get(rsaPublicKey));
        } finally {
            CacheData.RSA_KEYS_MAP.remove(rsaPublicKey);
        }

        Message message;
        if (StringUtils.isBlank(roleCode)) {
            message = loginUserService.login(loginname, password, IpUtils.getIpAddress(getRequest()));
        } else {
            message = loginUserService.login(loginname, password, roleCode, IpUtils.getIpAddress(getRequest()));
        }

        if (message.isSuccess()) {// 存储登录账号信息
            session.setAttribute("loginUser", message.getData());
            if (Constants.STATUS_YES.equals(CacheData.SYSTEM_PARAMS_MAP.get("sys_single_location_login")))
                SessionSave.getSessionIdSave().put(loginname, session.getId());
        }

        return message;
    }

    /**
     * 用户退出系统，跳转到登录界面
     *
     * @return
     */
    @Log(logType = LogTypeEnum.LOGOUT)
    @GetMapping(value = "logout")
    public String logout(Model model) {
        getSession().invalidate();
        model.addAttribute("isCheckVerifyCode", CacheData.SYSTEM_PARAMS_MAP.get("sys_check_verify_code"));
        model.addAttribute("isCheckGoogleAuthenticator", CacheData.SYSTEM_PARAMS_MAP.get("sys_check_google_authenticator"));
        return "login";
    }

    /**
     * 检查账号是否在其他地方登录
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "check-login", produces = "application/json; charset=utf-8")
    public Message checkLogin() {
        LoginUser loginUser = LoginUser.getLoginUser();
        if (loginUser == null) {
            getSession().invalidate();
            logService.logout(getRequest(), "登录状态异常：loginUser为空");
            return Message.fail("请重新登录系统");
        }

        String sessionId = SessionSave.getSessionIdSave().get(loginUser.getLoginNo());
        if (StringUtils.isBlank(sessionId)) {
            getSession().invalidate();
            logService.logout(getRequest(), "登录状态异常：sessionId为空");
            return Message.fail("请重新登录系统");
        }

        String currentSessionId = getSession().getId();
        if (!sessionId.equals(currentSessionId)) {
            getSession().invalidate();
            logService.logout(getRequest(), "登录状态异常：异地登录");
            return Message.fail("当前账号已在其他地方登录");
        }

        return Message.success("ok");
    }
}
