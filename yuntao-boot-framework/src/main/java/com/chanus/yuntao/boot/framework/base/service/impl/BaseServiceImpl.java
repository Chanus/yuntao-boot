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
package com.chanus.yuntao.boot.framework.base.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chanus.yuntao.boot.common.pojo.CustomMap;
import com.chanus.yuntao.boot.common.pojo.PageBean;
import com.chanus.yuntao.boot.framework.base.mapper.BaseMapper;
import com.chanus.yuntao.boot.framework.base.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * Service 基类，实现基础的公用 CRUD 方法
 *
 * @param <Mapper> Mybatis实体接口
 * @param <T>      实体对象
 * @author Chanus
 * @date 2020-07-30 14:23:28
 * @since 0.0.1
 */
public class BaseServiceImpl<Mapper extends BaseMapper<T>, T> extends ServiceImpl<Mapper, T> implements BaseService<T> {
    protected Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * 获取记录条数
     *
     * @param params 参数集合
     * @return 记录条数
     */
    @Override
    public int count(CustomMap params) {
        return getBaseMapper().count(params);
    }

    /**
     * 获取记录列表
     *
     * @param params 参数集合
     * @return 记录列表
     */
    @Override
    public List<T> list(CustomMap params) {
        return getBaseMapper().list(params);
    }

    /**
     * 分页查询记录列表
     *
     * @param params 参数集合
     * @return 指定页的数据信息
     */
    @Override
    public PageBean listPagination(CustomMap params) {
        int count = getBaseMapper().count(params);
        if (count > 0) {
            int page = params.get("page") == null ? 1 : Integer.parseInt(String.valueOf(params.get("page")));
            int limit = params.get("limit") == null ? PageBean.PAGE_SIZE : Integer.parseInt(String.valueOf(params.get("limit")));
            params.putNext("start", (page - 1) * limit).putNext("limit", limit).putNext("pagination", true);
            return PageBean.pagination(count, getBaseMapper().list(params));
        }

        return new PageBean();
    }
}
