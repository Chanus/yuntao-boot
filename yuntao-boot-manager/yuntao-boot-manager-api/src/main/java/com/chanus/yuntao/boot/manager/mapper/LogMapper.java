package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.manager.model.Log;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 系统操作日志表
 *
 * @author Chanus
 * @date 2020-08-01 14:36:16
 * @since 1.0.0
 */
@Mapper
public interface LogMapper {
    Log get(Long id);

    int insertSelective(Log record);

    int count(Map<String, Object> params);

    List<Log> list(Map<String, Object> params);

    Log getLastLoginInfo(String operateNo);

    @Delete("delete from sys_log where id = #{id,jdbcType=INTEGER}")
    int delete(Long id);

    @Delete("truncate sys_log")
    int clear();
}