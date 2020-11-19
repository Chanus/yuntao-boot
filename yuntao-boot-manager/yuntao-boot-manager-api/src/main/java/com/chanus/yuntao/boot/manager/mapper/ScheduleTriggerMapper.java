package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.framework.base.mapper.BaseMapper;
import com.chanus.yuntao.boot.manager.model.ScheduleTrigger;
import org.apache.ibatis.annotations.Mapper;

/**
 * 定时任务触发器表表
 *
 * @author Chanus
 * @date 2020-08-10 17:38:22
 * @since 1.0.0
 */
@Mapper
public interface ScheduleTriggerMapper extends BaseMapper<ScheduleTrigger> {

}