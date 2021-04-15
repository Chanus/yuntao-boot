package com.chanus.yuntao.boot.manager.controller;

import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.manager.annotation.Log;
import com.chanus.yuntao.boot.manager.common.ModulePowerUtils;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.model.Dict;
import com.chanus.yuntao.boot.manager.service.DictService;
import com.chanus.yuntao.utils.core.StringUtils;
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

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;

/**
 * 数据字典集管理
 *
 * @author Chanus
 * @date 2020-08-10 16:06:05
 * @since 1.0.0
 */
@Controller
@RequestMapping("system/dict")
public class DictController extends BaseController {
    @Autowired
    private DictService dictService;

    private final String currentModuleCode = "DICT";

    /**
     * 首页
     *
     * @param model
     * @return
     */
    @GetMapping(value = "main")
    public String main(Model model) {
        model.addAttribute("powers", ModulePowerUtils.getPowers(getSession(), currentModuleCode));
        return "system/dict/list";
    }

    /**
     * 分页查询
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "list", produces = "application/json; charset=utf-8")
    public Page<Dict> list() {
        CustomMap params = getParams();
        String dictName = params.getStringValue("dictName");
        try {
            if (StringUtils.isNotBlank(dictName))
                params.put("dictName", URLDecoder.decode(dictName, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            LOGGER.error("查询系统数据字典转码异常", e);
        }

        return dictService.listPagination(params);
    }

    /**
     * 跳转到添加页面
     *
     * @param model
     * @return
     */
    @GetMapping(value = "add")
    public String add(Model model) {
        model.addAttribute("dict", new Dict());
        model.addAttribute("cmd", "add");
        return "system/dict/add-update";
    }

    /**
     * 添加
     *
     * @param dict
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.INSERT)
    @PostMapping(value = "add", produces = "application/json; charset=utf-8")
    public Message add(Dict dict) {
        return dictService.insert(dict);
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
        model.addAttribute("dict", dictService.get(id));
        model.addAttribute("cmd", "update");
        return "system/dict/add-update";
    }

    /**
     * 修改
     *
     * @param dict
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.UPDATE)
    @PostMapping(value = "update", produces = "application/json; charset=utf-8")
    public Message update(Dict dict) {
        return dictService.update(dict);
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
        return dictService.delete(Arrays.asList(ids));
    }

    /**
     * 重载数据字典
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "reload", produces = "application/json; charset=utf-8")
    public Message reload() {
        return dictService.reloadDict();
    }

}
