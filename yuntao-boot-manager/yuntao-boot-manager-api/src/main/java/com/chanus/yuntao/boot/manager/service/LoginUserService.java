/*
 * Copyright (c) 2018, Chanus and/or its affiliates. All rights reserved.
 */
package com.chanus.yuntao.boot.manager.service;

import com.chanus.yuntao.boot.manager.model.LoginUserView;
import com.chanus.yuntao.utils.core.lang.Message;
import com.chanus.yuntao.utils.core.map.CustomMap;

/**
 * 登录用户接口
 *
 * @author Chanus
 * @date 2018-09-02 01:15:21
 * @since 1.0.0
 */
public interface LoginUserService {
    /**
     * 用户登录
     *
     * @param loginNo  登录账号
     * @param password 登录密码
     * @param loginIp  登录IP
     * @return
     * @since 1.0.0
     */
    Message login(String loginNo, String password, String loginIp);

    /**
     * 用户指定角色登录
     *
     * @param loginNo  登录账号
     * @param password 登录密码
     * @param roleCode 登录角色
     * @param loginIp  登录IP
     * @return
     */
    Message login(String loginNo, String password, String roleCode, String loginIp);

    /**
     * 根据登录账号获取用户信息，区分账号字母大小写
     *
     * @param loginNo 登录账号
     * @return
     */
    LoginUserView getLoginUser(String loginNo);

    /**
     * 根据用户账号获取用户信息
     *
     * @param userNo 用户账号
     * @return
     * @since 1.1.0
     */
    CustomMap getUserByUserNo(String userNo);

    /**
     * 根据指定字段获取用户信息
     *
     * @param column 表字段
     * @param value  条件值
     * @return
     * @since 1.1.0
     */
    CustomMap getUser(String column, String value);
}
