package com.chanus.yuntao.boot.manager.service.impl;

import com.chanus.yuntao.boot.common.constant.Constants;
import com.chanus.yuntao.boot.framework.base.service.impl.BaseServiceImpl;
import com.chanus.yuntao.boot.manager.mapper.ScheduleJobMapper;
import com.chanus.yuntao.boot.manager.model.ScheduleJob;
import com.chanus.yuntao.boot.manager.model.ScheduleTrigger;
import com.chanus.yuntao.boot.manager.service.ScheduleJobService;
import com.chanus.yuntao.utils.core.CollectionUtils;
import com.chanus.yuntao.utils.core.LocalDateTimeUtils;
import com.chanus.yuntao.utils.core.StringUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import com.chanus.yuntao.utils.extra.quartz.QuartzUtils;
import org.quartz.*;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.*;

/**
 * 定时任务管理接口实现
 *
 * @author Chanus
 * @date 2020-08-10 17:26:26
 * @since 1.0.0
 */
@Service
public class ScheduleJobServiceImpl extends BaseServiceImpl<ScheduleJobMapper, ScheduleJob> implements ScheduleJobService {
    @Override
    public Message update(ScheduleJob scheduleJob) {
        // 定时任务停止后才能编辑
        String validStatus = getBaseMapper().getValidStatus(scheduleJob.getId());
        if (!Constants.STATUS_JOB_STOP.equals(validStatus))
            return Message.fail("请先停止定时任务");

        return super.update(scheduleJob);
    }

    @Override
    public Message delete(Serializable id) {
        // 先停止定时任务
        this.stop((Integer) id);

        return super.delete(Collections.singletonList(id));
    }

    @Override
    public Message delete(Collection<? extends Serializable> ids) {
        // 先停止定时任务
        for (Serializable id : ids) {
            stop((Integer) id);
        }

        return super.delete(ids);
    }

    @Override
    public Message start(Integer id) {
        ScheduleJob scheduleJob = getBaseMapper().getScheduleJob(id);
        // 定时任务状态为停止时才可以启动
        if (!Constants.STATUS_JOB_STOP.equals(scheduleJob.getValidStatus()))
            return Message.fail("定时任务未停止");
        // 定时任务未绑定有效的触发器，不能启动
        List<ScheduleTrigger> scheduleTriggers = scheduleJob.getScheduleTriggers();
        if (CollectionUtils.isEmpty(scheduleTriggers))
            return Message.fail("定时任务未绑定有效的触发器");

        try {
            // 创建调度器Scheduler
            Scheduler scheduler = QuartzUtils.getScheduler();

            // 构建定时任务
            Class<? extends Job> clazz = (Class<? extends Job>) Class.forName(scheduleJob.getJobClassName()).newInstance().getClass();
            JobDetail jobDetail = QuartzUtils.getJobDetailWithDurably(clazz, scheduleJob.getJobName(), scheduleJob.getJobGroup());
            // 设置任务属性配置
            jobDetail.getJobDataMap().put("jobParams", scheduleJob.getJobData());
            scheduler.addJob(jobDetail, true);

            // 绑定触发器
            Trigger trigger;
            for (ScheduleTrigger scheduleTrigger : scheduleTriggers) {
                trigger = QuartzUtils.getCronTrigger(scheduleTrigger.getTriggerName(), scheduleTrigger.getTriggerGroup(), scheduleTrigger.getTriggerCron(),
                        LocalDateTimeUtils.convertToDate(scheduleTrigger.getTriggerStartTime()),
                        LocalDateTimeUtils.convertToDate(scheduleTrigger.getTriggerEndTime()), scheduleTrigger.getPriority(), null, jobDetail);
                trigger.getJobDataMap().put("triggerParams", scheduleTrigger.getTriggerData());
                scheduler.scheduleJob(trigger);
            }

            // 启动调度器
            scheduler.start();
        } catch (SchedulerException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
            e.printStackTrace();
            return Message.fail("启动失败");
        }
        // 启动成功后更新任务状态
        getBaseMapper().updateValidStatus(id, Constants.STATUS_JOB_START);

        return Message.success("启动成功");
    }

    @Override
    public Message pause(Integer id) {
        ScheduleJob scheduleJob = getBaseMapper().selectById(id);
        if (Constants.STATUS_JOB_STOP.equals(scheduleJob.getValidStatus()))
            return Message.fail("定时任务已停止");
        if (Constants.STATUS_JOB_PAUSE.equals(scheduleJob.getValidStatus()))
            return Message.fail("定时任务已暂停");

        QuartzUtils.pauseJob(scheduleJob.getJobName(), scheduleJob.getJobGroup());
        // 暂停成功后更新任务状态
        getBaseMapper().updateValidStatus(id, Constants.STATUS_JOB_PAUSE);

        return Message.success("暂停成功");
    }

    @Override
    public Message resume(Integer id) {
        ScheduleJob scheduleJob = getBaseMapper().selectById(id);
        if (Constants.STATUS_JOB_STOP.equals(scheduleJob.getValidStatus()))
            return Message.fail("定时任务已停止");
        if (Constants.STATUS_JOB_START.equals(scheduleJob.getValidStatus()))
            return Message.fail("定时任务已启动");

        QuartzUtils.resumeJob(scheduleJob.getJobName(), scheduleJob.getJobGroup());
        // 暂停成功后更新任务状态
        getBaseMapper().updateValidStatus(id, Constants.STATUS_JOB_START);

        return Message.success("恢复成功");
    }

    @Override
    public Message stop(Integer id) {
        ScheduleJob scheduleJob = getBaseMapper().getScheduleJob(id);
        Map<String, String> triggerMap = new HashMap<>();
        List<ScheduleTrigger> scheduleTriggers = scheduleJob.getScheduleTriggers();
        if (CollectionUtils.isNotEmpty(scheduleTriggers)) {
            scheduleTriggers.forEach(o -> {
                triggerMap.put(o.getTriggerName(), o.getTriggerGroup());
            });
        }

        QuartzUtils.removeJob(scheduleJob.getJobName(), scheduleJob.getJobGroup(), triggerMap);
        // 停止成功后更新任务状态
        getBaseMapper().updateValidStatus(id, Constants.STATUS_JOB_STOP);

        return Message.success("停止成功");
    }

    @Override
    public Message trigger(Integer id) {
        ScheduleJob scheduleJob = getBaseMapper().selectById(id);
        JobDataMap jobDataMap = new JobDataMap();
        if (StringUtils.isNotBlank(scheduleJob.getJobData()))
            jobDataMap.put("jobParams", scheduleJob.getJobData());

        QuartzUtils.triggerJob(scheduleJob.getJobName(), scheduleJob.getJobGroup(), jobDataMap);

        return Message.success("执行成功");
    }

    @Override
    public Message startAll() {
        List<ScheduleJob> scheduleJobs = getBaseMapper().listScheduleJob();
        if (CollectionUtils.isNotEmpty(scheduleJobs)) {
            try {
                // 创建调度器Scheduler
                Scheduler scheduler = QuartzUtils.getScheduler();

                Class<? extends Job> clazz;
                JobDetail jobDetail;
                Trigger trigger;
                List<ScheduleTrigger> scheduleTriggers;
                for (ScheduleJob scheduleJob : scheduleJobs) {
                    // 构建定时任务
                    clazz = (Class<? extends Job>) Class.forName(scheduleJob.getJobClassName()).newInstance().getClass();
                    jobDetail = QuartzUtils.getJobDetailWithDurably(clazz, scheduleJob.getJobName(), scheduleJob.getJobGroup());
                    // 设置任务属性配置
                    jobDetail.getJobDataMap().put("jobParams", scheduleJob.getJobData());
                    scheduler.addJob(jobDetail, true);

                    // 绑定触发器
                    scheduleTriggers = scheduleJob.getScheduleTriggers();
                    for (ScheduleTrigger scheduleTrigger : scheduleTriggers) {
                        trigger = QuartzUtils.getCronTrigger(scheduleTrigger.getTriggerName(), scheduleTrigger.getTriggerGroup(), scheduleTrigger.getTriggerCron(),
                                LocalDateTimeUtils.convertToDate(scheduleTrigger.getTriggerStartTime()),
                                LocalDateTimeUtils.convertToDate(scheduleTrigger.getTriggerEndTime()), scheduleTrigger.getPriority(), null, jobDetail);
                        trigger.getJobDataMap().put("triggerParams", scheduleTrigger.getTriggerData());
                        scheduler.scheduleJob(trigger);
                    }
                }

                // 启动调度器
                scheduler.start();
            } catch (SchedulerException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
                e.printStackTrace();
                return Message.success("启动失败");
            }
        }

        return Message.success("启动成功");
    }
}
