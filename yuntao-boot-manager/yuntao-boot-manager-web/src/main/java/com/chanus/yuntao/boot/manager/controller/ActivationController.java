package com.chanus.yuntao.boot.manager.controller;

import com.chanus.yuntao.boot.common.constant.Constants;
import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.manager.service.ActivationService;
import com.chanus.yuntao.utils.core.lang.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/**
 * 系统激活
 *
 * @author Chanus
 * @date 2021-09-13 15:11:01
 * @since 1.2.0
 */
@Controller
public class ActivationController extends BaseController {
    @Autowired
    private ActivationService activationService;

    /**
     * 跳转到系统未激活提示页面
     *
     * @return
     */
    @GetMapping(value = "activation")
    public String activation(HttpServletRequest request) {
        ServletContext servletContext = request.getServletContext();
        String activationStatus = (String) servletContext.getAttribute("activationStatus");

        return Constants.STATUS_NO.equals(activationStatus) ? "activation/activation" : "login";
    }

    /**
     * 跳转到系统激活页面
     *
     * @return
     */
    @GetMapping(value = "activation/activate")
    public String activate() {
        return "activation/activate";
    }

    /**
     * 系统激活
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "activation/activate", produces = "application/json; charset=utf-8")
    public Message activate(String activationCode) {
        return activationService.activate(activationCode);
    }

}
