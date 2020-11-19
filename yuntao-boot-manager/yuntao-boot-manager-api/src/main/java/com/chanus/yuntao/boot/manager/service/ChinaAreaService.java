/*
 * Copyright (c) 2018, Chanus and/or its affiliates. All rights reserved.
 */
package com.chanus.yuntao.boot.manager.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chanus.yuntao.boot.manager.model.ChinaArea;

import java.util.List;

/**
 * 中国区划信息管理接口
 *
 * @author Chanus
 * @date 2020-08-3 22:17:26
 * @since 1.0.0
 */
public interface ChinaAreaService extends IService<ChinaArea> {
    /**
     * 根据上级行政区划代码获取下级中国区划信息
     *
     * @param areaParentId 上级行政区划代码
     * @return 下级中国区划信息
     */
    List<ChinaArea> list(Integer areaParentId);

    /**
     * 获取中国省级区划信息
     *
     * @return 中国省级区划信息
     */
    List<ChinaArea> listProvinces();

    /**
     * 根据行政区名称获取行政区划信息，该接口只适合查询省级和市级行政区，区县级行政区名称有重名的
     *
     * @param areaName 行政区名称
     * @return 行政区划信息
     */
    ChinaArea get(String areaName);
}
