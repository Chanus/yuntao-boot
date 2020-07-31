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

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 数据库连接池 Druid 连接属性配置
 *
 * @author Chanus
 * @date 2020-07-29 11:21:55
 * @since 0.0.1
 */
@Component
@ConfigurationProperties(prefix = "spring.datasource")
public class DruidProperties {
    // 数据库驱动
    private String driverClassName;
    // 数据库连接
    private String url;
    // 账号
    private String username;
    // 密码
    private String password;
    // 初始化连接数量
    private int initialSize = 5;
    // 最小空闲连接数
    private int minIdle = 10;
    // 最大并发连接数
    private int maxActive = 20;
    // 获取连接等待超时的时间
    private long maxWait = 60000L;
    // 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒
    private long timeBetweenEvictionRunsMillis = 60000L;
    // 配置一个连接在池中最小生存的时间，单位是毫秒
    private long minEvictableIdleTimeMillis = 300000L;
    // 配置一个连接在池中最大生存的时间，单位是毫秒
    private long maxEvictableIdleTimeMillis = 900000L;
    // 用来检测连接是否有效的sql，要求是一个查询语句
    private String validationQuery = "SELECT 'x'";
    // 申请连接的时候检测，如果空闲时间大于timeBetweenEvictionRunsMillis，执行validationQuery检测连接是否有效
    private boolean testWhileIdle = true;
    // 获取链接的时候，校验是否可用，开启会有损性能
    private boolean testOnBorrow = false;
    // 归还链接到连接池的时候校验链接是否可用
    private boolean testOnReturn = false;
    // 打开PSCache，并且指定每个连接上PSCache的大小
    private boolean poolPreparedStatements = true;

    private int maxPoolPreparedStatementPerConnectionSize = 20;
    // 超过时间限制多长，1800秒
    private int removeAbandonedTimeout = 1800;

    private long removeAbandonedTimeoutMillis = 20000L;
    // 超过时间限制是否回收
    private boolean removeAbandoned = true;

    private boolean logAbandoned = true;

    private boolean logDifferentThread = true;
    // 通过别名的方式配置扩展插件：监控统计用的filter:stat；日志用的filter:log4j；防御sql注入的filter:wall
    private String filters;
    // 连接参数
    private String connectionProperties;

    private boolean useGlobalDataSourceStat = true;
    // 数据库密码是否加密
    private boolean encryptPassword = true;
    // 数据库密码加密密钥
    private String encryptKey = "ChanusYuntaoJDBC";

    // Druid 监控 Servlet 配置参数
    private String druidRegistrationUrl = "/druid/*";

    private String allow;

    private String deny;

    private boolean resetEnable = true;

    private String loginUsername = "druid";

    private String loginPassword = "druid";

    // Filters 配置参数
    private String filtersUrlPatterns = "/*";

    private String exclusions = "*.js,*.gif,*.jpg,*.jpeg,*.bmp,*.png,*.css,*.ico,/druid/*";

    private int sessionStatMaxCount = 1000;

    private boolean sessionStatEnable = true;

    private String principalSessionName = "loginUser";

    private boolean profileEnable = true;

    public String getDriverClassName() {
        return driverClassName;
    }

    public void setDriverClassName(String driverClassName) {
        this.driverClassName = driverClassName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getInitialSize() {
        return initialSize;
    }

    public void setInitialSize(int initialSize) {
        this.initialSize = initialSize;
    }

    public int getMinIdle() {
        return minIdle;
    }

    public void setMinIdle(int minIdle) {
        this.minIdle = minIdle;
    }

    public int getMaxActive() {
        return maxActive;
    }

    public void setMaxActive(int maxActive) {
        this.maxActive = maxActive;
    }

    public long getMaxWait() {
        return maxWait;
    }

    public void setMaxWait(long maxWait) {
        this.maxWait = maxWait;
    }

    public long getTimeBetweenEvictionRunsMillis() {
        return timeBetweenEvictionRunsMillis;
    }

    public void setTimeBetweenEvictionRunsMillis(long timeBetweenEvictionRunsMillis) {
        this.timeBetweenEvictionRunsMillis = timeBetweenEvictionRunsMillis;
    }

    public long getMinEvictableIdleTimeMillis() {
        return minEvictableIdleTimeMillis;
    }

    public void setMinEvictableIdleTimeMillis(long minEvictableIdleTimeMillis) {
        this.minEvictableIdleTimeMillis = minEvictableIdleTimeMillis;
    }

    public long getMaxEvictableIdleTimeMillis() {
        return maxEvictableIdleTimeMillis;
    }

    public void setMaxEvictableIdleTimeMillis(long maxEvictableIdleTimeMillis) {
        this.maxEvictableIdleTimeMillis = maxEvictableIdleTimeMillis;
    }

    public String getValidationQuery() {
        return validationQuery;
    }

    public void setValidationQuery(String validationQuery) {
        this.validationQuery = validationQuery;
    }

    public boolean getTestWhileIdle() {
        return testWhileIdle;
    }

    public void setTestWhileIdle(boolean testWhileIdle) {
        this.testWhileIdle = testWhileIdle;
    }

    public boolean getTestOnBorrow() {
        return testOnBorrow;
    }

    public void setTestOnBorrow(boolean testOnBorrow) {
        this.testOnBorrow = testOnBorrow;
    }

    public boolean getTestOnReturn() {
        return testOnReturn;
    }

    public void setTestOnReturn(boolean testOnReturn) {
        this.testOnReturn = testOnReturn;
    }

    public boolean getPoolPreparedStatements() {
        return poolPreparedStatements;
    }

    public void setPoolPreparedStatements(boolean poolPreparedStatements) {
        this.poolPreparedStatements = poolPreparedStatements;
    }

    public int getMaxPoolPreparedStatementPerConnectionSize() {
        return maxPoolPreparedStatementPerConnectionSize;
    }

    public void setMaxPoolPreparedStatementPerConnectionSize(int maxPoolPreparedStatementPerConnectionSize) {
        this.maxPoolPreparedStatementPerConnectionSize = maxPoolPreparedStatementPerConnectionSize;
    }

    public int getRemoveAbandonedTimeout() {
        return removeAbandonedTimeout;
    }

    public void setRemoveAbandonedTimeout(int removeAbandonedTimeout) {
        this.removeAbandonedTimeout = removeAbandonedTimeout;
    }

    public long getRemoveAbandonedTimeoutMillis() {
        return removeAbandonedTimeoutMillis;
    }

    public void setRemoveAbandonedTimeoutMillis(long removeAbandonedTimeoutMillis) {
        this.removeAbandonedTimeoutMillis = removeAbandonedTimeoutMillis;
    }

    public boolean getRemoveAbandoned() {
        return removeAbandoned;
    }

    public void setRemoveAbandoned(boolean removeAbandoned) {
        this.removeAbandoned = removeAbandoned;
    }

    public boolean getLogAbandoned() {
        return logAbandoned;
    }

    public void setLogAbandoned(boolean logAbandoned) {
        this.logAbandoned = logAbandoned;
    }

    public boolean getLogDifferentThread() {
        return logDifferentThread;
    }

    public void setLogDifferentThread(boolean logDifferentThread) {
        this.logDifferentThread = logDifferentThread;
    }

    public String getFilters() {
        return filters;
    }

    public void setFilters(String filters) {
        this.filters = filters;
    }

    public String getConnectionProperties() {
        return connectionProperties;
    }

    public void setConnectionProperties(String connectionProperties) {
        this.connectionProperties = connectionProperties;
    }

    public boolean getUseGlobalDataSourceStat() {
        return useGlobalDataSourceStat;
    }

    public void setUseGlobalDataSourceStat(boolean useGlobalDataSourceStat) {
        this.useGlobalDataSourceStat = useGlobalDataSourceStat;
    }

    public boolean getEncryptPassword() {
        return encryptPassword;
    }

    public void setEncryptPassword(boolean encryptPassword) {
        this.encryptPassword = encryptPassword;
    }

    public String getEncryptKey() {
        return encryptKey;
    }

    public void setEncryptKey(String encryptKey) {
        this.encryptKey = encryptKey;
    }

    public String getDruidRegistrationUrl() {
        return druidRegistrationUrl;
    }

    public void setDruidRegistrationUrl(String druidRegistrationUrl) {
        this.druidRegistrationUrl = druidRegistrationUrl;
    }

    public String getAllow() {
        return allow;
    }

    public void setAllow(String allow) {
        this.allow = allow;
    }

    public String getDeny() {
        return deny;
    }

    public void setDeny(String deny) {
        this.deny = deny;
    }

    public boolean getResetEnable() {
        return resetEnable;
    }

    public void setResetEnable(boolean resetEnable) {
        this.resetEnable = resetEnable;
    }

    public String getLoginUsername() {
        return loginUsername;
    }

    public void setLoginUsername(String loginUsername) {
        this.loginUsername = loginUsername;
    }

    public String getLoginPassword() {
        return loginPassword;
    }

    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword;
    }

    public String getFiltersUrlPatterns() {
        return filtersUrlPatterns;
    }

    public void setFiltersUrlPatterns(String filtersUrlPatterns) {
        this.filtersUrlPatterns = filtersUrlPatterns;
    }

    public String getExclusions() {
        return exclusions;
    }

    public void setExclusions(String exclusions) {
        this.exclusions = exclusions;
    }

    public int getSessionStatMaxCount() {
        return sessionStatMaxCount;
    }

    public void setSessionStatMaxCount(int sessionStatMaxCount) {
        this.sessionStatMaxCount = sessionStatMaxCount;
    }

    public boolean getSessionStatEnable() {
        return sessionStatEnable;
    }

    public void setSessionStatEnable(boolean sessionStatEnable) {
        this.sessionStatEnable = sessionStatEnable;
    }

    public String getPrincipalSessionName() {
        return principalSessionName;
    }

    public void setPrincipalSessionName(String principalSessionName) {
        this.principalSessionName = principalSessionName;
    }

    public boolean getProfileEnable() {
        return profileEnable;
    }

    public void setProfileEnable(boolean profileEnable) {
        this.profileEnable = profileEnable;
    }
}
