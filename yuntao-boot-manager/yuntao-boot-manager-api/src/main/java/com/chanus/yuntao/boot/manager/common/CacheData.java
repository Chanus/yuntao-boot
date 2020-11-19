package com.chanus.yuntao.boot.manager.common;

import com.chanus.yuntao.boot.manager.model.DictItem;
import com.chanus.yuntao.utils.core.encrypt.RSAUtils;
import org.springframework.beans.factory.BeanFactoryUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.mvc.condition.PatternsRequestCondition;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.concurrent.ConcurrentLinkedQueue;

/**
 * 系统缓存数据
 *
 * @author Chanus
 * @date 2020-08-01 14:07:25
 * @since 1.0.0
 */
public class CacheData {
    /**
     * 存储系统参数配置信息
     */
    public static final Map<String, String> SYSTEM_PARAMS_MAP = new HashMap<>();

    /**
     * 存储系统字典数据，Map 的 key 为字典集代码，value 为有序的字典项列表
     */
    public static final Map<String, List<DictItem>> SYSTEM_DICT_MAP = new HashMap<>();

    /**
     * 存储系统字典项数据，Map 的 key 为“字典集代码-字典项代码”，value 为字典项名称
     */
    public static final Map<String, String> SYSTEM_DICT_ITEM_MAP = new HashMap<>();

    /**
     * 存储所有的请求 URL 及 Controller 类名，Map<Controller, List<URL>>
     */
    public static final Map<String, Set<String>> CLASS_URL_MAP = new HashMap<>();

    /**
     * 存储 RSA 密钥对
     */
    public static final Queue<Map<String, String>> RSA_KEYS_QUEUE = new ConcurrentLinkedQueue<>();

    /**
     * 存储从 {@code RSA_KEYS_QUEUE} 队列中取出的 RSA 密钥对
     */
    public static final Map<String, String> RSA_KEYS_MAP = new HashMap<>();

    /**
     * 初始化 CLASS_URL_MAP
     */
    public static void initClassUrlMap(HttpServletRequest request) {
        WebApplicationContext webApplicationContext = (WebApplicationContext) request.getAttribute(DispatcherServlet.WEB_APPLICATION_CONTEXT_ATTRIBUTE);//获取上下文对象
        Map<String, RequestMappingHandlerMapping> map = BeanFactoryUtils.beansOfTypeIncludingAncestors(webApplicationContext, RequestMappingHandlerMapping.class, true, false);
        for (RequestMappingHandlerMapping rmhm : map.values()) {
            Map<RequestMappingInfo, HandlerMethod> handlerMethods = rmhm.getHandlerMethods();
            for (Map.Entry<RequestMappingInfo, HandlerMethod> requestMappingInfoHandlerMethodEntry : handlerMethods.entrySet()) {
                HandlerMethod mappingInfoValue = requestMappingInfoHandlerMethodEntry.getValue();
                RequestMappingInfo requestMappingInfo = requestMappingInfoHandlerMethodEntry.getKey();

                // 获取Controller类
                String controllerName = mappingInfoValue.getBeanType().toString().replace("class", "").replace(" ", "");

                // 存储Controller类
                CacheData.CLASS_URL_MAP.computeIfAbsent(controllerName, k -> new TreeSet<>());

                // 存储请求URL
                PatternsRequestCondition patternsCondition = requestMappingInfo.getPatternsCondition();
                CacheData.CLASS_URL_MAP.get(controllerName).add(patternsCondition.toString().replace("[", "").replace("]", ""));
            }
        }
    }

    /**
     * 初始化 RSA_KEYS_QUEUE
     */
    public static void initRsaKeysQueue() {
        for (int i = 0; i < 100; i++) {
            RSA_KEYS_QUEUE.offer(RSAUtils.generateKeyPair());
        }
    }

    /**
     * 从队列 {@code RSA_KEYS_QUEUE} 中取出一个 RSA 密钥对，如果队列 {@code RSA_KEYS_QUEUE} 为空，则重新初始化一次队列
     *
     * @return RSA 密钥对
     */
    public static Map<String, String> getRsaKey() {
        if (CacheData.RSA_KEYS_QUEUE.size() == 0)
            initRsaKeysQueue();
        return CacheData.RSA_KEYS_QUEUE.poll();
    }
}
