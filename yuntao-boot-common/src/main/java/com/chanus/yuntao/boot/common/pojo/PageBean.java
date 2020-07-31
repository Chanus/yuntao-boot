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

import java.util.List;

/**
 * 分页查询数据封装类
 *
 * @author Chanus
 * @date 2020-07-30 10:28:24
 * @since 0.0.1
 */
public class PageBean {
    /**
     * 默认分页查询时每页显示的数据条数
     */
    public static final int PAGE_SIZE = 20;

    /**
     * 信息代码
     */
    private int code;

    /**
     * 信息内容
     */
    private String msg;

    /**
     * 记录条数
     */
    private int count;

    /**
     * 记录对象
     */
    private Object object;

    /**
     * 记录列表
     */
    private List<?> data;

    /**
     * 记录统计行
     */
    private Object totalRow;

    /**
     * 构造方法，初始化 {@code code} 和 {@code count}
     */
    public PageBean() {
        super();
        this.code = 0;
        this.count = 0;
    }

    /**
     * 构造方法，初始化 {@code code}、{@code count} 和 {@code data}
     *
     * @param count 记录条数
     * @param data  记录列表
     */
    public PageBean(Integer count, List<?> data) {
        super();
        this.code = 0;
        this.count = count;
        this.data = data;
    }

    /**
     * 构造方法，初始化 {@code code}、{@code count}、{@code data} 和 {@code totalRow}
     *
     * @param count    记录条数
     * @param data     记录列表
     * @param totalRow 记录统计行
     */
    public PageBean(Integer count, List<?> data, Object totalRow) {
        super();
        this.code = 0;
        this.count = count;
        this.data = data;
        this.totalRow = totalRow;
    }

    /**
     * 设置 {@code count} 和 {@code data}
     *
     * @param count 记录条数
     * @param data  记录列表
     * @return 当前 {@code PageBean} 对象
     */
    public PageBean init(Integer count, List<?> data) {
        this.count = count;
        this.data = data;
        return this;
    }

    /**
     * 设置 {@code count}、{@code data} 和 {@code totalRow}
     *
     * @param count    记录条数
     * @param data     记录列表
     * @param totalRow 记录统计行
     * @return 当前 {@code PageBean} 对象
     */
    public PageBean init(Integer count, List<?> data, Object totalRow) {
        this.count = count;
        this.data = data;
        this.totalRow = totalRow;
        return this;
    }

    /**
     * 分页
     *
     * @param count 记录条数
     * @param data  记录列表
     * @return {@link PageBean}
     */
    public static PageBean pagination(Integer count, List<?> data) {
        return new PageBean(count, data);
    }

    /**
     * 分页，带统计行
     *
     * @param count    记录条数
     * @param data     记录列表
     * @param totalRow 记录统计行
     * @return {@link PageBean}
     */
    public static PageBean pagination(Integer count, List<?> data, Object totalRow) {
        return new PageBean(count, data, totalRow);
    }

    public int getCode() {
        return code;
    }

    public PageBean setCode(int code) {
        this.code = code;
        return this;
    }

    public String getMsg() {
        return msg;
    }

    public PageBean setMsg(String msg) {
        this.msg = msg;
        return this;
    }

    public int getCount() {
        return count;
    }

    public PageBean setCount(int count) {
        this.count = count;
        return this;
    }

    public Object getObject() {
        return object;
    }

    public PageBean setObject(Object object) {
        this.object = object;
        return this;
    }

    public List<?> getData() {
        return data;
    }

    public PageBean setData(List<?> data) {
        this.data = data;
        return this;
    }

    public Object getTotalRow() {
        return totalRow;
    }

    public PageBean setTotalRow(Object totalRow) {
        this.totalRow = totalRow;
        return this;
    }

    @Override
    public String toString() {
        return "PageBean [" +
                "code=" + code +
                ", msg=" + msg +
                ", count=" + count +
                ", object=" + object +
                ", data=" + data +
                ", totalRow=" + totalRow +
                "]";
    }
}
