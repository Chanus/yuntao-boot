package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.framework.base.mapper.BaseMapper;
import com.chanus.yuntao.boot.manager.model.Power;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

/**
 * 系统权限项表
 *
 * @author Chanus
 * @date 2020-08-06 14:13:16
 * @since 1.0.0
 */
@Mapper
public interface PowerMapper extends BaseMapper<Power> {
    @Select("select max(priority) from sys_power")
    Integer getMaxPriority();

    int priority(Map<String, Object> params);
}