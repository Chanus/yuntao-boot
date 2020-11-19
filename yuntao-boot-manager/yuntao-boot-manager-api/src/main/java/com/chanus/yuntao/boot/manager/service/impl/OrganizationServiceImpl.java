package com.chanus.yuntao.boot.manager.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.chanus.yuntao.boot.framework.base.service.impl.BaseServiceImpl;
import com.chanus.yuntao.boot.manager.mapper.OrganizationMapper;
import com.chanus.yuntao.boot.manager.model.Organization;
import com.chanus.yuntao.boot.manager.service.OrganizationService;
import com.chanus.yuntao.utils.core.CollectionUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

/**
 * 组织机构管理接口实现
 *
 * @author Chanus
 * @date 2020-08-10 11:40:42
 * @since 1.0.0
 */
@Service
public class OrganizationServiceImpl extends BaseServiceImpl<OrganizationMapper, Organization> implements OrganizationService {
    @Override
    public Message insert(Organization t) {
        if (t.getOrgParentId() == null)
            t.setOrgParentId(0);

        Integer priority = getBaseMapper().getMaxPriority(t.getOrgParentId());
        t.setPriority(priority == null ? 1 : (priority + 1));

        return super.insert(t);
    }

    @Override
    public Message delete(Serializable pk) {
        Integer count = getBaseMapper().isExistLower((Integer) pk);
        if (count != null)
            return Message.fail("请先删除下级组织机构");

        return super.delete(pk);
    }

    @Override
    public Message delete(Collection<? extends Serializable> pks) {
        Integer count;
        for (Serializable i : pks) {
            count = getBaseMapper().isExistLower((Integer) i);
            if (count != null)
                return Message.fail("请先删除下级组织机构");
        }

        return super.delete(pks);
    }

    @Override
    public String createTree() {
        StringBuilder tree = new StringBuilder("[");
        // 构建一个组织机构列表根节点
        tree.append("{\"id\":0, \"pId\":0, \"name\":\"组织机构\", \"open\":true")
                .append(", \"icon\":\"../../lib/zTree/zTreeStyle/img/diy/1_open.png\"")
                .append(", \"iconOpen\":\"../../lib/zTree/zTreeStyle/img/diy/1_open.png\"")
                .append(", \"iconClose\":\"../../lib/zTree/zTreeStyle/img/diy/1_close.png\"}");
        try {
            // 构建组织机构列表目录节点
            List<Organization> organizations = getBaseMapper().selectList(Wrappers.emptyWrapper());
            if (CollectionUtils.isNotEmpty(organizations)) {
                for (Organization organization : organizations) {
                    tree.append(", {\"id\":\"").append(organization.getOrgId())
                            .append("\", \"pId\":\"").append(organization.getOrgParentId())
                            .append("\", \"name\":\"").append(organization.getOrgName())
                            .append("\", \"icon\":\"../../lib/zTree/zTreeStyle/img/diy/9.png\"}");
                }
            }
        } catch (Exception e) {
            logger.error("获取组织机构列表，系统异常", e);
        }
        tree.append("]");

        return tree.toString();
    }

    @Override
    public Message priority(Integer orgId, Integer priority) {
        getBaseMapper().priority(orgId, priority);
        return Message.success("排序修改成功");
    }
}
