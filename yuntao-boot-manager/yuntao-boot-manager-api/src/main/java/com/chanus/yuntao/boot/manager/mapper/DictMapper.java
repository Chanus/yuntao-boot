package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.framework.base.mapper.BaseMapper;
import com.chanus.yuntao.boot.manager.model.Dict;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 系统字典集表
 *
 * @author Chanus
 * @date 2020-08-10 16:06:05
 * @since 1.0.0
 */
@Mapper
public interface DictMapper extends BaseMapper<Dict> {
    List<Dict> listWithDictItems(String validStatus);
}