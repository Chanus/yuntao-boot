package com.chanus.yuntao.boot.manager.job;

import com.chanus.yuntao.boot.framework.utils.ApplicationContextUtils;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.service.LogService;
import com.chanus.yuntao.utils.core.LocalDateTimeUtils;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.springframework.stereotype.Component;

/**
 * 定时任务测试
 *
 * @author Chanus
 * @date 2020-08-10 18:16:50
 * @since 1.0.0
 */
@Component
public class TestJob implements Job {
    @Override
    public void execute(JobExecutionContext context) {
        System.out.println("执行定时任务......TestJob......");
        long start = System.currentTimeMillis();
        JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();
        JobDataMap triggerDataMap = context.getTrigger().getJobDataMap();
        StringBuilder s = new StringBuilder();
        s.append("时间：").append(LocalDateTimeUtils.nowDateTime())
                .append(" 任务名：").append(context.getJobDetail().getKey().getName()).append(" 任务组：").append(context.getJobDetail().getKey().getGroup())
                .append(" 任务参数：").append(jobDataMap.get("jobParams"))
                .append(" 触发器名：").append(context.getTrigger().getKey().getName()).append(" 触发器组：").append(context.getTrigger().getKey().getGroup())
                .append(" 触发器参数：").append(triggerDataMap.get("triggerParams"));
        System.out.println(s.toString());
        long end = System.currentTimeMillis();
        LogService logService = ApplicationContextUtils.getBean(LogService.class);
        logService.insert("scheduler", "0", null, "com.chanus.yuntao.boot.manager.job.TestJob.execute()", s.toString(), LogTypeEnum.SCHEDULER, "执行定时任务", (int) (end -start));
        System.out.println("执行定时任务结束......TestJob......");
    }
}
