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

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;

/**
 * 国际化工具类
 *
 * @author Chanus
 * @date 2020-11-19 15:56:32
 * @since 0.3.0
 */
@Component
public class MessageUtils {
    private static MessageSource messageSource;

    public MessageUtils(MessageSource messageSource) {
        MessageUtils.messageSource = messageSource;
    }

    /**
     * 获取单个国际化翻译值，没找到则返回 messageKey
     * <pre>
     *     test.t1=aaa ==> get("test.t1") = aaa; get("test.t2") = test.t2
     * </pre>
     *
     * @param messageKey message 的 key
     * @return 国际化翻译值
     */
    public static String get(String messageKey) {
        try {
            return messageSource.getMessage(messageKey, null, LocaleContextHolder.getLocale());
        } catch (Exception e) {
            return messageKey;
        }
    }

    /**
     * 获取单个国际化翻译值，没找到则返回 messageKey
     * <pre>
     *     test.t1=aaa ==> get("test.t1", null) = aaa; get("test.t2", null) = test.t2
     *     test.t1=aaa {0} ccc {1} ==> get("test.t1", new String[] {"bbb", "ddd"}) = aaa bbb ccc ddd
     * </pre>
     *
     * @param messageKey message 的 key
     * @param objects    message 中占位符需要替换的内容
     * @return 国际化翻译值
     */
    public static String get(String messageKey, Object[] objects) {
        try {
            return messageSource.getMessage(messageKey, objects, LocaleContextHolder.getLocale());
        } catch (Exception e) {
            return messageKey;
        }
    }
}
