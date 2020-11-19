package com.chanus.yuntao.boot.manager.common.enums;

/**
 * 系统日志操作类型
 *
 * @author Chanus
 * @date 2020-08-01 14:38:10
 * @since 1.0.0
 */
public enum LogTypeEnum {
    /**
     * 登录
     */
    LOGIN,
    /**
     * 注销
     */
    LOGOUT,
    /**
     * 添加
     */
    INSERT,
    /**
     * 删除
     */
    DELETE,
    /**
     * 更新
     */
    UPDATE,
    /**
     * 添加或更新
     */
    SAVE,
    /**
     * 系统异常
     */
    EXCEPTION,
    /**
     * 定时任务
     */
    SCHEDULER
}
