package com.chanus.yuntao.boot.manager.service;

import com.chanus.yuntao.boot.framework.base.service.BaseService;
import com.chanus.yuntao.boot.manager.model.Dict;
import com.chanus.yuntao.utils.core.lang.Message;

/**
 * 数据字典集管理接口
 *
 * @author Chanus
 * @date 2020-08-10 16:06:05
 * @since 1.0.0
 */
public interface DictService extends BaseService<Dict> {
    /**
     * 重载字典数据
     *
     * @return
     */
    Message reloadDict();
}
