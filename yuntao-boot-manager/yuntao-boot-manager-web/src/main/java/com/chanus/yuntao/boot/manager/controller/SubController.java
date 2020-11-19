package com.chanus.yuntao.boot.manager.controller;

import com.chanus.yuntao.boot.common.pojo.LoginUser;
import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.manager.annotation.Log;
import com.chanus.yuntao.boot.manager.common.ModulePowerUtils;
import com.chanus.yuntao.boot.manager.common.SystemConstants;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.model.Module;
import com.chanus.yuntao.boot.manager.model.Operator;
import com.chanus.yuntao.boot.manager.service.ModuleService;
import com.chanus.yuntao.boot.manager.service.OperatorService;
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
 * 子账号管理
 *
 * @author Chanus
 * @date 2020-08-07 17:09:09
 * @since 1.0.0
 */
@Controller
@RequestMapping("system/sub")
public class SubController extends BaseController {
    @Autowired
    private OperatorService operatorService;
    @Autowired
    private ModuleService moduleService;

    private final String currentModuleCode = "SUB";

    /**
     * 首页
     *
     * @param model
     * @return
     */
    @GetMapping(value = "main")
    public String main(Model model) {
        model.addAttribute("powers", ModulePowerUtils.getPowers(getSession(), currentModuleCode));
        return "system/sub/list";
    }

    /**
     * 分页查询
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "list", produces = "application/json; charset=utf-8")
    public Page<Operator> list() {
        return operatorService.listSubPagination(getParams().putNext("loginNo", LoginUser.getLoginUser().getLoginNo()).putNext("loginRoleCode", LoginUser.getLoginUser().getRoleCode()));
    }

    /**
     * 跳转到添加页面
     *
     * @param model
     * @return
     */
    @GetMapping(value = "add")
    public String add(Model model) {
        model.addAttribute("operator", new Operator());
        model.addAttribute("cmd", "add");
        return "system/sub/add-update";
    }

    /**
     * 添加
     *
     * @param operator
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.INSERT)
    @PostMapping(value = "add", produces = "application/json; charset=utf-8")
    public Message add(Operator operator) {
        operator.setOperatorRoleCode(SystemConstants.ROLE_SUB_1);
        if (!SystemConstants.ROLE_ADMIN_0.equals(LoginUser.getLoginUser().getRoleCode()))
            operator.setMasterNo(LoginUser.getLoginUser().getLoginNo());

        return operatorService.insert(operator);
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
        model.addAttribute("operator", operatorService.get(id));
        model.addAttribute("cmd", "update");
        return "system/sub/add-update";
    }

    /**
     * 修改
     *
     * @param operator
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "update", produces = "application/json; charset=utf-8")
    public Message update(Operator operator) {
        return operatorService.update(operator);
    }

    /**
     * 跳转到修改子账号密码页面
     *
     * @param subNo 子账号
     * @param model
     * @return
     */
    @GetMapping(value = "password")
    public String password(String subNo, Model model) {
        model.addAttribute("subNo", subNo);
        return "system/sub/update-password";
    }

    /**
     * 修改子账号密码
     *
     * @param subNo    子账号
     * @param password 新密码
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "修改子账号密码", logType = LogTypeEnum.UPDATE, ignore = true)
    @PostMapping(value = "password", produces = "application/json; charset=utf-8")
    public Message password(String subNo, String password) {
        return operatorService.updatePassword(subNo, null, password, false);
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
        return operatorService.delete(Arrays.asList(ids));
    }

    /**
     * 跳转到配置子账号权限页面
     *
     * @param subNo          子账号
     * @param masterRoleCode 主账号角色
     * @param model
     * @return
     */
    @GetMapping(value = "configure")
    public String configure(String subNo, String masterRoleCode, Model model) {
        // 获取主账号的权限菜单
        List<Module> menus = moduleService.listSubModulePower(subNo, masterRoleCode);
        model.addAttribute("menus", menus);
        model.addAttribute("subNo", subNo);
        return "system/sub/configure";
    }

    /**
     * 子账号授权
     *
     * @param subNo        子账号
     * @param modulePowers 模块-权限项数组
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "子账号授权", logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "configure", produces = "application/json; charset=utf-8")
    public Message configure(String subNo, String[] modulePowers) {
        return operatorService.grantSubModulePower(subNo, modulePowers);
    }
}
