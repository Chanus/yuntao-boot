package com.chanus.yuntao.boot.manager.service;

import com.chanus.yuntao.boot.manager.model.DataBaseColumn;
import com.chanus.yuntao.boot.manager.model.DataBaseTable;
import com.chanus.yuntao.utils.core.lang.Page;
import com.chanus.yuntao.utils.core.map.CustomMap;

import java.util.List;
import java.util.Map;

/**
 * 系统代码自动生成接口
 *
 * @author Chanus
 * @date 2020-08-04 16:12:38
 * @since 1.0.0
 */
public interface CodeGenerationService {
    /**
     * 分页查询系统数据库表
     *
     * @param params tableSchema    数据库名称
     *               tableName  表名称
     * @return
     */
    Page<DataBaseTable> listDataBaseTablePagination(CustomMap params);

    /**
     * 获取系统数据库表下的字段
     *
     * @param params tableSchema    数据库名称
     *               tableName  表名称
     * @return
     */
    List<DataBaseColumn> listDataBaseColumn(CustomMap params);

    /**
     * 生成代码
     *
     * @param tableSchema 数据库名称
     * @param tableName   表名称
     * @param params      自动生成代码参数配置
     *                    package   代码包名
     *                    author    作者
     *                    since 版本号
     *                    tablePrefix   表前缀
     *                    autoRemovePrefix  是否自动去除前缀：0-否，1-是
     *                    manyModule    项目是否是多模块项目：0-否，1-是
     *                    pathName  URL标识
     *                    moduleId  模块ID
     * @return
     */
    byte[] generateCode(String tableSchema, String tableName, Map<String, Object> params);
}
