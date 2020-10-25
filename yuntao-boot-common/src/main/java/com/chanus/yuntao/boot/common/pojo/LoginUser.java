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
package com.chanus.yuntao.boot.common.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * 登录用户信息
 *
 * @author Chanus
 * @date 2020-08-01 15:04:49
 * @since 0.0.2
 */
public class LoginUser implements Serializable {
    private static final long serialVersionUID = 6566819014694869372L;

    /**
     * 登录用户本地线程
     */
    public static ThreadLocal<LoginUser> loginUserThread = new ThreadLocal<>();

    /**
     * 用户账号
     */
    private String loginNo;

    /**
     * 用户名称
     */
    private String loginName;

    /**
     * 用户角色代码
     */
    private String roleCode;

    /**
     * 用户主账号，如果用户是子账号，则存放其主账号，否则为用户账号本身
     */
    private String masterNo;

    /**
     * 用户主账号角色代码，如果用户是子账号，则存放其主账号角色代码，否则为用户账号本身角色代码
     */
    private String masterRoleCode;

    /**
     * 用户登录IP
     */
    private String loginIp;

    /**
     * 用户头像图片路径
     */
    private String headImage;

    /**
     * 用户其他信息
     */
    private Object object;

    /**
     * 用户菜单列表
     */
    private List<?> menus;

    /**
     * 用户请求URL列表
     */
    private List<String> urls;

    /**
     * 设置登录用户信息
     *
     * @param loginUser 登录用户信息
     * @since 0.0.1
     */
    public static void setLoginUser(LoginUser loginUser) {
        loginUserThread.set(loginUser);
    }

    /**
     * 获取登录用户信息
     *
     * @return 当前登录用户信息
     * @since 0.0.1
     */
    public static LoginUser getLoginUser() {
        return loginUserThread.get();
    }

    /**
     * 清除登录用户信息
     *
     * @since 0.0.1
     */
    public static void removeLoginUser() {
        loginUserThread.remove();
    }

    public String getLoginNo() {
        return loginNo;
    }

    public LoginUser setLoginNo(String loginNo) {
        this.loginNo = loginNo;
        return this;
    }

    public String getLoginName() {
        return loginName;
    }

    public LoginUser setLoginName(String loginName) {
        this.loginName = loginName;
        return this;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public LoginUser setRoleCode(String roleCode) {
        this.roleCode = roleCode;
        return this;
    }

    public String getMasterNo() {
        return masterNo;
    }

    public LoginUser setMasterNo(String masterNo) {
        this.masterNo = masterNo;
        return this;
    }

    public String getMasterRoleCode() {
        return masterRoleCode;
    }

    public LoginUser setMasterRoleCode(String masterRoleCode) {
        this.masterRoleCode = masterRoleCode;
        return this;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public LoginUser setLoginIp(String loginIp) {
        this.loginIp = loginIp;
        return this;
    }

    public String getHeadImage() {
        return headImage;
    }

    public LoginUser setHeadImage(String headImage) {
        this.headImage = headImage;
        return this;
    }

    public Object getObject() {
        return object;
    }

    public LoginUser setObject(Object object) {
        this.object = object;
        return this;
    }

    public List<?> getMenus() {
        return menus;
    }

    public LoginUser setMenus(List<?> menus) {
        this.menus = menus;
        return this;
    }

    public List<String> getUrls() {
        return urls;
    }

    public LoginUser setUrls(List<String> urls) {
        this.urls = urls;
        return this;
    }

    @Override
    public String toString() {
        return "LoginUser [" +
                "loginNo=" + loginNo +
                ", loginName=" + loginName +
                ", roleCode=" + roleCode +
                ", masterNo=" + masterNo +
                ", masterRoleCode=" + masterRoleCode +
                ", loginIp=" + loginIp +
                ", headImage=" + headImage +
                ", object=" + object +
                "]";
    }
}
