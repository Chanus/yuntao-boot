package com.chanus.yuntao.boot.manager.service;

import com.chanus.yuntao.boot.framework.base.service.BaseService;
import com.chanus.yuntao.boot.manager.model.Role;
import com.chanus.yuntao.utils.core.lang.Message;

/**
 * 角色管理接口
 *
 * @author Chanus
 * @date 2020-08-07 15:05:33
 * @since 1.0.0
 */
public interface RoleService extends BaseService<Role> {
    /**
     * 创建角色树
     *
     * @param roleCode    角色代码
     * @param hasOperator 是否可以创建操作员：0-不能，1-能
     * @return
     */
    String createTree(String roleCode, String hasOperator);

    /**
     * 创建角色树
     *
     * @param roleCode 角色代码
     * @return
     */
    default String createTree(String roleCode) {
        return createTree(roleCode, null);
    }

    /**
     * 角色授权
     *
     * @param roleCode     角色代码
     * @param modulePowers 模块-权限项数组
     * @return
     */
    Message grantRoleModulePower(String roleCode, String[] modulePowers);
}
