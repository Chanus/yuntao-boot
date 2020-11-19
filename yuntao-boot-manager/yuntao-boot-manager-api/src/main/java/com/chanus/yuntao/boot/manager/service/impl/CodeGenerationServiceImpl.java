package com.chanus.yuntao.boot.manager.service.impl;

import com.chanus.yuntao.boot.manager.common.CodeGenerationUtils;
import com.chanus.yuntao.boot.manager.mapper.DataBaseColumnMapper;
import com.chanus.yuntao.boot.manager.mapper.DataBaseTableMapper;
import com.chanus.yuntao.boot.manager.mapper.ModuleMapper;
import com.chanus.yuntao.boot.manager.model.DataBaseColumn;
import com.chanus.yuntao.boot.manager.model.DataBaseTable;
import com.chanus.yuntao.boot.manager.model.Module;
import com.chanus.yuntao.boot.manager.service.CodeGenerationService;
import com.chanus.yuntao.utils.core.IOUtils;
import com.chanus.yuntao.utils.core.StringUtils;
import com.chanus.yuntao.utils.core.lang.Page;
import com.chanus.yuntao.utils.core.map.CustomMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipOutputStream;

/**
 * 系统代码自动生成接口实现
 *
 * @author Chanus
 * @date 2020-08-04 16:18:23
 * @since 1.0.0
 */
@Service
public class CodeGenerationServiceImpl implements CodeGenerationService {
    @Autowired
    private DataBaseTableMapper dataBaseTableMapper;
    @Autowired
    private DataBaseColumnMapper dataBaseColumnMapper;
    @Autowired
    private ModuleMapper moduleMapper;

    @Override
    public Page<DataBaseTable> listDataBaseTablePagination(CustomMap params) {
        int count = dataBaseTableMapper.count(params);
        if (count > 0) {
            return Page.pagination(count, dataBaseTableMapper.list(Page.initPageParams(params)));
        }

        return new Page<>();
    }

    @Override
    public List<DataBaseColumn> listDataBaseColumn(CustomMap params) {
        return dataBaseColumnMapper.list(params);
    }

    @Override
    public byte[] generateCode(String tableSchema, String tableName, Map<String, Object> params) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);

        // 查询表信息
        DataBaseTable table = dataBaseTableMapper.get(tableSchema, tableName);
        // 查询列信息
        List<DataBaseColumn> columns = dataBaseColumnMapper.list(CustomMap.create().putNext("tableSchema", tableSchema).putNext("tableName", tableName));
        // 获取模块代码和模块名称
        String moduleId = (String) params.get("moduleId");
        String moduleCode = null, moduleName = null;
        if (StringUtils.isNotBlank(moduleId)) {
            Module module = moduleMapper.selectById(Integer.parseInt(moduleId));
            moduleCode = module == null ? null : module.getModuleCode();
            moduleName = module == null ? null : module.getModuleName();
        }

        params.put("moduleCode", StringUtils.isBlank(moduleCode) ? table.getTableName().toUpperCase() : moduleCode);
        params.put("moduleName", StringUtils.isBlank(moduleName) ? table.getTableComment() : moduleName);
        // 生成代码
        CodeGenerationUtils.generateCode(table, columns, params, zip);

        IOUtils.closeQuietly(zip);
        return outputStream.toByteArray();
    }

}
