package com.chanus.yuntao.boot.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chanus.yuntao.boot.framework.base.service.impl.BaseServiceImpl;
import com.chanus.yuntao.boot.manager.mapper.RoleMapper;
import com.chanus.yuntao.boot.manager.mapper.RoleModulePowerMapper;
import com.chanus.yuntao.boot.manager.model.Role;
import com.chanus.yuntao.boot.manager.model.RoleModulePower;
import com.chanus.yuntao.boot.manager.service.RoleService;
import com.chanus.yuntao.utils.core.ArrayUtils;
import com.chanus.yuntao.utils.core.CollectionUtils;
import com.chanus.yuntao.utils.core.StringUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import com.chanus.yuntao.utils.core.map.CustomMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 角色管理接口实现
 *
 * @author Chanus
 * @date 2020-08-07 15:05:33
 * @since 1.0.0
 */
@Service
public class RoleServiceImpl extends BaseServiceImpl<RoleMapper, Role> implements RoleService {
    private static final Logger LOGGER = LoggerFactory.getLogger(RoleServiceImpl.class);

    @Autowired
    private RoleModulePowerMapper roleModulePowerMapper;

    @Override
    public Message insert(Role t) {
        // 获取最大角色，用来生成新的角色ID
        String roleId = getBaseMapper().getMaxRoleId(t.getParentRoleId());
        t.setRoleId(StringUtils.isBlank(roleId) ? (t.getParentRoleId() + "10") : String.valueOf(Integer.parseInt(roleId) + 1));
        // 如果没有填写角色代码，则默认为角色ID
        if (StringUtils.isBlank(t.getRoleCode()))
            t.setRoleCode(t.getRoleId());
        // 获取最大排序值，用来设置角色的排序
        Integer priority = getBaseMapper().getMaxPriority(t.getParentRoleId());
        t.setPriority(priority == null ? 1 : (priority + 1));
        // 获取上级角色信息，设置上级角色代码
        Role parent = getBaseMapper().selectOne(new QueryWrapper<Role>().lambda().eq(Role::getRoleId, t.getParentRoleId()));
        if (parent == null)
            t.setSuperior(t.getRoleCode());
        else
            t.setSuperior(parent.getSuperior() + "," + t.getRoleCode());

        return super.insert(t);
    }

    @Override
    public String createTree(String roleCode, String hasOperator) {
        StringBuilder tree = new StringBuilder("[");
        // 上级角色
        Role p = getBaseMapper().getParentRole(roleCode);
        // 构建一个角色列表根节点
        tree.append("{\"id\":\"").append(p == null ? "-1" : p.getRoleId())
                .append("\", \"roleCode\":\"").append(p == null ? "-1" : p.getRoleCode())// 根节点设置上级角色的角色代码
                .append("\", \"pId\":\"-1\", \"name\":\"角色列表\", \"open\":true")
                .append(", \"icon\":\"../../lib/zTree/zTreeStyle/img/diy/1_open.png\"")
                .append(", \"iconOpen\":\"../../lib/zTree/zTreeStyle/img/diy/1_open.png\"")
                .append(", \"iconClose\":\"../../lib/zTree/zTreeStyle/img/diy/1_close.png\"}");
        try {
            // 构建角色列表目录节点
            CustomMap params = CustomMap.create().putNext("roleCode", roleCode).putNext("hasOperator", hasOperator);
            List<Role> roles = getBaseMapper().list(params);
            if (CollectionUtils.isNotEmpty(roles)) {
                for (Role role : roles) {
                    tree.append(", {\"id\":\"").append(role.getRoleId())
                            .append("\", \"roleCode\":\"").append(role.getRoleCode())
                            .append("\", \"hasOperator\":\"").append(role.getHasOperator())
                            .append("\", \"pId\":\"").append(role.getParentRoleId())
                            .append("\", \"name\":\"").append(role.getRoleName())
                            .append("\", \"icon\":\"../../lib/zTree/zTreeStyle/img/diy/9.png\"}");
                }
            }
        } catch (Exception e) {
            LOGGER.error("获取角色列表，系统异常", e);
        }
        tree.append("]");

        return tree.toString();
    }

    @Transactional
    @Override
    public Message grantRoleModulePower(String roleCode, String[] modulePowers) {
        if (StringUtils.isBlank(roleCode))
            return Message.fail("请选择被授权的角色");

        // 先删除角色原有权限
        roleModulePowerMapper.deleteByRoleCode(roleCode);
        // 再写入新的角色权限
        if (ArrayUtils.isNotEmpty(modulePowers)) {
            List<RoleModulePower> roleModulePowers = new ArrayList<>();
            RoleModulePower roleModulePower;
            for (String s : modulePowers) {
                roleModulePower = new RoleModulePower();
                roleModulePower.setRoleCode(roleCode);
                String[] mp = s.split("\\.");
                roleModulePower.setModuleCode(mp[0]);
                roleModulePower.setPowerItem(mp[1]);
                roleModulePower.setSubNo(StringUtils.EMPTY);
                roleModulePowers.add(roleModulePower);
            }
            roleModulePowerMapper.insertBatch(roleModulePowers);
        }

        return Message.success("角色授权成功");
    }

}
