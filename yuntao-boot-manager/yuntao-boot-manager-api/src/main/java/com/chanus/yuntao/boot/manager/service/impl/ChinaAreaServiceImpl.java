/*
 * Copyright (c) 2018, Chanus and/or its affiliates. All rights reserved.
 */
package com.chanus.yuntao.boot.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chanus.yuntao.boot.manager.mapper.ChinaAreaMapper;
import com.chanus.yuntao.boot.manager.model.ChinaArea;
import com.chanus.yuntao.boot.manager.service.ChinaAreaService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 中国区划信息管理接口实现
 *
 * @author Chanus
 * @date 2020-08-3 22:17:26
 * @since 1.0.0
 */
@Service
public class ChinaAreaServiceImpl extends ServiceImpl<ChinaAreaMapper, ChinaArea> implements ChinaAreaService {

    @Override
    public List<ChinaArea> list(Integer areaParentId) {
        return getBaseMapper().selectList(new QueryWrapper<ChinaArea>().lambda()
                .eq(ChinaArea::getAreaParentId, areaParentId));
    }

    @Override
    public List<ChinaArea> listProvinces() {
        return getBaseMapper().selectList(new QueryWrapper<ChinaArea>().lambda()
                .eq(ChinaArea::getAreaLevel, "1"));
    }

    @Override
    public ChinaArea get(String areaName) {
        return getBaseMapper().selectOne(new QueryWrapper<ChinaArea>().lambda().eq(ChinaArea::getAreaName, areaName));
    }
}
