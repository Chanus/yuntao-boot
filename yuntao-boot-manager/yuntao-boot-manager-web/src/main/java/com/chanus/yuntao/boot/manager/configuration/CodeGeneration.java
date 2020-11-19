package com.chanus.yuntao.boot.manager.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 代码生成配置类
 *
 * @author Chanus
 * @date 2020-08-05 15:16:35
 * @since 1.0.0
 */
@Component
public class CodeGeneration {
    /**
     * 代码作者
     */
    public static String author;
    /**
     * 代码版本号
     */
    public static String since;
    /**
     * 项目是否将后端分成两个模块，1 表示分成两个模块，0 表示单模块
     */
    public static String multi;
    /**
     * 生成服务类的包名
     */
    public static String serverPackage;
    /**
     * 生成控制器的包名
     */
    public static String controllerPackage;
    /**
     * 生成 Mybatis XML 的路径，是 mybatis/mapper 的子路径
     */
    public static String xmlPath;
    /**
     * 表前缀，生成类名时会去除该前缀，例如，sys_log 生成 Log.java。如表不存在前缀可不配置
     */
    public static String tablePrefix;
    /**
     * 生成类名时是否自动去除表前缀，0-否，1-是。此项也可不配置，即不自动去除前缀
     */
    public static String autoRemovePrefix;

    public static String getAuthor() {
        return author;
    }

    @Value("${yuntao.code.author:}")
    public void setAuthor(String author) {
        CodeGeneration.author = author;
    }

    public static String getSince() {
        return since;
    }

    @Value("${yuntao.code.since:}")
    public void setSince(String since) {
        CodeGeneration.since = since;
    }

    public static String getMulti() {
        return multi;
    }

    @Value("${yuntao.code.multi:0}")
    public void setMulti(String multi) {
        CodeGeneration.multi = multi;
    }

    public static String getServerPackage() {
        return serverPackage;
    }

    @Value("${yuntao.code.serverPackage:}")
    public void setServerPackage(String serverPackage) {
        CodeGeneration.serverPackage = serverPackage;
    }

    public static String getControllerPackage() {
        return controllerPackage;
    }

    @Value("${yuntao.code.controllerPackage:}")
    public void setControllerPackage(String controllerPackage) {
        CodeGeneration.controllerPackage = controllerPackage;
    }

    public static String getXmlPath() {
        return xmlPath;
    }

    @Value("${yuntao.code.xmlPath:}")
    public void setXmlPath(String xmlPath) {
        CodeGeneration.xmlPath = xmlPath;
    }

    public static String getTablePrefix() {
        return tablePrefix;
    }

    @Value("${yuntao.code.tablePrefix:}")
    public void setTablePrefix(String tablePrefix) {
        CodeGeneration.tablePrefix = tablePrefix;
    }

    public static String getAutoRemovePrefix() {
        return autoRemovePrefix;
    }

    @Value("${yuntao.code.autoRemovePrefix:1}")
    public void setAutoRemovePrefix(String autoRemovePrefix) {
        CodeGeneration.autoRemovePrefix = autoRemovePrefix;
    }
}
