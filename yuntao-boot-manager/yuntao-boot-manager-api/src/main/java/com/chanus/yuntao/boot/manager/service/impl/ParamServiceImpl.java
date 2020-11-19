package com.chanus.yuntao.boot.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chanus.yuntao.boot.common.constant.Constants;
import com.chanus.yuntao.boot.framework.base.service.impl.BaseServiceImpl;
import com.chanus.yuntao.boot.manager.common.CacheData;
import com.chanus.yuntao.boot.manager.mapper.ParamMapper;
import com.chanus.yuntao.boot.manager.model.Param;
import com.chanus.yuntao.boot.manager.service.ParamService;
import com.chanus.yuntao.utils.core.CollectionUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import com.chanus.yuntao.utils.core.map.CustomMap;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 系统参数配置接口实现
 *
 * @author Chanus
 * @date 2020-08-06 15:45:26
 * @since 1.0.0
 */
@Service
public class ParamServiceImpl extends BaseServiceImpl<ParamMapper, Param> implements ParamService {
    @Override
    public Message insert(Param t) {
        int count = getBaseMapper().count(CustomMap.create("paramCode", t.getParamCode()));
        if (count > 0)
            return Message.fail("当前参数代码已存在");

        Integer priority = getBaseMapper().getMaxPriority();
        t.setPriority(priority == null ? 1 : (priority + 1));

        return super.insert(t);
    }

    @Override
    public Message priority(Map<String, Object> params) {
        getBaseMapper().priority(params);
        return Message.success("调整优先级成功");
    }

    @Override
    public Message reloadParam() {
        CacheData.SYSTEM_PARAMS_MAP.clear();
        List<Param> validParams = getBaseMapper().selectList(new QueryWrapper<Param>().lambda()
                .select(Param::getParamCode, Param::getParamData)
                .eq(Param::getValidStatus, Constants.STATUS_YES));
        if (CollectionUtils.isNotEmpty(validParams))
            validParams.forEach(param -> CacheData.SYSTEM_PARAMS_MAP.put(param.getParamCode(), param.getParamData()));

        return Message.success("系统参数重载成功");
    }
}
