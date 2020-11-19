package com.chanus.yuntao.boot.manager.common;

import com.chanus.yuntao.boot.common.constant.Constants;
import com.chanus.yuntao.boot.manager.model.DataBaseColumn;
import com.chanus.yuntao.boot.manager.model.DataBaseTable;
import com.chanus.yuntao.utils.core.*;
import org.apache.commons.lang.WordUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 自动生成代码工具类
 *
 * @author Chanus
 * @date 2020-08-01 14:55:45
 * @since 1.0.0
 */
public class CodeGenerationUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(CodeGenerationUtils.class);

    /**
     * MySQL JDBC类型与Java类型映射关系
     */
    private static final Map<String, String> JDBC_JAVA_MAP = new HashMap<>();
    /**
     * MySQL JDBC类型与Mybatis类型映射关系
     */
    private static final Map<String, String> JDBC_MYBATIS_MAP = new HashMap<>();

    static {
        JDBC_JAVA_MAP.put("tinyint", "Byte");
        JDBC_JAVA_MAP.put("smallint", "Short");
        JDBC_JAVA_MAP.put("mediumint", "Integer");
        JDBC_JAVA_MAP.put("int", "Integer");
        JDBC_JAVA_MAP.put("integer", "Integer");
        JDBC_JAVA_MAP.put("bigint", "Long");
        JDBC_JAVA_MAP.put("float", "Float");
        JDBC_JAVA_MAP.put("double", "Double");
        JDBC_JAVA_MAP.put("decimal", "BigDecimal");
        JDBC_JAVA_MAP.put("bit", "Boolean");
        JDBC_JAVA_MAP.put("char", "String");
        JDBC_JAVA_MAP.put("varchar", "String");
        JDBC_JAVA_MAP.put("numeric", "BigDecimal");
        JDBC_JAVA_MAP.put("real", "Float");
        JDBC_JAVA_MAP.put("binary", "byte[]");
        JDBC_JAVA_MAP.put("varbinary", "byte[]");
        JDBC_JAVA_MAP.put("date", "LocalDate");
        JDBC_JAVA_MAP.put("time", "LocalTime");
        JDBC_JAVA_MAP.put("datetime", "LocalDateTime");
        JDBC_JAVA_MAP.put("timestamp", "LocalDateTime");
        JDBC_JAVA_MAP.put("year", "LocalDate");
        JDBC_JAVA_MAP.put("tinyblob", "byte[]");
        JDBC_JAVA_MAP.put("blob", "byte[]");
        JDBC_JAVA_MAP.put("mediumblob", "byte[]");
        JDBC_JAVA_MAP.put("longblob", "byte[]");
        JDBC_JAVA_MAP.put("tinytext", "String");
        JDBC_JAVA_MAP.put("text", "String");
        JDBC_JAVA_MAP.put("mediumtext", "String");
        JDBC_JAVA_MAP.put("longtext", "String");
        JDBC_JAVA_MAP.put("enum", "String");
        JDBC_JAVA_MAP.put("set", "String");
        JDBC_JAVA_MAP.put("json", "String");

        JDBC_MYBATIS_MAP.put("tinyint", "TINYINT");
        JDBC_MYBATIS_MAP.put("smallint", "SMALLINT");
        JDBC_MYBATIS_MAP.put("mediumint", "INTEGER");
        JDBC_MYBATIS_MAP.put("int", "INTEGER");
        JDBC_MYBATIS_MAP.put("integer", "INTEGER");
        JDBC_MYBATIS_MAP.put("bigint", "BIGINT");
        JDBC_MYBATIS_MAP.put("float", "REAL");
        JDBC_MYBATIS_MAP.put("double", "DOUBLE");
        JDBC_MYBATIS_MAP.put("decimal", "DECIMAL");
        JDBC_MYBATIS_MAP.put("bit", "BIT");
        JDBC_MYBATIS_MAP.put("char", "CHAR");
        JDBC_MYBATIS_MAP.put("varchar", "VARCHAR");
        JDBC_MYBATIS_MAP.put("numeric", "DECIMAL");
        JDBC_MYBATIS_MAP.put("real", "REAL");
        JDBC_MYBATIS_MAP.put("binary", "BINARY");
        JDBC_MYBATIS_MAP.put("varbinary", "VARBINARY");
        JDBC_MYBATIS_MAP.put("date", "DATE");
        JDBC_MYBATIS_MAP.put("time", "TIME");
        JDBC_MYBATIS_MAP.put("datetime", "TIMESTAMP");
        JDBC_MYBATIS_MAP.put("timestamp", "TIMESTAMP");
        JDBC_MYBATIS_MAP.put("year", "DATE");
        JDBC_MYBATIS_MAP.put("tinyblob", "BINARY");
        JDBC_MYBATIS_MAP.put("blob", "LONGVARBINARY");
        JDBC_MYBATIS_MAP.put("mediumblob", "LONGVARBINARY");
        JDBC_MYBATIS_MAP.put("longblob", "LONGVARBINARY");
        JDBC_MYBATIS_MAP.put("tinytext", "VARCHAR");
        JDBC_MYBATIS_MAP.put("text", "LONGVARCHAR");
        JDBC_MYBATIS_MAP.put("mediumtext", "LONGVARCHAR");
        JDBC_MYBATIS_MAP.put("longtext", "LONGVARCHAR");
        JDBC_MYBATIS_MAP.put("enum", "CHAR");
        JDBC_MYBATIS_MAP.put("set", "CHAR");
        JDBC_MYBATIS_MAP.put("json", "CHAR");
    }

    /**
     * 配置模板
     *
     * @return
     */
    public static List<String> getTemplates() {
        List<String> templates = new ArrayList<>();
        templates.add("generator/model.java.vm");
        templates.add("generator/Mapper.java.vm");
        templates.add("generator/Mapper.xml.vm");
        templates.add("generator/Service.java.vm");
        templates.add("generator/ServiceImpl.java.vm");
        templates.add("generator/Controller.java.vm");
        templates.add("generator/list.html.vm");
        templates.add("generator/add-update.html.vm");
        templates.add("generator/list.js.vm");
        templates.add("generator/menu.sql.vm");
        return templates;
    }

    /**
     * 生成代码
     *
     * @param table   表信息
     * @param columns 列信息
     * @param params  自动生成代码参数配置
     *                serverPackage   服务类代码包名
     *                controllerPackage   控制器代码包名
     *                author    作者
     *                since 版本号
     *                tablePrefix   表前缀
     *                autoRemovePrefix  是否自动去除前缀：0-否，1-是
     *                pathName  URL标识
     *                moduleId  模块ID
     * @param zip     zip压缩输出流
     */
    public static void generateCode(DataBaseTable table, List<DataBaseColumn> columns, Map<String, Object> params, ZipOutputStream zip) {
        // 表信息
        String className = tableToJava(table.getTableName(), (String) params.get("tablePrefix"), (String) params.get("autoRemovePrefix"));
        table.setClassName(className);
        table.setClassname(StringUtils.uncapitalize(className));

        // 列信息
        for (DataBaseColumn column : columns) {
            // 列名转换成Java属性名
            String attributeName = columnToJava(column.getColumnName());
            column.setAttributeName(attributeName);
            column.setAttributename(StringUtils.uncapitalize(attributeName));

            // 列的数据类型，转换成Java类型
            String attributeType = JDBC_JAVA_MAP.get(column.getDataType().toLowerCase());
            column.setAttributeType(StringUtils.isBlank(attributeType) ? "unknowType" : attributeType);
            // 列的数据类型，转换成Mybatis的jdbcType
            String jdbcType = JDBC_MYBATIS_MAP.get(column.getDataType().toLowerCase());
            column.setJdbcType(StringUtils.isBlank(jdbcType) ? "unknowType" : jdbcType);

            // 是否主键
            if ("PRI".equalsIgnoreCase(column.getColumnKey()) && table.getPk() == null) {
                table.setPk(column);
            }
        }
        table.setColumns(columns);

        // 没主键，则第一个字段为主键
        if (table.getPk() == null) {
            table.setPk(table.getColumns().get(0));
        }

        // 设置velocity资源加载器
        Properties prop = new Properties();
        prop.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        Velocity.init(prop);

        // 封装模板数据
        String serverPackage = (String) params.get("serverPackage");
        String controllerPackage = (String) params.get("controllerPackage");
        String xmlPath = (String) params.get("xmlPath");
        String pathName = (String) params.get("pathName");
        String multi = (String) params.get("multi");
        params.put("tableName", table.getTableName());
        params.put("tableComment", table.getTableComment());
        params.put("pk", table.getPk());
        params.put("className", table.getClassName());
        params.put("classname", table.getClassname());
        params.put("columns", table.getColumns());
        String parentPath = null, jsPath = null, jsName = null;
        if (StringUtils.isNotBlank(pathName)) {
            if (pathName.charAt(0) == '/')
                pathName = pathName.substring(1);
            if (pathName.charAt(pathName.length() - 1) == '/')
                pathName = pathName.substring(0, pathName.length() - 1);

            String[] pathArr = pathName.split("/");
            parentPath = StringUtils.repeat("../", pathArr.length);
            jsPath = pathArr.length == 1 ? pathName : pathName.substring(0, pathName.lastIndexOf("/"));
            jsName = pathArr.length == 1 ? pathName : pathName.substring(pathName.lastIndexOf("/") + 1);
        }
        params.put("parentPath", parentPath);
        params.put("jsPath", jsPath);
        params.put("jsName", jsName);
        params.put("dateTime", DateUtils.formatDateTime(new Date()));
        VelocityContext context = new VelocityContext(params);

        // 获取模板列表
        List<String> templates = getTemplates();
        StringWriter stringWriter;
        Template tpl;
        for (String template : templates) {
            // 渲染模板
            stringWriter = new StringWriter();
            tpl = Velocity.getTemplate(template, "UTF-8");
            tpl.merge(context, stringWriter);

            try {
                // 添加到zip
                String fileName = getFileName(template, table.getClassName(), serverPackage, controllerPackage, xmlPath, pathName, jsPath, jsName, multi);
                if (StringUtils.isNotBlank(fileName))
                    zip.putNextEntry(new ZipEntry(fileName));
                StreamUtils.write(zip, CharsetUtils.CHARSET_UTF_8, stringWriter.toString());
                IOUtils.closeQuietly(stringWriter);
                zip.closeEntry();
            } catch (IOException e) {
                LOGGER.error("渲染模板失败，表名：{}", table.getTableName(), e);
            }
        }
    }


    /**
     * 列名转换成Java属性名
     *
     * @param columnName 列名
     * @return
     */
    public static String columnToJava(String columnName) {
        return WordUtils.capitalizeFully(columnName, new char[]{'_'}).replace("_", "");
    }

    /**
     * 表名转换成Java类名
     *
     * @param tableName        表名
     * @param tablePrefix      表名前缀
     * @param autoRemovePrefix 是否自动去除前缀：0-否，1-是
     * @return
     */
    public static String tableToJava(String tableName, String tablePrefix, String autoRemovePrefix) {
        if (StringUtils.isNotBlank(tablePrefix)) {
            tableName = tableName.replace(tablePrefix, "");
        } else if (Constants.STATUS_YES.equals(autoRemovePrefix)) {
            tableName = tableName.substring(tableName.indexOf("_") + 1);
        }

        return columnToJava(tableName);
    }

    /**
     * 获取文件名
     *
     * @param template          模板
     * @param className         类名(首字母大写)
     * @param serverPackage     服务类包名
     * @param controllerPackage 控制器包名
     * @param xmlPath           XML 的路径
     * @param pathName          URL标识
     * @param jsPath            js文件相对路径
     * @param jsName            js文件名
     * @param multi             是否是多模块项目，1 是多模块项目，0是单模块项目
     * @return
     */
    public static String getFileName(String template, String className, String serverPackage, String controllerPackage,
                                     String xmlPath, String pathName, String jsPath, String jsName, String multi) {
        serverPackage = serverPackage.replace(".", File.separator) + File.separator;
        controllerPackage = controllerPackage.replace(".", File.separator) + File.separator;

        String rootPath = "src" + File.separator + "main" + File.separator, apiRootPath, webRootPath;
        if (Constants.STATUS_YES.equals(multi)) {// 如果是多模块项目
            apiRootPath = "api" + File.separator + rootPath;// api/src/main
            webRootPath = "web" + File.separator + rootPath;// web/src/main
        } else {// 如果是单模块项目
            apiRootPath = rootPath;// src/main
            webRootPath = rootPath;// src/main
        }
        String javaServerPath = apiRootPath + "java" + File.separator + serverPackage;
        String javaControllerPath = webRootPath + "java" + File.separator + controllerPackage;

        if (template.contains("model.java.vm")) {
            return javaServerPath + "model" + File.separator + className + ".java";
        }

        if (template.contains("Mapper.java.vm")) {
            return javaServerPath + "mapper" + File.separator + className + "Mapper.java";
        }

        if (template.contains("Mapper.xml.vm")) {
            return apiRootPath + "resources" + File.separator + "mybatis" + File.separator + "mapper" + File.separator + xmlPath + File.separator + className + "Mapper.xml";
        }

        if (template.contains("Service.java.vm")) {
            return javaServerPath + "service" + File.separator + className + "Service.java";
        }

        if (template.contains("ServiceImpl.java.vm")) {
            return javaServerPath + "service" + File.separator + "impl" + File.separator + className + "ServiceImpl.java";
        }

        if (template.contains("Controller.java.vm")) {
            return javaControllerPath + "controller" + File.separator + className + "Controller.java";
        }

        if (template.contains("list.html.vm")) {
            return webRootPath + "resources" + File.separator + "templates" + File.separator + pathName + File.separator + "list.html";
        }

        if (template.contains("add-update.html.vm")) {
            return webRootPath + "resources" + File.separator + "templates" + File.separator + pathName + File.separator + "add-update.html";
        }

        if (template.contains("list.js.vm")) {
            return webRootPath + "resources" + File.separator + "static" + File.separator + "js" + File.separator + jsPath + File.separator + jsName + ".js";
        }

        if (template.contains("menu.sql.vm")) {
            return "menu.sql";
        }

        return null;
    }

}
