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
import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.framework.configuration.system.Global;
import com.chanus.yuntao.boot.manager.annotation.Log;
import com.chanus.yuntao.boot.manager.common.CacheData;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.model.Operator;
import com.chanus.yuntao.boot.manager.service.ModuleService;
import com.chanus.yuntao.boot.manager.service.OperatorService;
import com.chanus.yuntao.utils.core.FileUtils;
import com.chanus.yuntao.utils.core.StringUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

/**
 * 系统首页
 *
 * @author Chanus
 * @date 2020-08-01 17:52:13
 * @since 1.0.0
 */
@Controller
@RequestMapping("index")
public class IndexController extends BaseController {
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private OperatorService operatorService;

    /**
     * 系统首页
     *
     * @param model
     * @return
     */
    @GetMapping(value = "index")
    public String index(Model model) {
        model.addAttribute("menus", getSession().getAttribute("menus"));
        model.addAttribute("singleLocationLogin", CacheData.SYSTEM_PARAMS_MAP.get("sys_single_location_login"));

        return "index/index";
    }

    /**
     * 重新加载权限
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "reload-authority", produces = "application/json; charset=utf-8")
    public Message reloadAuthority() {
        Message message;
        try {
            HttpSession session = getSession();
            LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
            loginUser.setMenus(moduleService.listMenu(loginUser.getRoleCode(), loginUser.getLoginNo()));
            loginUser.setUrls(moduleService.listUrl(loginUser.getRoleCode(), loginUser.getLoginNo()));
            session.setAttribute("loginUser", loginUser);
            message = Message.success("重新加载权限成功");
        } catch (Exception e) {
            LOGGER.error("重新加载权限失败", e);
            message = Message.fail("重新加载权限成功");
        }

        return message;
    }

    /**
     * 跳转到个人资料页面
     *
     * @param model
     * @return
     */
    @GetMapping(value = "user/operator-info")
    public String operatorInfo(Model model) {
        model.addAttribute("operator", operatorService.get(LoginUser.getLoginUser().getLoginNo()));
        return "index/user/operator-info";
    }

    /**
     * 修改个人资料
     *
     * @param operator
     * @return
     */
    @ResponseBody
    @Log(description = "修改个人资料", logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "user/operator-info", produces = "application/json; charset=utf-8")
    public Message operatorInfo(Operator operator) {
        return operatorService.update(operator);
    }

    /**
     * 头像上传
     *
     * @param file
     * @return
     */
    @ResponseBody
    @Log(description = "上传个人头像", logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "user/headimage", produces = "application/json; charset=utf-8")
    public Message headImage(@RequestParam("file") MultipartFile file) {
        String facePath = "face";
        String filePath = Global.profile + Constants.UPLOAD_PATH + facePath;
        Message message = upload(file, filePath);
        if (message.isSuccess()) {
            String operatorNo = LoginUser.getLoginUser().getLoginNo();
            String headImageOld = operatorService.getHeadImage(operatorNo);
            HttpSession session = getSession();
            if (StringUtils.isNotBlank(headImageOld))
                FileUtils.delete(Global.profile + headImageOld);
            String headImage = Constants.UPLOAD_PATH + facePath + "/" + message.getMap().get("fileName");
            message = operatorService.updateHeadImage(operatorNo, headImage);
            if (message.isSuccess()) {
                LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
                loginUser.setHeadImage(headImage);
                session.setAttribute("loginUser", loginUser);
            }
        }

        return message;
    }

    /**
     * 跳转到修改个人密码页面
     *
     * @return
     */
    @GetMapping(value = "user/update-own-password")
    public String updateOwnPassword() {
        return "index/user/operator-password";
    }

    /**
     * 修改个人密码
     *
     * @param oldPassword 旧密码
     * @param newPassword 新密码
     * @return
     */
    @ResponseBody
    @Log(description = "修改个人密码", logType = LogTypeEnum.UPDATE, ignore = true)
    @PostMapping(value = "user/update-own-password", produces = "application/json; charset=utf-8")
    public Message updateOwnPassword(String oldPassword, String newPassword) {
        return operatorService.updatePassword(LoginUser.getLoginUser().getLoginNo(), oldPassword, newPassword, true);
    }
}
