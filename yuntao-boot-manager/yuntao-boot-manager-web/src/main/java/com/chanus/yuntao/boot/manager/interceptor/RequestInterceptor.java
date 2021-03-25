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
package com.chanus.yuntao.boot.manager.interceptor;

import com.chanus.yuntao.boot.common.pojo.LoginUser;
import com.chanus.yuntao.utils.core.CollectionUtils;
import com.chanus.yuntao.utils.core.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 请求地址拦截器
 *
 * @author Chanus
 * @date 2020-08-03 15:09:35
 * @since 1.0.0
 */
public class RequestInterceptor implements HandlerInterceptor {
    private static final String LOGIN_URL = "/relogin";

    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) {

    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) {

    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        HttpSession session = request.getSession(true);
        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");// 登录账号信息

        // 验证用户是否登录
        if (loginUser == null || StringUtils.isBlank(loginUser.getLoginNo()) || StringUtils.isBlank(loginUser.getRoleCode()) || CollectionUtils.isEmpty(loginUser.getMenus())) {
            // 判断是否为ajax请求
            if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
                response.setCharacterEncoding("UTF-8");
                response.setHeader("Content-Type", "text/html;charset=UTF-8");
                response.getWriter().print("{\"code\":401,\"msg\":\"登录超时\"}");
                return false;
            } else {
                response.sendRedirect(request.getContextPath() + LOGIN_URL);
                return false;
            }
        }

        LoginUser.setLoginUser(loginUser);

        // 验证请求URL是否有效
        if (CollectionUtils.isEmpty(loginUser.getUrls()) || !loginUser.getUrls().contains(request.getServletPath())) {
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Type", "text/html;charset=UTF-8");
            response.getWriter().print("{\"code\":404,\"msg\":\"未找到资源：" + request.getServletPath() + "\"}");
            return false;
        }

        return true;
    }
}
