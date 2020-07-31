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
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import com.chanus.yuntao.utils.core.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import java.sql.SQLException;

/**
 * Druid 配置<br>
 * Druid 是数据库连接池，负责管理数据库的连接，给 Mybatis 提供数据库的连接
 *
 * @author Chanus
 * @date 2020-07-29 11:20:20
 * @since 0.0.1
 */
@Configuration
public class DruidConfiguration {
    @Autowired
    private DruidProperties druidProperties;

    /**
     * 这个方法告诉框架，数据源是由这个方法来提供<br>
     * 注解 @Primary 意思是告诉框架，如果开发者没有指定其他数据源，那么就默认调用这个方法来提供数据源
     *
     * @return
     */
    @Bean(initMethod = "init", destroyMethod = "close")
    @Primary
    public DruidDataSource dataSource() {
        DruidDataSource druidDataSource = new DruidDataSource();
        // 数据库驱动
        druidDataSource.setDriverClassName(druidProperties.getDriverClassName());
        // 连接数据库的url
        druidDataSource.setUrl(druidProperties.getUrl());
        // 连接数据库的用户名
        druidDataSource.setUsername(druidProperties.getUsername());
        // 连接数据库的密码
        druidDataSource.setPassword(druidProperties.getPassword());
        // 初始化时建立物理连接的个数
        druidDataSource.setInitialSize(druidProperties.getInitialSize());
        // 最小连接池数量
        druidDataSource.setMinIdle(druidProperties.getMinIdle());
        // 最大连接池数量
        druidDataSource.setMaxActive(druidProperties.getMaxActive());
        // 获取连接时最大等待时间，单位毫秒
        druidDataSource.setMaxWait(druidProperties.getMaxWait());
        // 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒
        druidDataSource.setTimeBetweenEvictionRunsMillis(druidProperties.getTimeBetweenEvictionRunsMillis());
        // 配置一个连接在池中最小生存的时间，单位是毫秒
        druidDataSource.setMinEvictableIdleTimeMillis(druidProperties.getMinEvictableIdleTimeMillis());
        // 配置一个连接在池中最大生存的时间，单位是毫秒
        druidDataSource.setMaxEvictableIdleTimeMillis(druidProperties.getMaxEvictableIdleTimeMillis());
        // 用来检测连接是否有效的sql，要求是一个查询语句
        druidDataSource.setValidationQuery(druidProperties.getValidationQuery());
        // 申请连接的时候检测，如果空闲时间大于timeBetweenEvictionRunsMillis，执行validationQuery检测连接是否有效
        druidDataSource.setTestWhileIdle(druidProperties.getTestWhileIdle());
        // 申请连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能
        druidDataSource.setTestOnBorrow(druidProperties.getTestOnBorrow());
        // 归还连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能
        druidDataSource.setTestOnReturn(druidProperties.getTestOnReturn());
        // 是否缓存preparedStatement，也就是PSCache
        druidDataSource.setPoolPreparedStatements(druidProperties.getPoolPreparedStatements());
        // 要启用PSCache，必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true
        druidDataSource.setMaxPoolPreparedStatementPerConnectionSize(druidProperties.getMaxPoolPreparedStatementPerConnectionSize());
        // 连接超过时间限制多长，单位秒
        druidDataSource.setRemoveAbandonedTimeout(druidProperties.getRemoveAbandonedTimeout());
        // 一个连接从被连接到被关闭之间的最大生命周期
        druidDataSource.setRemoveAbandonedTimeoutMillis(druidProperties.getRemoveAbandonedTimeoutMillis());
        // 是否强制关闭连接时长大于removeAbandonedTimeoutMillis的连接
        druidDataSource.setRemoveAbandoned(druidProperties.getRemoveAbandoned());
        // 强制关闭连接时是否记录日志
        druidDataSource.setLogAbandoned(druidProperties.getLogAbandoned());
        druidDataSource.setLogDifferentThread(druidProperties.getLogDifferentThread());
        // 配置监控统计拦截的filters
        try {
            druidDataSource.setFilters(druidProperties.getFilters());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // 数据库连接密码是否做加密
        if (druidProperties.getEncryptPassword()) {
            // 连接参数
            druidDataSource.setConnectionProperties(druidProperties.getConnectionProperties() + ";encryptKey=" + druidProperties.getEncryptKey());
            try {
                druidDataSource.setPasswordCallbackClassName("com.chanus.yuntao.boot.framework.configuration.druid.DBPasswordCallback");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // 连接参数
            druidDataSource.setConnectionProperties(druidProperties.getConnectionProperties());
        }
        // 合并多个DruidDataSource的监控数据
        druidDataSource.setUseGlobalDataSourceStat(druidProperties.getUseGlobalDataSourceStat());

        return druidDataSource;
    }

    /**
     * 配置 Druid 监控页面
     *
     * @return
     */
    @Bean
    public ServletRegistrationBean servletRegistrationBean() {
        ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean(new StatViewServlet(), druidProperties.getDruidRegistrationUrl());

        // IP白名单
        if (StringUtils.isNotBlank(druidProperties.getAllow()))
            servletRegistrationBean.addInitParameter("allow", druidProperties.getAllow());
        // IP黑名单(共同存在时，deny优先于allow)
        if (StringUtils.isNotBlank(druidProperties.getDeny()))
            servletRegistrationBean.addInitParameter("deny", druidProperties.getDeny());
        // 是否能够重置数据，开启或关闭HTML页面上的“Reset All”功能
        servletRegistrationBean.addInitParameter("resetEnable", String.valueOf(druidProperties.getResetEnable()));
        // 控制台管理用户账号和密码
        servletRegistrationBean.addInitParameter("loginUsername", druidProperties.getLoginUsername());
        servletRegistrationBean.addInitParameter("loginPassword", druidProperties.getLoginPassword());

        return servletRegistrationBean;
    }

    /**
     * 配置 Druid 监控过滤一些没必要的资源和页面
     *
     * @return
     */
    @Bean
    public FilterRegistrationBean filterRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean(new WebStatFilter());
        // 内置监控页面URL
        filterRegistrationBean.addUrlPatterns(druidProperties.getFiltersUrlPatterns());
        // 需要过滤的资源
        filterRegistrationBean.addInitParameter("exclusions", druidProperties.getExclusions());
        // session统计的最大数量，缺省是1000个
        filterRegistrationBean.addInitParameter("sessionStatMaxCount", String.valueOf(druidProperties.getSessionStatMaxCount()));
        // 是否关闭session统计功能
        filterRegistrationBean.addInitParameter("sessionStatEnable", String.valueOf(druidProperties.getSessionStatEnable()));
        // 使得druid能够知道当前的session的用户是谁，你user信息保存在session中的sessionName
        filterRegistrationBean.addInitParameter("principalSessionName", druidProperties.getPrincipalSessionName());
        // 监控单个url调用的sql列表
        filterRegistrationBean.addInitParameter("profileEnable", String.valueOf(druidProperties.getProfileEnable()));

        return filterRegistrationBean;
    }
}
