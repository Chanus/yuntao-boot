package com.chanus.yuntao.boot.manager.model;

import java.io.Serializable;

/**
 * 数据库表字段
 *
 * @author Chanus
 * @date 2020-08-03 14:21:56
 * @since 1.0.0
 */
public class DataBaseColumn implements Serializable {
    private static final long serialVersionUID = 7383901221399009751L;

    /**
     * 数据库名称
     */
    private String tableSchema;

    /**
     * 表名称
     */
    private String tableName;

    /**
     * 列名称
     */
    private String columnName;

    /**
     * 默认值
     */
    private String columnDefault;

    /**
     * 是否允许为空
     */
    private String nullable;

    /**
     * 字符集
     */
    private String characterSetName;

    /**
     * 字符序
     */
    private String collationName;

    /**
     * 列类型
     */
    private String dataType;

    /**
     * 列类型描述
     */
    private String columnType;

    /**
     * 列备注
     */
    private String columnComment;

    /**
     * 主键标识，PRI
     */
    private String columnKey;

    /**
     * auto_increment
     */
    private String extra;

    /**
     * 属性名称(首字母大写)
     */
    private String attributeName;

    /**
     * 属性名称(首字母小写)
     */
    private String attributename;

    /**
     * 属性类型
     */
    private String attributeType;

    /**
     * Mybatis对应的JDBC类型
     */
    private String jdbcType;

    public String getTableSchema() {
        return tableSchema;
    }

    public void setTableSchema(String tableSchema) {
        this.tableSchema = tableSchema;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getColumnDefault() {
        return columnDefault;
    }

    public void setColumnDefault(String columnDefault) {
        this.columnDefault = columnDefault;
    }

    public String getNullable() {
        return nullable;
    }

    public void setNullable(String nullable) {
        this.nullable = nullable;
    }

    public String getCharacterSetName() {
        return characterSetName;
    }

    public void setCharacterSetName(String characterSetName) {
        this.characterSetName = characterSetName;
    }

    public String getCollationName() {
        return collationName;
    }

    public void setCollationName(String collationName) {
        this.collationName = collationName;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getColumnType() {
        return columnType;
    }

    public void setColumnType(String columnType) {
        this.columnType = columnType;
    }

    public String getColumnComment() {
        return columnComment;
    }

    public void setColumnComment(String columnComment) {
        this.columnComment = columnComment;
    }

    public String getColumnKey() {
        return columnKey;
    }

    public void setColumnKey(String columnKey) {
        this.columnKey = columnKey;
    }

    public String getExtra() {
        return extra;
    }

    public void setExtra(String extra) {
        this.extra = extra;
    }

    public String getAttributeName() {
        return attributeName;
    }

    public void setAttributeName(String attributeName) {
        this.attributeName = attributeName;
    }

    public String getAttributename() {
        return attributename;
    }

    public void setAttributename(String attributename) {
        this.attributename = attributename;
    }

    public String getAttributeType() {
        return attributeType;
    }

    public void setAttributeType(String attributeType) {
        this.attributeType = attributeType;
    }

    public String getJdbcType() {
        return jdbcType;
    }

    public void setJdbcType(String jdbcType) {
        this.jdbcType = jdbcType;
    }

    @Override
    public String toString() {
        return "DataBaseColumn [tableSchema=" + tableSchema + ", tableName=" + tableName + ", columnName=" + columnName + ", columnDefault=" + columnDefault + ", nullable=" + nullable + ", characterSetName=" + characterSetName + ", collationName=" + collationName + ", dataType=" + dataType + ", columnType=" + columnType + ", columnComment=" + columnComment + ", columnKey=" + columnKey + ", extra=" + extra + ", attributeName=" + attributeName + ", attributename=" + attributename + ", attributeType=" + attributeType + ", jdbcType=" + jdbcType + "]";
    }
}
