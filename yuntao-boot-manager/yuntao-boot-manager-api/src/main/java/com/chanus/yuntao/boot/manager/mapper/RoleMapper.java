package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.framework.base.mapper.BaseMapper;
import com.chanus.yuntao.boot.manager.model.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * 系统角色表
 *
 * @author Chanus
 * @date 2020-08-07 15:05:33
 * @since 1.0.0
 */
@Mapper
public interface RoleMapper extends BaseMapper<Role> {
    Role getParentRole(String roleCode);

    @Select("select login_flag, valid_status from sys_role where role_code = #{roleCode,jdbcType=VARCHAR}")
    Role getLoginStatus(String roleCode);

    @Select("select max(role_id) from sys_role where parent_role_id = #{parentRoleId,jdbcType=VARCHAR}")
    String getMaxRoleId(String parentRoleId);

    @Select("select max(priority) from sys_role where parent_role_id = #{parentRoleId,jdbcType=VARCHAR}")
    Integer getMaxPriority(String parentRoleId);
}