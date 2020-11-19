package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.manager.model.DataBaseColumn;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 数据库表字段
 *
 * @author Chanus
 * @date 2020-08-03 14:21:56
 * @since 1.0.0
 */
@Mapper
public interface DataBaseColumnMapper {
    int count(Map<String, Object> params);

    List<DataBaseColumn> list(Map<String, Object> params);
}
