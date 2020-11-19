package com.chanus.yuntao.boot.manager.controller;

import com.chanus.yuntao.boot.common.pojo.LoginUser;
import com.chanus.yuntao.boot.common.utils.JsonUtils;
import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.manager.annotation.Log;
import com.chanus.yuntao.boot.manager.common.ModulePowerUtils;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.model.Module;
import com.chanus.yuntao.boot.manager.model.Role;
import com.chanus.yuntao.boot.manager.service.ModuleService;
import com.chanus.yuntao.boot.manager.service.RoleService;
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
import java.util.List;

/**
 * 角色管理
 *
 * @author Chanus
 * @date 2020-08-07 15:05:33
 * @since 1.0.0
 */
@Controller
@RequestMapping("system/role")
public class RoleController extends BaseController {
    @Autowired
    private RoleService roleService;
    @Autowired
    private ModuleService moduleService;

    private final String currentModuleCode = "ROLE";

    /**
     * 首页
     *
     * @param model
     * @return
     */
    @GetMapping(value = "main")
    public String main(Model model) {
        model.addAttribute("powers", ModulePowerUtils.getPowers(getSession(), currentModuleCode));
        return "system/role/list";
    }

    /**
     * 分页查询
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "list", produces = "application/json; charset=utf-8")
    public Page<Role> list() {
        return roleService.listPagination(getParams().putNext("roleCode", LoginUser.getLoginUser().getMasterRoleCode()));
    }

    /**
     * 获取角色列表树根 DOM
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "tree", produces = "application/json; charset=utf-8")
    public Object tree() {
        return JsonUtils.jsonToObject(roleService.createTree(LoginUser.getLoginUser().getMasterRoleCode()));
    }

    /**
     * 跳转到添加页面
     *
     * @param model
     * @return
     */
    @GetMapping(value = "add")
    public String add(Model model) {
        model.addAttribute("role", new Role());
        model.addAttribute("parentRoles", roleService.list(getParams().putNext("roleCode", LoginUser.getLoginUser().getMasterRoleCode())));
        model.addAttribute("cmd", "add");
        return "system/role/add-update";
    }

    /**
     * 添加
     *
     * @param role
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.INSERT)
    @PostMapping(value = "add", produces = "application/json; charset=utf-8")
    public Message add(Role role) {
        return roleService.insert(role);
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
        model.addAttribute("role", roleService.get(id));
        model.addAttribute("cmd", "update");
        return "system/role/add-update";
    }

    /**
     * 修改
     *
     * @param role
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "update", produces = "application/json; charset=utf-8")
    public Message update(Role role) {
        return roleService.update(role);
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
        return roleService.delete(Arrays.asList(ids));
    }

    /**
     * 获取角色的模块权限列表
     *
     * @param roleCode 角色代码
     * @return
     */
    @ResponseBody
    @PostMapping(value = "list-role-module-power", produces = "application/json; charset=utf-8")
    public List<Module> listRoleModulePower(String roleCode) {
        return moduleService.listRoleModulePower(roleCode);
    }

    /**
     * 角色授权
     *
     * @param roleCode     角色代码
     * @param modulePowers 模块-权限项数组
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "角色授权", logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "grant", produces = "application/json; charset=utf-8")
    public Message grant(String roleCode, String[] modulePowers) {
        return roleService.grantRoleModulePower(roleCode, modulePowers);
    }

}
