package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.manager.model.DataBaseTable;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 数据库表
 *
 * @author Chanus
 * @date 2020-08-03 14:31:16
 * @since 1.0.0
 */
@Mapper
public interface DataBaseTableMapper {
    int count(Map<String, Object> params);

    List<DataBaseTable> list(Map<String, Object> params);

    DataBaseTable get(@Param("tableSchema") String tableSchema, @Param("tableName") String tableName);
}
