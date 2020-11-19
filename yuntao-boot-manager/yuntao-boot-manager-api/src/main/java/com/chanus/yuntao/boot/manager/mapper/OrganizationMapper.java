package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.framework.base.mapper.BaseMapper;
import com.chanus.yuntao.boot.manager.model.Organization;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * 组织结构表
 *
 * @author Chanus
 * @date 2020-08-10 11:40:42
 * @since 1.0.0
 */
@Mapper
public interface OrganizationMapper extends BaseMapper<Organization> {
    @Select("select max(priority) from sys_organization where org_parent_id = #{orgParentId,jdbcType=INTEGER}")
    Integer getMaxPriority(Integer orgParentId);

    @Select("select 1 from sys_organization where org_parent_id = #{orgParentId,jdbcType=INTEGER} limit 1")
    Integer isExistLower(Integer orgParentId);

    @Update("update sys_organization set priority = #{priority,jdbcType=INTEGER} where org_id = #{orgId,jdbcType=INTEGER}")
    int priority(@Param("orgId") Integer orgId, @Param("priority") Integer priority);
}