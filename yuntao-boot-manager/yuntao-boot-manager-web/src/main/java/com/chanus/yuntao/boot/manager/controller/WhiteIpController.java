package com.chanus.yuntao.boot.manager.controller;

import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.manager.annotation.Log;
import com.chanus.yuntao.boot.manager.common.ModulePowerUtils;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.model.WhiteIp;
import com.chanus.yuntao.boot.manager.service.WhiteIpService;
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
 * IP白名单管理
 *
 * @author Chanus
 * @date 2020-08-10 10:28:03
 * @since 1.0.0
 */
@Controller
@RequestMapping("system/whiteip")
public class WhiteIpController extends BaseController {
    @Autowired
    private WhiteIpService whiteIpService;

    private final String currentModuleCode = "WHITE_IP";

    /**
     * 首页
     *
     * @param model
     * @return
     */
    @GetMapping(value = "main")
    public String main(Model model) {
        model.addAttribute("powers", ModulePowerUtils.getPowers(getSession(), currentModuleCode));
        return "system/whiteip/list";
    }

    /**
     * 分页查询
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "list", produces = "application/json; charset=utf-8")
    public Page<WhiteIp> list() {
        return whiteIpService.listPagination(getParams());
    }

    /**
     * 跳转到添加页面
     *
     * @param model
     * @return
     */
    @GetMapping(value = "add")
    public String add(Model model) {
        model.addAttribute("whiteIp", new WhiteIp());
        model.addAttribute("cmd", "add");
        return "system/whiteip/add-update";
    }

    /**
     * 添加
     *
     * @param whiteIp
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.INSERT)
    @PostMapping(value = "add", produces = "application/json; charset=utf-8")
    public Message add(WhiteIp whiteIp) {
        return whiteIpService.insert(whiteIp);
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
        model.addAttribute("whiteIp", whiteIpService.get(id));
        model.addAttribute("cmd", "update");
        return "system/whiteip/add-update";
    }

    /**
     * 修改
     *
     * @param whiteIp
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "update", produces = "application/json; charset=utf-8")
    public Message update(WhiteIp whiteIp) {
        return whiteIpService.update(whiteIp);
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
        return whiteIpService.delete(Arrays.asList(ids));
    }

}
