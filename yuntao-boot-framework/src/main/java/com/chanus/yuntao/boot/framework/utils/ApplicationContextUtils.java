/*
 * Copyright (c) 2020 Chanus
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.chanus.yuntao.boot.framework.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * applicationContext 工具类
 *
 * @author Chanus
 * @date 2020-08-11 09:25:59
 * @since 0.0.1
 */
@Component
public class ApplicationContextUtils implements ApplicationContextAware {
    /**
     * 上下文对象实例
     */
    private static ApplicationContext appContext;

    /**
     * Spring 自动注入 applicationContext 对象，因此该 Bean 必须 @Component 被 Spring scan 发现
     *
     * @param applicationContext {@link ApplicationContext}
     * @throws BeansException {@link BeansException}
     */
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        appContext = applicationContext;
    }

    /**
     * 获得 applicationContext
     *
     * @return {@link ApplicationContext}
     */
    public static ApplicationContext getAppContext() {
        return appContext;
    }

    /**
     * 根据 name 获取 Bean
     *
     * @param name Bean 名称
     * @return Bean
     */
    public static Object getBean(String name) {
        return getAppContext().getBean(name);
    }

    /**
     * 根据 class 获取 Bean
     *
     * @param clazz Bean class
     * @param <T>   Bean 类型
     * @return Bean
     */
    public static <T> T getBean(Class<T> clazz) {
        return getAppContext().getBean(clazz);
    }

    /**
     * 根据 name、class 获得 Bean
     *
     * @param name  Bean 名称
     * @param clazz Bean class
     * @param <T>   Bean 类型
     * @return Bean
     */
    public static <T> T getBean(String name, Class<T> clazz) {
        return getAppContext().getBean(name, clazz);
    }
}
