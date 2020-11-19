package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.manager.model.RoleModulePower;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 系统角色权限表
 *
 * @author Chanus
 * @date 2020-08-01 09:23:20
 * @since 1.0.0
 */
@Mapper
public interface RoleModulePowerMapper {
    int deleteByRoleCode(String roleCode);

    int deleteBySubNo(String subNo);

    int insertBatch(List<RoleModulePower> list);
}