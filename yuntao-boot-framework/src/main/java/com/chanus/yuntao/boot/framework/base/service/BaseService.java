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
package com.chanus.yuntao.boot.framework.base.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chanus.yuntao.boot.common.pojo.Message;
import com.chanus.yuntao.boot.common.pojo.PageBean;
import com.chanus.yuntao.utils.core.CollectionUtils;
import com.chanus.yuntao.utils.core.map.CustomMap;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

/**
 * Service 超接口
 *
 * @param <T> 实体对象
 * @author Chanus
 * @date 2020-07-30 14:18:54
 * @since 0.0.1
 */
public interface BaseService<T> extends IService<T> {
    /**
     * 根据主键查询实体
     *
     * @param pk 主键
     * @return 实体对象
     */
    default T get(Serializable pk) {
        return this.getById(pk);
    }

    /**
     * 添加实体
     *
     * @param t 实体对象
     * @return 操作结果信息
     */
    default Message insert(T t) {
        this.save(t);
        return Message.addSuccess();
    }

    /**
     * 批量添加实体
     *
     * @param ts 实体对象列表
     * @return 操作结果信息
     */
    @Transactional
    default Message insertBatch(Collection<T> ts) {
        this.saveBatch(ts);
        return Message.addSuccess();
    }

    /**
     * 更新实体，过滤空字段
     *
     * @param t 实体对象
     * @return 操作结果信息
     */
    default Message update(T t) {
        this.updateById(t);
        return Message.updateSuccess();
    }

    /**
     * 批量更新实体，过滤空字段
     *
     * @param ts 实体对象列表
     * @return 操作结果信息
     */
    default Message updateBatch(Collection<T> ts) {
        this.updateBatchById(ts);
        return Message.updateSuccess();
    }

    /**
     * 根据主键删除实体
     *
     * @param pk 主键
     * @return 操作结果信息
     */
    default Message delete(Serializable pk) {
        this.removeById(pk);
        return Message.deleteSuccess();
    }

    /**
     * 根据主键集合批量删除实体
     *
     * @param pks 主键集合
     * @return 操作结果信息
     */
    default Message delete(Collection<? extends Serializable> pks) {
        if (CollectionUtils.isNotEmpty(pks))
            this.removeByIds(pks);
        return Message.deleteSuccess();
    }

    /**
     * 添加或更新实体
     *
     * @param t 实体对象
     * @return 操作结果信息
     */
    default Message replace(T t) {
        this.saveOrUpdate(t);
        return Message.updateSuccess();
    }

    /**
     * 批量添加或更新实体
     *
     * @param ts 实体对象列表
     * @return 操作结果信息
     */
    default Message replaceBatch(Collection<T> ts) {
        this.saveOrUpdateBatch(ts);
        return Message.updateSuccess();
    }

    /**
     * 获取记录条数
     *
     * @param params 参数集合
     * @return 记录条数
     */
    int count(CustomMap params);

    /**
     * 获取记录列表
     *
     * @param params 参数集合
     * @return 记录列表
     */
    List<T> list(CustomMap params);

    /**
     * 分页查询记录列表
     *
     * @param params 参数集合
     * @return 指定页的数据信息
     */
    PageBean listPagination(CustomMap params);
}
