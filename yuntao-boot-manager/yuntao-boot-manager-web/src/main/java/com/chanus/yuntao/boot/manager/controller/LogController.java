package com.chanus.yuntao.boot.manager.controller;

import com.chanus.yuntao.boot.common.pojo.LoginUser;
import com.chanus.yuntao.boot.framework.base.controller.BaseController;
import com.chanus.yuntao.boot.manager.annotation.Log;
import com.chanus.yuntao.boot.manager.common.ModulePowerUtils;
import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.chanus.yuntao.boot.manager.service.LogService;
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

/**
 * 操作日志
 *
 * @author Chanus
 * @date 2020-08-10 10:56:53
 * @since 1.0.0
 */
@Controller
@RequestMapping("system/log")
public class LogController extends BaseController {
    @Autowired
    private LogService logService;

    private final String currentModuleCode = "LOG";

    /**
     * 首页
     *
     * @param model
     * @return
     */
    @GetMapping(value = "main")
    public String main(Model model) {
        model.addAttribute("powers", ModulePowerUtils.getPowers(getSession(), currentModuleCode));
        return "system/log/list";
    }

    /**
     * 分页查询
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "list", produces = "application/json; charset=utf-8")
    public Page<com.chanus.yuntao.boot.manager.model.Log> list() {
        CustomMap params = getParams();
        String operateContent = (String) params.get("operateContent");
        try {
            if (StringUtils.isNotBlank(operateContent))
                params.put("operateContent", URLDecoder.decode(operateContent, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            LOGGER.error("查询系统日志转码异常", e);
        }
        return logService.listPagination(params.putNext("operateRoleCode", LoginUser.getLoginUser().getMasterRoleCode()));
    }

    /**
     * 跳转到日志内容页面
     *
     * @param id    日志 ID
     * @param model
     * @return
     */
    @GetMapping(value = "content")
    public String content(Long id, Model model) {
        model.addAttribute("log", logService.get(id));
        return "system/log/content";
    }

    /**
     * 删除
     *
     * @param id 被删除记录主键
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, logType = LogTypeEnum.DELETE)
    @PostMapping(value = "delete", produces = "application/json; charset=utf-8")
    public Message delete(Long id) {
        return logService.delete(id);
    }

    /**
     * 清除日志
     *
     * @return
     */
    @ResponseBody
    @Log(module = currentModuleCode, description = "清除日志", logType = LogTypeEnum.DELETE)
    @PostMapping(value = "clear", produces = "application/json; charset=utf-8")
    public Message clear() {
        return logService.clear();
    }

}
