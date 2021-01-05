/*
 * Copyright (c) 2018, Chanus and/or its affiliates. All rights reserved.
 */
package com.chanus.yuntao.boot.manager.service.impl;

import com.chanus.yuntao.boot.common.constant.Constants;
import com.chanus.yuntao.boot.common.pojo.LoginUser;
import com.chanus.yuntao.boot.manager.common.CacheData;
import com.chanus.yuntao.boot.manager.mapper.LoginUserViewMapper;
import com.chanus.yuntao.boot.manager.mapper.ModuleMapper;
import com.chanus.yuntao.boot.manager.mapper.RoleMapper;
import com.chanus.yuntao.boot.manager.mapper.WhiteIpMapper;
import com.chanus.yuntao.boot.manager.model.LoginUserView;
import com.chanus.yuntao.boot.manager.model.Module;
import com.chanus.yuntao.boot.manager.model.Role;
import com.chanus.yuntao.boot.manager.service.LoginUserService;
import com.chanus.yuntao.utils.core.ArrayUtils;
import com.chanus.yuntao.utils.core.CollectionUtils;
import com.chanus.yuntao.utils.core.StringUtils;
import com.chanus.yuntao.utils.core.encrypt.SHAUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import com.chanus.yuntao.utils.core.map.CustomMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 登录用户接口实现
 *
 * @author Chanus
 * @date 2018-09-02 01:19:26
 * @since 1.0.0
 */
@Service
public class LoginUserServiceImpl implements LoginUserService {
    @Autowired
    private LoginUserViewMapper loginUserViewMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private ModuleMapper moduleMapper;
    @Autowired
    private WhiteIpMapper whiteIpMapper;

    @Override
    public Message login(String loginNo, String password, String loginIp) {
        if (StringUtils.isBlank(loginNo))
            return Message.fail("登录账号不能为空");
        if (StringUtils.isBlank(password))
            return Message.fail("登录密码不能为空");

        // 验证IP白名单
        if (Constants.STATUS_YES.equals(CacheData.SYSTEM_PARAMS_MAP.get("sys_check_white_ip"))) {
            if (StringUtils.isBlank(loginIp))
                return Message.fail("登录IP为空");

            // 验证用户是否固定IP
            String fixedWhiteIps = whiteIpMapper.getFixedWhiteIps(loginNo);
            if (StringUtils.isNotBlank(fixedWhiteIps) && !StringUtils.contains(fixedWhiteIps + ",", loginIp + ",")) {// 用户固定IP，登录IP必须存在于该IP白名单才能登录
                return Message.fail("当前IP不允许登录");
            } else if (StringUtils.isBlank(fixedWhiteIps)) {// 用户没有固定IP，登录IP存在于任何一组白名单IP中即可登录
                int whiteIpsCount = whiteIpMapper.count(CustomMap.create().putNext("validStatus", Constants.STATUS_YES).putNext("fixedStatus", Constants.STATUS_NO).putNext("whiteIp", loginIp).putNext("loginNo", loginNo));
                if (whiteIpsCount == 0)
                    return Message.fail("当前IP不允许登录");
            }
        }

        LoginUserView loginUserView = loginUserViewMapper.selectLoginUser(loginNo);
        if (loginUserView == null)
            return Message.fail("当前用户不存在");
        if (Constants.STATUS_NO.equals(loginUserView.getValidStatus()))
            return Message.fail("当前用户不可用");
        if (!SHAUtils.verifySHA256(password + loginNo, loginUserView.getPassword()))
            return Message.fail("登录密码不正确");

        Role role = roleMapper.getLoginStatus(loginUserView.getRoleCode());
        if (role == null)
            return Message.fail("当前用户角色不存在");
        if (Constants.STATUS_NO.equals(role.getValidStatus()))
            return Message.fail("当前用户角色被禁用");
        if (Constants.STATUS_NO.equals(role.getLoginFlag()))
            return Message.fail("当前用户角色不允许登录系统");

        List<Module> menus = moduleMapper.listMenu(loginUserView.getRoleCode(), loginUserView.getLoginNo());
        if (CollectionUtils.isEmpty(menus))
            return Message.fail("当前用户没有系统权限");

        LoginUser loginUser = new LoginUser().setLoginNo(loginUserView.getLoginNo())
                .setLoginName(loginUserView.getLoginName()).setRoleCode(loginUserView.getRoleCode())
                .setMasterNo(StringUtils.defaultIfBlank(loginUserView.getMasterNo(), loginUserView.getLoginNo()))
                .setMasterRoleCode(StringUtils.defaultIfBlank(loginUserView.getMasterRoleCode(), loginUserView.getRoleCode()))
                .setLoginIp(loginIp).setHeadImage(loginUserView.getHeadImage()).setMenus(menus)
                .setUrls(moduleMapper.listUrl(loginUserView.getRoleCode(), loginUserView.getLoginNo()));
        LoginUser.setLoginUser(loginUser);

        return Message.success("登录成功").setData(loginUser);
    }

    @Override
    public Message login(String loginNo, String password, String roleCode, String loginIp) {
        if (StringUtils.isBlank(loginNo))
            return Message.fail("登录账号不能为空");
        if (StringUtils.isBlank(password))
            return Message.fail("登录密码不能为空");

        // 验证IP白名单
        if (Constants.STATUS_YES.equals(CacheData.SYSTEM_PARAMS_MAP.get("sys_check_white_ip"))) {
            if (StringUtils.isBlank(loginIp))
                return Message.fail("登录IP为空");

            // 验证用户是否固定IP
            String fixedWhiteIps = whiteIpMapper.getFixedWhiteIps(loginNo);
            if (StringUtils.isNotBlank(fixedWhiteIps) && !StringUtils.contains(fixedWhiteIps + ",", loginIp + ",")) {// 用户固定IP，登录IP必须存在于该IP白名单才能登录
                return Message.fail("当前IP不允许登录");
            } else if (StringUtils.isBlank(fixedWhiteIps)) {// 用户没有固定IP，登录IP存在于任何一组白名单IP中即可登录
                int whiteIpsCount = whiteIpMapper.count(CustomMap.create().putNext("validStatus", Constants.STATUS_YES).putNext("fixedStatus", Constants.STATUS_NO).putNext("whiteIp", loginIp).putNext("loginNo", loginNo));
                if (whiteIpsCount == 0)
                    return Message.fail("当前IP不允许登录");
            }
        }

        LoginUserView loginUserView = loginUserViewMapper.selectLoginUser(loginNo);
        if (loginUserView == null)
            return Message.fail("当前用户不存在");
        if (Constants.STATUS_NO.equals(loginUserView.getValidStatus()))
            return Message.fail("当前用户不可用");
        if (!SHAUtils.verifySHA256(password + loginNo, loginUserView.getPassword()))
            return Message.fail("登录密码不正确");
        if (StringUtils.isBlank(loginUserView.getRoleCode()))
            return Message.fail("当前用户角色不存在");
        String[] userRoleCodes = loginUserView.getRoleCode().split(",");
        if (!ArrayUtils.contains(userRoleCodes, roleCode))
            return Message.fail("当前用户角色不存在");

        Role role = roleMapper.getLoginStatus(roleCode);
        if (role == null)
            return Message.fail("当前用户角色不存在");
        if (Constants.STATUS_NO.equals(role.getValidStatus()))
            return Message.fail("当前用户角色被禁用");
        if (Constants.STATUS_NO.equals(role.getLoginFlag()))
            return Message.fail("当前用户角色不允许登录系统");

        List<Module> menus = moduleMapper.listMenu(roleCode, loginUserView.getLoginNo());
        if (CollectionUtils.isEmpty(menus))
            return Message.fail("当前用户没有系统权限");

        LoginUser loginUser = new LoginUser().setLoginNo(loginUserView.getLoginNo())
                .setLoginName(loginUserView.getLoginName()).setRoleCode(roleCode)
                .setMasterNo(StringUtils.defaultIfBlank(loginUserView.getMasterNo(), loginUserView.getLoginNo()))
                .setMasterRoleCode(StringUtils.defaultIfBlank(loginUserView.getMasterRoleCode(), roleCode))
                .setLoginIp(loginIp).setHeadImage(loginUserView.getHeadImage()).setMenus(menus)
                .setUrls(moduleMapper.listUrl(roleCode, loginUserView.getLoginNo()));
        LoginUser.setLoginUser(loginUser);

        return Message.success("登录成功").setData(loginUser);
    }

    @Override
    public LoginUserView getLoginUser(String loginNo) {
        return loginUserViewMapper.selectLoginUser(loginNo);
    }

    @Override
    public CustomMap getUserByUserNo(String userNo) {
        return loginUserViewMapper.selectUserByUserNo(userNo);
    }

    @Override
    public CustomMap getUser(String column, String value) {
        return loginUserViewMapper.selectUser(column, value);
    }
}
