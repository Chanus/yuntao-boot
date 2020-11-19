package com.chanus.yuntao.boot.manager.service.impl;

import com.chanus.yuntao.boot.framework.base.service.impl.BaseServiceImpl;
import com.chanus.yuntao.boot.manager.mapper.ScheduleTriggerMapper;
import com.chanus.yuntao.boot.manager.model.ScheduleTrigger;
import com.chanus.yuntao.boot.manager.service.ScheduleTriggerService;
import com.chanus.yuntao.utils.core.LocalDateTimeUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import org.springframework.stereotype.Service;

/**
 * 定时任务管理接口实现
 *
 * @author Chanus
 * @date 2020-08-10 17:38:22
 * @since 1.0.0
 */
@Service
public class ScheduleTriggerServiceImpl extends BaseServiceImpl<ScheduleTriggerMapper, ScheduleTrigger> implements ScheduleTriggerService {
    @Override
    public Message insert(ScheduleTrigger scheduleTrigger) {
        String triggerStartTimeStr = scheduleTrigger.getTriggerStartTimeStr();
        String triggerEndTimeStr = scheduleTrigger.getTriggerEndTimeStr();
        scheduleTrigger.setTriggerStartTime(LocalDateTimeUtils.parseDateTime(triggerStartTimeStr));
        scheduleTrigger.setTriggerEndTime(LocalDateTimeUtils.parseDateTime(triggerEndTimeStr));

        return super.insert(scheduleTrigger);
    }

    @Override
    public Message update(ScheduleTrigger scheduleTrigger) {
        String triggerStartTimeStr = scheduleTrigger.getTriggerStartTimeStr();
        String triggerEndTimeStr = scheduleTrigger.getTriggerEndTimeStr();
        scheduleTrigger.setTriggerStartTime(LocalDateTimeUtils.parseDateTime(triggerStartTimeStr));
        scheduleTrigger.setTriggerEndTime(LocalDateTimeUtils.parseDateTime(triggerEndTimeStr));

        return super.update(scheduleTrigger);
    }
}
