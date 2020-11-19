package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.framework.base.mapper.BaseMapper;
import com.chanus.yuntao.boot.manager.model.Param;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

/**
 * 系统基础参数表
 *
 * @author Chanus
 * @date 2020-08-06 15:45:26
 * @since 1.0.0
 */
@Mapper
public interface ParamMapper extends BaseMapper<Param> {
    @Select("select max(priority) from sys_param")
    Integer getMaxPriority();

    int priority(Map<String, Object> params);
}