package com.chanus.yuntao.boot.manager.annotation;

import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;

import java.lang.annotation.*;

/**
 * 自定义注解，记录系统操作日志<p>
 * module       模块代码<p>
 * description  日志描述<p>
 * logType      日志类型<p>
 * ignore       是否忽略日志内容，默认false<p>
 *
 * @author Chanus
 * @date 2020-08-01 15:37:04
 * @since 1.0.0
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    String module() default "";

    String description() default "";

    LogTypeEnum logType();

    boolean ignore() default false;
}
