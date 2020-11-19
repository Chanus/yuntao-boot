package com.chanus.yuntao.boot.manager.controller;

import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.manager.annotation.Log;
import com.chanus.yuntao.boot.manager.common.ModulePowerUtils;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.model.ScheduleTrigger;
import com.chanus.yuntao.boot.manager.service.ScheduleTriggerService;
import com.chanus.yuntao.utils.core.lang.Message;
import com.chanus.yuntao.utils.core.lang.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;

/**
 * 定时任务管理
 *
 * @author Chanus
 * @date 2020-08-10 17:38:22
 * @since 1.0.0
 */
@Controller
@RequestMapping("system/job/trigger")
public class ScheduleTriggerController extends BaseController {
    @Autowired
    private ScheduleTriggerService scheduleTriggerService;

    private final String currentModuleCode = "JOB";

    /**
     * 首页
     *
     * @param jobId 定时任务 ID
     * @param model
     * @return
     */
    @GetMapping(value = "main")
    public String main(Integer jobId, Model model) {
        model.addAttribute("powers", ModulePowerUtils.getPowers(getSession(), currentModuleCode));
        model.addAttribute("jobId", jobId);
        return "system/job/trigger/list";
    }

    /**
     * 分页查询
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "list", produces = "application/json; charset=utf-8")
    public Page<ScheduleTrigger> list() {
        return scheduleTriggerService.listPagination(getParams());
    }

    /**
     * 跳转到添加页面
     *
     * @param jobId 定时任务ID
     * @param model
     * @return
     */
    @GetMapping(value = "add")
    public String add(Integer jobId, Model model) {
        ScheduleTrigger scheduleTrigger = new ScheduleTrigger();
        scheduleTrigger.setJobId(jobId);
        model.addAttribute("scheduleTrigger", scheduleTrigger);
        model.addAttribute("cmd", "add");
        return "system/job/trigger/add-update";
    }

    /**
     * 添加
     *
     * @param scheduleTrigger
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.INSERT)
    @PostMapping(value = "add", produces = "application/json; charset=utf-8")
    public Message add(ScheduleTrigger scheduleTrigger) {
        return scheduleTriggerService.insert(scheduleTrigger);
    }

    /**
     * 跳转到修改页面
     *
     * @param id    主键
     * @param model
     * @return
     */
    @GetMapping(value = "update")
    public String update(Integer id, Model model) {
        model.addAttribute("scheduleTrigger", scheduleTriggerService.get(id));
        model.addAttribute("cmd", "update");
        return "system/job/trigger/add-update";
    }

    /**
     * 修改
     *
     * @param scheduleTrigger
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "update", produces = "application/json; charset=utf-8")
    public Message update(ScheduleTrigger scheduleTrigger) {
        return scheduleTriggerService.update(scheduleTrigger);
    }

    /**
     * 删除/批量删除
     *
     * @param ids 被删除记录主键数组
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.DELETE)
    @PostMapping(value = "delete", produces = "application/json; charset=utf-8")
    public Message delete(Integer[] ids) {
        return scheduleTriggerService.delete(Arrays.asList(ids));
    }

}
