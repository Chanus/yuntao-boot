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
package com.chanus.yuntao.boot.framework.base.mapper;

import java.util.List;
import java.util.Map;

/**
 * MyBatis 基础接口
 *
 * @author Chanus
 * @date 2020-07-30 14:15:13
 * @since 0.0.1
 */
public interface BaseMapper<T> extends com.baomidou.mybatisplus.core.mapper.BaseMapper<T> {
    /**
     * 获取记录条数
     *
     * @param params 参数集合
     * @return 记录条数
     */
    int count(Map<String, Object> params);

    /**
     * 获取记录列表
     *
     * @param params 参数集合
     * @return 记录列表
     */
    List<T> list(Map<String, Object> params);
}
