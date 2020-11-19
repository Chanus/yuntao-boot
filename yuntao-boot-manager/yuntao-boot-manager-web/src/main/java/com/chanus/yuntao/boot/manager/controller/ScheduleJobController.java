package com.chanus.yuntao.boot.manager.controller;

import com.chanus.yuntao.boot.common.constant.Constants;
import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.manager.annotation.Log;
import com.chanus.yuntao.boot.manager.common.ModulePowerUtils;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.model.ScheduleJob;
import com.chanus.yuntao.boot.manager.service.ScheduleJobService;
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
 * @date 2020-08-10 17:26:26
 * @since 1.0.0
 */
@Controller
@RequestMapping("system/job")
public class ScheduleJobController extends BaseController {
    @Autowired
    private ScheduleJobService scheduleJobService;

    private final String currentModuleCode = "JOB";

    /**
     * 首页
     *
     * @param model
     * @return
     */
    @GetMapping(value = "main")
    public String main(Model model) {
        model.addAttribute("powers", ModulePowerUtils.getPowers(getSession(), currentModuleCode));
        return "system/job/list";
    }

    /**
     * 分页查询
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "list", produces = "application/json; charset=utf-8")
    public Page<ScheduleJob> list() {
        return scheduleJobService.listPagination(getParams());
    }

    /**
     * 跳转到添加页面
     *
     * @param model
     * @return
     */
    @GetMapping(value = "add")
    public String add(Model model) {
        model.addAttribute("scheduleJob", new ScheduleJob());
        model.addAttribute("cmd", "add");
        return "system/job/add-update";
    }

    /**
     * 添加
     *
     * @param scheduleJob
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.INSERT)
    @PostMapping(value = "add", produces = "application/json; charset=utf-8")
    public Message add(ScheduleJob scheduleJob) {
        scheduleJob.setValidStatus(Constants.STATUS_NO);// 添加定时任务时默认为未启动
        return scheduleJobService.insert(scheduleJob);
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
        model.addAttribute("scheduleJob", scheduleJobService.get(id));
        model.addAttribute("cmd", "update");
        return "system/job/add-update";
    }

    /**
     * 修改
     *
     * @param scheduleJob
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "update", produces = "application/json; charset=utf-8")
    public Message update(ScheduleJob scheduleJob) {
        return scheduleJobService.update(scheduleJob);
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
        return scheduleJobService.delete(Arrays.asList(ids));
    }

    /**
     * 启动定时任务
     *
     * @param id 主键ID
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "启动定时任务", logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "start", produces = "application/json; charset=utf-8")
    public Message start(Integer id) {
        return scheduleJobService.start(id);
    }

    /**
     * 暂停定时任务
     *
     * @param id 主键ID
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "暂停定时任务", logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "pause", produces = "application/json; charset=utf-8")
    public Message pause(Integer id) {
        return scheduleJobService.pause(id);
    }

    /**
     * 恢复定时任务
     *
     * @param id 主键ID
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "恢复定时任务", logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "resume", produces = "application/json; charset=utf-8")
    public Message resume(Integer id) {
        return scheduleJobService.resume(id);
    }

    /**
     * 停止定时任务
     *
     * @param id 主键ID
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "停止定时任务", logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "stop", produces = "application/json; charset=utf-8")
    public Message stop(Integer id) {
        return scheduleJobService.stop(id);
    }

    /**
     * 立即执行定时任务
     *
     * @param id 主键ID
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "立即执行定时任务", logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "trigger", produces = "application/json; charset=utf-8")
    public Message trigger(Integer id) {
        return scheduleJobService.trigger(id);
    }

}
