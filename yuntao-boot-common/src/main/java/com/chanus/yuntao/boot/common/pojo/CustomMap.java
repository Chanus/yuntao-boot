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
package com.chanus.yuntao.boot.common.pojo;

import java.util.HashMap;

/**
 * 自定义 Map，继承 HashMap
 *
 * @author Chanus
 * @date 2020-07-30 11:43:01
 * @since 0.0.1
 */
public class CustomMap extends HashMap<String, Object> {
    private static final long serialVersionUID = -2134655860346348704L;

    /**
     * 创建 {@code CustomMap} 对象
     *
     * @return {@link CustomMap}
     */
    public static CustomMap create() {
        return new CustomMap();
    }

    /**
     * 创建 {@code CustomMap} 对象
     *
     * @param key   键
     * @param value 值
     * @return {@link CustomMap}
     */
    public static CustomMap create(String key, Object value) {
        return create().putNext(key, value);
    }

    /**
     * 存储数据并返回当前对象
     *
     * @param key   键
     * @param value 值
     * @return 当前 {@code CustomMap} 对象
     */
    public CustomMap putNext(String key, Object value) {
        this.put(key, value);
        return this;
    }
}
