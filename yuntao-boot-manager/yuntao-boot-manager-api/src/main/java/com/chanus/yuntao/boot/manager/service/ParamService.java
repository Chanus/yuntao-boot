package com.chanus.yuntao.boot.manager.service;

import com.chanus.yuntao.boot.framework.base.service.BaseService;
import com.chanus.yuntao.boot.manager.model.Param;
import com.chanus.yuntao.utils.core.lang.Message;

import java.util.Map;

/**
 * 系统参数配置接口
 *
 * @author Chanus
 * @date 2020-08-06 15:45:26
 * @since 1.0.0
 */
public interface ParamService extends BaseService<Param> {
    /**
     * 调整系统参数优先级
     *
     * @param params <priority>    当前系统参数的优先级
     *               <direction>   up-提升优先级，down-降低优先级，top-置顶优先级
     * @return
     */
    Message priority(Map<String, Object> params);

    /**
     * 重载有效的系统参数
     *
     * @return
     */
    Message reloadParam();
}
