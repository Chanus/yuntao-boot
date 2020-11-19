package com.chanus.yuntao.boot.manager.service;

import com.chanus.yuntao.boot.framework.base.service.BaseService;
import com.chanus.yuntao.boot.manager.model.Organization;
import com.chanus.yuntao.utils.core.lang.Message;

/**
 * 组织机构管理接口
 *
 * @author Chanus
 * @date 2020-08-10 11:40:42
 * @since 1.0.0
 */
public interface OrganizationService extends BaseService<Organization> {
    /**
     * 创建组织机构树
     *
     * @return
     */
    String createTree();

    /**
     * 修改组织机构排序
     *
     * @param orgId    组织机构ID
     * @param priority 组织机构排序
     * @return
     */
    Message priority(Integer orgId, Integer priority);
}
