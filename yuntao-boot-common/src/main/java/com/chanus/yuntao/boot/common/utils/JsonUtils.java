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
package com.chanus.yuntao.boot.common.utils;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Json 工具类
 *
 * @author Chanus
 * @date 2020-08-05 11:50:19
 * @since 0.0.3
 */
public class JsonUtils {
    private final static ObjectMapper objectMapper = new ObjectMapper();

    public static ObjectMapper getInstance() {
        return objectMapper;
    }

    /**
     * 对象转换为 JSON 字符串
     *
     * @param o 对象
     * @return JSON 字符串
     */
    public static String objectToJson(Object o) {
        try {
            return objectMapper.writeValueAsString(o);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 对象转换为 JSON 字符串，忽略空值
     *
     * @param o 对象
     * @return JSON 字符串
     */
    public static String objectToJsonIgnoreNull(Object o) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        try {
            return mapper.writeValueAsString(o);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * JSON 字符串转换为对象
     *
     * @param json  JSON 字符串
     * @param clazz 对象 class
     * @param <T>   对象类型
     * @return 对象
     */
    public static <T> T jsonToObject(String json, Class<T> clazz) {
        objectMapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
        try {
            return objectMapper.readValue(json, clazz);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * JSON 字符串转换为对象
     *
     * @param json JSON 字符串
     * @return Object
     */
    public static Object jsonToObject(String json) {
        objectMapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
        try {
            return objectMapper.readValue(json, Object.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * JSON 字符串转换为 Map 集合
     *
     * @param json JSON 字符串
     * @return Map 集合
     */
    public static Map jsonToMap(String json) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        try {
            return mapper.readValue(json, Map.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * JSON 数组转换为 List 集合
     *
     * @param jsonArray JSON 数组字符串
     * @param clazz     对象 class
     * @param <T>       对象类型
     * @return List 集合
     */
    public static <T> List<T> jsonToList(String jsonArray, Class<T> clazz) {
        JavaType javaType = getCollectionType(ArrayList.class, clazz);
        try {
            return objectMapper.readValue(jsonArray, javaType);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }
    }


    /**
     * 获取泛型的 Collection Type
     *
     * @param collectionClass 集合类 class
     * @param elementClasses  元素类 class
     * @return JavaType Java类型
     */
    public static JavaType getCollectionType(Class<?> collectionClass, Class<?>... elementClasses) {
        return objectMapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);
    }

    /**
     * 将 Map 转换为 JavaBean
     *
     * @param map   Map 集合数据
     * @param clazz JavaBean class
     * @param <T>   JavaBean类型
     * @return JavaBean 对象
     */
    public static <T> T mapToObject(Map map, Class<T> clazz) {
        return objectMapper.convertValue(map, clazz);
    }

    /**
     * 将 Map 转换为 JSON 字符串
     *
     * @param map Map 集合数据
     * @return JSON 字符串
     */
    public static String mapToJson(Map map) {
        try {
            return objectMapper.writeValueAsString(map);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 将 JSON 对象转换为 JavaBean
     *
     * @param jsonObject JSON 对象
     * @param clazz      JavaBean class
     * @return JavaBean 对象
     */
    public static <T> T jsonObjectToObject(Object jsonObject, Class<T> clazz) {
        return objectMapper.convertValue(jsonObject, clazz);
    }
}
