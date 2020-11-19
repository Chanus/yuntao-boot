package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.framework.base.mapper.BaseMapper;
import com.chanus.yuntao.boot.manager.model.ScheduleJob;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * 定时任务定义表
 *
 * @author Chanus
 * @date 2020-08-10 17:26:26
 * @since 1.0.0
 */
@Mapper
public interface ScheduleJobMapper extends BaseMapper<ScheduleJob> {
    @Select("select valid_status from sys_schedule_job where id = #{arg0,jdbcType=INTEGER}")
    String getValidStatus(Integer id);

    @Update("update sys_schedule_job set valid_status = #{validStatus,jdbcType=CHAR} where id = #{id,jdbcType=INTEGER}")
    int updateValidStatus(@Param("id") Integer id, @Param("validStatus") String validStatus);

    ScheduleJob getScheduleJob(Integer id);

    List<ScheduleJob> listScheduleJob();
}