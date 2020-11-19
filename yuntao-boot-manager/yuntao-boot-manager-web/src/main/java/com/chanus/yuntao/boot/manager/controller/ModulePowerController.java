package com.chanus.yuntao.boot.manager.controller;

import com.chanus.yuntao.boot.common.constant.Constants;
import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.manager.annotation.Log;
import com.chanus.yuntao.boot.manager.common.CacheData;
import com.chanus.yuntao.boot.manager.common.ModulePowerUtils;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.model.ModulePower;
import com.chanus.yuntao.boot.manager.model.ModulePowerMethod;
import com.chanus.yuntao.boot.manager.service.ModulePowerService;
import com.chanus.yuntao.boot.manager.service.ModuleService;
import com.chanus.yuntao.boot.manager.service.PowerService;
import com.chanus.yuntao.utils.core.CollectionUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import com.chanus.yuntao.utils.core.lang.Page;
import com.chanus.yuntao.utils.core.map.CustomMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.Set;

/**
 * 模块权限配置
 *
 * @author Chanus
 * @date 2020-08-07 11:47:41
 * @since 1.0.0
 */
@Controller
@RequestMapping("system/modulepower")
public class ModulePowerController extends BaseController {
    @Autowired
    private ModulePowerService modulePowerService;
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private PowerService powerService;

    private final String currentModuleCode = "MODULE_POWER";

    /**
     * 首页
     *
     * @param model
     * @return
     */
    @GetMapping(value = "main")
    public String main(Model model) {
        model.addAttribute("powers", ModulePowerUtils.getPowers(getSession(), currentModuleCode));
        model.addAttribute("modules1", moduleService.list(CustomMap.create("moduleParentId", 0)));
        model.addAttribute("powerItems", powerService.list(CustomMap.create("validStatus", Constants.STATUS_YES)));
        return "system/modulepower/list";
    }

    /**
     * 分页查询
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "list", produces = "application/json; charset=utf-8")
    public Page<ModulePower> list() {
        return modulePowerService.listPagination(getParams());
    }

    /**
     * 跳转到添加页面
     *
     * @param model
     * @return
     */
    @GetMapping(value = "add")
    public String add(Model model) {
        model.addAttribute("modulePower", new ModulePower());
        model.addAttribute("cmd", "add");
        return "system/modulepower/add-update";
    }

    /**
     * 添加
     *
     * @param modulePower
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.INSERT)
    @PostMapping(value = "add", produces = "application/json; charset=utf-8")
    public Message add(ModulePower modulePower) {
        return modulePowerService.insert(modulePower);
    }

    /**
     * 跳转到修改页面
     *
     * @param mpId  主键
     * @param model
     * @return
     */
    @GetMapping(value = "update")
    public String update(Integer mpId, Model model) {
        model.addAttribute("modulePower", modulePowerService.get(mpId));
        model.addAttribute("cmd", "update");
        return "system/modulepower/add-update";
    }

    /**
     * 修改
     *
     * @param modulePower
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "update", produces = "application/json; charset=utf-8")
    public Message update(ModulePower modulePower) {
        return modulePowerService.update(modulePower);
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
        return modulePowerService.delete(Arrays.asList(ids));
    }

    /**
     * 跳转到模块权限项方法配置页面
     *
     * @param mpId  模块权限项主键
     * @param model
     * @return
     */
    @GetMapping(value = "method-main")
    public String methodMain(Integer mpId, Model model) {
        // 缓存所有的请求URL及Controller类名
        if (CollectionUtils.isEmpty(CacheData.CLASS_URL_MAP.keySet()))
            CacheData.initClassUrlMap(getRequest());

        model.addAttribute("mpId", mpId);
        model.addAttribute("clazzs", CacheData.CLASS_URL_MAP.keySet());
        return "system/modulepower/list-method";
    }

    /**
     * 模块权限项方法列表
     *
     * @param mpId 模块权限项主键
     * @return
     */
    @ResponseBody
    @PostMapping(value = "method-list", produces = "application/json; charset=utf-8")
    public Page<ModulePowerMethod> methodList(Integer mpId) {
        return new Page<>(0, modulePowerService.listMethod(mpId));
    }

    /**
     * 获取指定类名下的URL列表
     *
     * @param className 类名
     * @return
     */
    @ResponseBody
    @PostMapping(value = "urls", produces = "application/json; charset=utf-8")
    public Set<String> urls(String className) {
        return CacheData.CLASS_URL_MAP.get(className);
    }

    /**
     * 添加模块权限项方法
     *
     * @param modulePowerMethod
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "添加模块权限项方法", logType = LogTypeEnum.INSERT)
    @PostMapping(value = "method-add", produces = "application/json; charset=utf-8")
    public Message methodAdd(ModulePowerMethod modulePowerMethod) {
        return modulePowerService.insertMethod(modulePowerMethod);
    }

    /**
     * 修改模块权限项方法
     *
     * @param mpmId     主键
     * @param className 类名
     * @param url       请求URL
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "修改模块权限项方法", logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "method-update", produces = "application/json; charset=utf-8")
    public Message methodUpdate(Integer mpmId, String className, String url) {
        ModulePowerMethod modulePowerMethod = new ModulePowerMethod();
        modulePowerMethod.setMpmId(mpmId);
        modulePowerMethod.setClassName(className);
        modulePowerMethod.setUrl(url);
        return modulePowerService.updateMethod(modulePowerMethod);
    }

    /**
     * 删除/批量删除模块权限项方法
     *
     * @param ids 被删除记录主键数组
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "删除模块权限项方法", logType = LogTypeEnum.DELETE)
    @PostMapping(value = "method-delete", produces = "application/json; charset=utf-8")
    public Message methodDelete(Integer[] ids) {
        return modulePowerService.deleteMethod(Arrays.asList(ids));
    }

}
