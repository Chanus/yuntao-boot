package com.chanus.yuntao.boot.manager;

import com.chanus.yuntao.boot.framework.configuration.system.Global;
import com.chanus.yuntao.boot.manager.common.CacheData;
import com.chanus.yuntao.boot.manager.service.ActivationService;
import com.chanus.yuntao.boot.manager.service.DictService;
import com.chanus.yuntao.boot.manager.service.ParamService;
import com.chanus.yuntao.boot.manager.service.ScheduleJobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.ServletContext;

/**
 * 缓存系统基础数据
 *
 * @author Chanus
 * @date 2020-08-01 15:30:39
 * @since 1.0.0
 */
@Component
public class SystemCacheInit {
    @Autowired
    private ParamService paramService;
    @Autowired
    private DictService dictService;
    @Autowired
    private ScheduleJobService scheduleJobService;
    @Autowired
    private ActivationService activationService;
    @Resource
    private ServletContext servletContext;

    /**
     * 初始化系统常量
     */
    @PostConstruct
    public void initConfigServlet() {
        servletContext.setAttribute("system_name", Global.name);
        servletContext.setAttribute("system_version", Global.version);
        servletContext.setAttribute("system_copyright", Global.copyright);

        // 校验系统是否激活
        activationService.verify();
    }

    /**
     * 初始化 RSA 密钥 RSA_KEYS_QUEUE
     */
    @PostConstruct
    public void initRsaKeysQueue() {
        CacheData.initRsaKeysQueue();
    }

    /**
     * 初始化系统参数 SYSTEM_PARAMS_MAP
     */
    @PostConstruct
    public void initSysParamsMap() {
        paramService.reloadParam();
    }

    /**
     * 初始化系统字典数据 SYSTEM_DICT_MAP，SYSTEM_DICT_ITEM_MAP
     */
    @PostConstruct
    public void initSysDictMap() {
        dictService.reloadDict();
    }

    /**
     * 启动定时任务
     */
    @PostConstruct
    public void startScheduleJob() {
        scheduleJobService.startAll();
    }
}
