package com.chanus.yuntao.boot.manager.controller;

import com.chanus.yuntao.boot.common.utils.JsonUtils;
import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.manager.annotation.Log;
import com.chanus.yuntao.boot.manager.common.ModulePowerUtils;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.model.Organization;
import com.chanus.yuntao.boot.manager.service.OrganizationService;
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
 * 组织机构管理
 *
 * @author Chanus
 * @date 2020-08-10 11:40:42
 * @since 1.0.0
 */
@Controller
@RequestMapping("system/organization")
public class OrganizationController extends BaseController {
    @Autowired
    private OrganizationService organizationService;

    private final String currentModuleCode = "ORGANIZATION";

    /**
     * 首页
     *
     * @param model
     * @return
     */
    @GetMapping(value = "main")
    public String main(Model model) {
        model.addAttribute("powers", ModulePowerUtils.getPowers(getSession(), currentModuleCode));
        return "system/organization/list";
    }

    /**
     * 分页查询
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "list", produces = "application/json; charset=utf-8")
    public Page<Organization> list() {
        return organizationService.listPagination(getParams());
    }

    /**
     * 获取组织结构列表树 DOM
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "tree", produces = "application/json; charset=utf-8")
    public Object tree() {
        return JsonUtils.jsonToObject(organizationService.createTree());
    }

    /**
     * 跳转到添加页面
     *
     * @param orgParentId 上级组织 ID
     * @param model
     * @return
     */
    @GetMapping(value = "add")
    public String add(Integer orgParentId, Model model) {
        model.addAttribute("organization", new Organization());
        model.addAttribute("orgParentId", orgParentId);
        model.addAttribute("cmd", "add");
        return "system/organization/add-update";
    }

    /**
     * 添加
     *
     * @param organization
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.INSERT)
    @PostMapping(value = "add", produces = "application/json; charset=utf-8")
    public Message add(Organization organization) {
        return organizationService.insert(organization);
    }

    /**
     * 跳转到修改页面
     *
     * @param orgId    组织机构 ID
     * @param model
     * @return
     */
    @GetMapping(value = "update")
    public String update(Integer orgId, Model model) {
        model.addAttribute("organization", organizationService.get(orgId));
        model.addAttribute("cmd", "update");
        return "system/organization/add-update";
    }

    /**
     * 修改
     *
     * @param organization
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "update", produces = "application/json; charset=utf-8")
    public Message update(Organization organization) {
        return organizationService.update(organization);
    }

    /**
     * 修改排序
     *
     * @param orgId    组织机构 ID
     * @param priority 排序
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "修改排序", logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "priority", produces = "application/json; charset=utf-8")
    public Message priority(Integer orgId, Integer priority) {
        return organizationService.priority(orgId, priority);
    }

    /**
     * 删除/批量删除
     *
     * @param ids 被删除记录主键数组
     * @returni
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.DELETE)
    @PostMapping(value = "delete", produces = "application/json; charset=utf-8")
    public Message delete(Integer[] ids) {
        return organizationService.delete(Arrays.asList(ids));
    }

}
