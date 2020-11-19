package com.chanus.yuntao.boot.manager.configuration;

import com.chanus.yuntao.boot.common.constant.Constants;
import com.chanus.yuntao.boot.framework.configuration.system.Global;
import com.chanus.yuntao.boot.manager.interceptor.RequestInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.ResourceUtils;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 配置静态资源映射
 *
 * @author Chanus
 * @date 2020-08-03 15:07:05
 * @since 1.0.0
 */
@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
    /**
     * addResourceLocations指的是文件放置的目录
     * addResoureHandler指的是对外暴露的访问路径
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 排除静态资源拦截
        registry.addResourceHandler("/static/**", "/upload/**").addResourceLocations(ResourceUtils.CLASSPATH_URL_PREFIX + "/static/",
                "file:" + Global.profile + Constants.UPLOAD_PATH);
        WebMvcConfigurer.super.addResourceHandlers(registry);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new RequestInterceptor())// 注册 RequestInterceptor 拦截器
                .addPathPatterns("/**")// 所有路径都被拦截
                .excludePathPatterns("/", "/js/**", "/css/**", "/images/**", "/font/**", "/audio/**", "/lib/**",
                        "/json/**", "/theme/**", "/i18n/**", "/upload/**",
                        "/login", "/relogin", "/rsa-public-key", "/verify-code", "/external/**", "/api/**");
    }
}
