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
package com.chanus.yuntao.boot.framework.configuration.druid;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

/**
 * Druid 事务配置<br>
 * 让 Druid 支持事务，实现 Spring 的 TransactionManagementConfigurer 接口，重写该接口下的 annotationDrivenTransactionManager 方法，
 * 在这个方法里面给 DruidDataSource 开启事务，同时让这个类在 DruidConfig 被 Spring 加载之后，再去被 Spring 加载
 *
 * @author Chanus
 * @date 2020-07-29 11:16:48
 * @since 0.0.1
 */
@EnableTransactionManagement
@AutoConfigureAfter({DruidConfiguration.class})
public class DruidTransactionConfiguration implements TransactionManagementConfigurer {
    @Autowired
    private DruidDataSource druidDataSource;

    @Override
    public PlatformTransactionManager annotationDrivenTransactionManager() {
        return new DataSourceTransactionManager(druidDataSource);
    }
}
