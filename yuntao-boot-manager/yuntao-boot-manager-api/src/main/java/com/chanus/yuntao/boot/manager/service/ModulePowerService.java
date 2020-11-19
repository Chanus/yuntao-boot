package com.chanus.yuntao.boot.manager.service;

import com.chanus.yuntao.boot.framework.base.service.BaseService;
import com.chanus.yuntao.boot.manager.model.ModulePower;
import com.chanus.yuntao.boot.manager.model.ModulePowerMethod;
import com.chanus.yuntao.utils.core.lang.Message;

import java.util.Collection;
import java.util.List;

/**
 * 模块权限配置接口
 *
 * @author Chanus
 * @date 2020-08-07 11:47:41
 * @since 1.0.0
 */
public interface ModulePowerService extends BaseService<ModulePower> {
    /**
     * 获取模块权限项方法列表
     *
     * @param mpId 模块权限项主键
     * @return
     */
    List<ModulePowerMethod> listMethod(Integer mpId);

    /**
     * 添加模块权限项方法
     *
     * @param modulePowerMethod
     * @return
     */
    Message insertMethod(ModulePowerMethod modulePowerMethod);

    /**
     * 修改模块权限项方法
     *
     * @param modulePowerMethod
     * @return
     */
    Message updateMethod(ModulePowerMethod modulePowerMethod);

    /**
     * 删除模块权限项方法
     *
     * @param ids
     * @return
     */
    Message deleteMethod(Collection<Integer> ids);
}
