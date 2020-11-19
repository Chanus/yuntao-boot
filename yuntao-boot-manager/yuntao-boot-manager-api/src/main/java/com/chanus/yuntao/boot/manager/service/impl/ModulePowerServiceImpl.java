package com.chanus.yuntao.boot.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chanus.yuntao.boot.framework.base.service.impl.BaseServiceImpl;
import com.chanus.yuntao.boot.manager.mapper.ModulePowerMapper;
import com.chanus.yuntao.boot.manager.mapper.ModulePowerMethodMapper;
import com.chanus.yuntao.boot.manager.model.ModulePower;
import com.chanus.yuntao.boot.manager.model.ModulePowerMethod;
import com.chanus.yuntao.boot.manager.service.ModulePowerService;
import com.chanus.yuntao.utils.core.CollectionUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

/**
 * 模块权限配置接口实现
 *
 * @author Chanus
 * @date 2020-08-07 11:47:41
 * @since 1.0.0
 */
@Service
public class ModulePowerServiceImpl extends BaseServiceImpl<ModulePowerMapper, ModulePower> implements ModulePowerService {
    @Autowired
    private ModulePowerMethodMapper modulePowerMethodMapper;

    @Override
    public List<ModulePowerMethod> listMethod(Integer mpId) {
        return modulePowerMethodMapper.selectList(new QueryWrapper<ModulePowerMethod>().lambda().eq(ModulePowerMethod::getMpId, mpId));
    }

    @Override
    public Message insertMethod(ModulePowerMethod modulePowerMethod) {
        modulePowerMethodMapper.insert(modulePowerMethod);
        return Message.addSuccess();
    }

    @Override
    public Message updateMethod(ModulePowerMethod modulePowerMethod) {
        modulePowerMethodMapper.updateById(modulePowerMethod);
        return Message.updateSuccess();
    }

    @Override
    public Message deleteMethod(Collection<Integer> ids) {
        if (CollectionUtils.isNotEmpty(ids))
            modulePowerMethodMapper.deleteBatchIds(ids);

        return Message.deleteSuccess();
    }
}
