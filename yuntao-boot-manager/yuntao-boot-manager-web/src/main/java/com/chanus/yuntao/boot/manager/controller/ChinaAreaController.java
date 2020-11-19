/*
 * Copyright (c) 2018, Chanus and/or its affiliates. All rights reserved.
 */
package com.chanus.yuntao.boot.manager.controller;

import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.manager.model.ChinaArea;
import com.chanus.yuntao.boot.manager.service.ChinaAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 中国行政区划管理
 *
 * @author Chanus
 * @date 2020-08-3 22:20:16
 * @since 1.0.0
 */
@Controller
@RequestMapping("system/chinaarea")
public class ChinaAreaController extends BaseController {
    @Autowired
    private ChinaAreaService chinaAreaService;

    /**
     * 获取下级中国行政区划信息
     *
     * @param areaParentId 上级行政区划代码
     * @return
     */
    @ResponseBody
    @PostMapping(value = "china-areas", produces = "application/json; charset=utf-8")
    public List<ChinaArea> chinaAreas(Integer areaParentId) {
        return chinaAreaService.list(areaParentId);
    }

    /**
     * 获取下级中国行政区划信息
     *
     * @param areaName 行政区名称
     * @return
     */
    @ResponseBody
    @PostMapping(value = "china-areas-name", produces = "application/json; charset=utf-8")
    public List<ChinaArea> chinaAreas(String areaName) {
        ChinaArea chinaArea = chinaAreaService.get(areaName);
        return chinaAreaService.list(chinaArea.getAreaId());
    }

}
