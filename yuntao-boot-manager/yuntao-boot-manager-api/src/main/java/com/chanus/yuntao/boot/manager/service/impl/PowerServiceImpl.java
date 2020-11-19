package com.chanus.yuntao.boot.manager.service.impl;

import com.chanus.yuntao.boot.framework.base.service.impl.BaseServiceImpl;
import com.chanus.yuntao.boot.manager.mapper.PowerMapper;
import com.chanus.yuntao.boot.manager.model.Power;
import com.chanus.yuntao.boot.manager.service.PowerService;
import com.chanus.yuntao.utils.core.lang.Message;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 权限项管理接口实现
 *
 * @author Chanus
 * @date 2020-08-06 14:13:16
 * @since 1.0.0
 */
@Service
public class PowerServiceImpl extends BaseServiceImpl<PowerMapper, Power> implements PowerService {
    @Override
    public Message insert(Power t) {
        Integer priority = getBaseMapper().getMaxPriority();
        t.setPriority(priority == null ? 1 : (priority + 1));
        return super.insert(t);
    }

    @Override
    public Message priority(Map<String, Object> params) {
        getBaseMapper().priority(params);
        return Message.success("调整优先级成功");
    }
}
