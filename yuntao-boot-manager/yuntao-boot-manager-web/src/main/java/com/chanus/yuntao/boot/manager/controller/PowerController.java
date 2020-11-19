package com.chanus.yuntao.boot.manager.controller;

import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.manager.annotation.Log;
import com.chanus.yuntao.boot.manager.common.ModulePowerUtils;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.model.Power;
import com.chanus.yuntao.boot.manager.service.PowerService;
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
 * 权限项管理
 *
 * @author Chanus
 * @date 2020-08-06 14:13:16
 * @since 1.0.0
 */
@Controller
@RequestMapping("system/power")
public class PowerController extends BaseController {
    @Autowired
    private PowerService powerService;

    private final String currentModuleCode = "POWER";

    /**
     * 首页
     *
     * @param model
     * @return
     */
    @GetMapping(value = "main")
    public String main(Model model) {
        model.addAttribute("powers", ModulePowerUtils.getPowers(getSession(), currentModuleCode));
        return "system/power/list";
    }

    /**
     * 分页查询
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "list", produces = "application/json; charset=utf-8")
    public Page<Power> list() {
        return powerService.listPagination(getParams());
    }

    /**
     * 跳转到添加页面
     *
     * @param model
     * @return
     */
    @GetMapping(value = "add")
    public String add(Model model) {
        model.addAttribute("power", new Power());
        model.addAttribute("cmd", "add");
        return "system/power/add-update";
    }

    /**
     * 添加
     *
     * @param power
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.INSERT)
    @PostMapping(value = "add", produces = "application/json; charset=utf-8")
    public Message add(Power power) {
        return powerService.insert(power);
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
        model.addAttribute("power", powerService.get(id));
        model.addAttribute("cmd", "update");
        return "system/power/add-update";
    }

    /**
     * 修改
     *
     * @param power
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "update", produces = "application/json; charset=utf-8")
    public Message update(Power power) {
        return powerService.update(power);
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
        return powerService.delete(Arrays.asList(ids));
    }

    /**
     * 调整优先级
     *
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "调整权限项优先级", logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "priority", produces = "application/json; charset=utf-8")
    public Message priority() {
        return powerService.priority(getParams());
    }

}
