package com.chanus.yuntao.boot.manager.service;

import com.chanus.yuntao.boot.framework.base.service.BaseService;
import com.chanus.yuntao.boot.manager.model.Power;
import com.chanus.yuntao.utils.core.lang.Message;

import java.util.Map;

/**
 * 权限项管理接口
 *
 * @author Chanus
 * @date 2020-08-06 14:13:16
 * @since 1.0.0
 */
public interface PowerService extends BaseService<Power> {
    /**
     * 调整权限项优先级
     *
     * @param params <priority>    当前权限项的优先级
     *               <direction>   up-提升优先级，down-降低优先级，top-置顶优先级
     * @return
     */
    Message priority(Map<String, Object> params);
}
