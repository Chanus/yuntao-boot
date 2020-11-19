package com.chanus.yuntao.boot.manager.service;

import com.chanus.yuntao.boot.framework.base.service.BaseService;
import com.chanus.yuntao.boot.manager.model.Module;
import com.chanus.yuntao.utils.core.lang.Message;

import java.util.List;
import java.util.Map;

/**
 * 模块管理接口
 *
 * @author Chanus
 * @date 2020-08-06 17:34:31
 * @since 1.0.0
 */
public interface ModuleService extends BaseService<Module> {
    /**
     * 创建模块树
     *
     * @return
     */
    String createTree();

    /**
     * 调整模块优先级
     *
     * @param params <moduleId>     模块ID
     *               <direction>    up-提升优先级，down-降低优先级
     * @return
     */
    Message priority(Map<String, Object> params);

    /**
     * 获取角色的模块权限列表
     *
     * @param roleCode 角色代码
     * @return
     */
    List<Module> listRoleModulePower(String roleCode);

    /**
     * 获取子账号的模块权限列表
     *
     * @param subNo          子账号
     * @param masterRoleCode 主账号角色
     * @return
     */
    List<Module> listSubModulePower(String subNo, String masterRoleCode);

    /**
     * 获取角色的首页菜单
     *
     * @param roleCode 角色代码
     * @param subNo    子账号，如果roleCode==1则必需，否则无实际意义
     * @return
     */
    List<Module> listMenu(String roleCode, String subNo);

    /**
     * 获取角色的有效请求url
     *
     * @param roleCode 角色代码
     * @param subNo    子账号，如果roleCode==1则必需，否则无实际意义
     * @return
     */
    List<String> listUrl(String roleCode, String subNo);

    /**
     * 模块迁移
     *
     * @param moduleId       待迁移的模块ID
     * @param moduleParentId 要迁移到的模块ID
     * @return
     */
    Message transfer(Integer moduleId, Integer moduleParentId);
}
