package com.chanus.yuntao.boot.manager.model;

import com.chanus.yuntao.boot.manager.common.enums.LogTypeEnum;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 系统操作日志表
 *
 * @author Chanus
 * @date 2020-08-01 14:36:16
 * @since 1.0.0
 */
public class Log implements Serializable {
    private static final long serialVersionUID = 1L;

    // 主键
    private Long id;
    // 操作账号
    private String operateNo;
    // 操作账号角色
    private String operateRoleCode;
    // 操作IP
    private String operateIp;
    // 模块代码
    private String operateModuleCode;
    // 请求地址
    private String operateUrl;
    // 方法描述
    private String operateMethod;
    // 操作异常描述
    private String operateException;
    // 操作内容
    private String operateContent;
    // 操作类型：LOGIN，LOGOUT，INSERT，DELETE，UPDATE，EXCEPTION
    private String operateType;
    // 操作类型描述
    private String operateTypeDesc;
    // 操作耗时(毫秒)
    private Integer operateConsumeTime;
    // 操作时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime operateTime;
    // 操作账号角色的所有上级角色
    private String superior;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtCreate;
    // 更新时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtModified;

    private String operateRoleName;

    private String operateModuleName;

    private String operateMasterRoleCode;

    private final static Map<String, String> LOGTYPE_MAP = new LinkedHashMap<>();

    static {
        LOGTYPE_MAP.put(LogTypeEnum.LOGIN.name(), "登录系统");
        LOGTYPE_MAP.put(LogTypeEnum.LOGOUT.name(), "退出系统");
        LOGTYPE_MAP.put(LogTypeEnum.INSERT.name(), "添加");
        LOGTYPE_MAP.put(LogTypeEnum.DELETE.name(), "删除");
        LOGTYPE_MAP.put(LogTypeEnum.UPDATE.name(), "更新");
        LOGTYPE_MAP.put(LogTypeEnum.SAVE.name(), "添加或更新");
        LOGTYPE_MAP.put(LogTypeEnum.EXCEPTION.name(), "系统异常");
        LOGTYPE_MAP.put(LogTypeEnum.SCHEDULER.name(), "定时任务");
    }

    /**
     * 获取：主键
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置：主键
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取：操作账号
     */
    public String getOperateNo() {
        return operateNo;
    }

    /**
     * 设置：操作账号
     */
    public Log setOperateNo(String operateNo) {
        this.operateNo = operateNo == null ? null : operateNo.trim();
        return this;
    }

    /**
     * 获取：操作账号角色
     */
    public String getOperateRoleCode() {
        return operateRoleCode;
    }

    /**
     * 设置：操作账号角色
     */
    public Log setOperateRoleCode(String operateRoleCode) {
        this.operateRoleCode = operateRoleCode == null ? null : operateRoleCode.trim();
        return this;
    }

    /**
     * 获取：操作IP
     */
    public String getOperateIp() {
        return operateIp;
    }

    /**
     * 设置：操作IP
     */
    public Log setOperateIp(String operateIp) {
        this.operateIp = operateIp == null ? null : operateIp.trim();
        return this;
    }

    /**
     * 获取：模块代码
     */
    public String getOperateModuleCode() {
        return operateModuleCode;
    }

    /**
     * 设置：模块代码
     */
    public Log setOperateModuleCode(String operateModuleCode) {
        this.operateModuleCode = operateModuleCode == null ? null : operateModuleCode.trim();
        return this;
    }

    /**
     * 获取：请求地址
     */
    public String getOperateUrl() {
        return operateUrl;
    }

    /**
     * 设置：请求地址
     */
    public Log setOperateUrl(String operateUrl) {
        this.operateUrl = operateUrl == null ? null : operateUrl.trim();
        return this;
    }

    /**
     * 获取：方法描述
     */
    public String getOperateMethod() {
        return operateMethod;
    }

    /**
     * 设置：方法描述
     */
    public Log setOperateMethod(String operateMethod) {
        this.operateMethod = operateMethod == null ? null : operateMethod.trim();
        return this;
    }

    /**
     * 获取：操作异常描述
     */
    public String getOperateException() {
        return operateException;
    }

    /**
     * 设置：操作异常描述
     */
    public Log setOperateException(String operateException) {
        this.operateException = operateException == null ? null : operateException.trim();
        return this;
    }

    /**
     * 获取：操作内容
     */
    public String getOperateContent() {
        return operateContent;
    }

    /**
     * 设置：操作内容
     */
    public Log setOperateContent(String operateContent) {
        this.operateContent = operateContent == null ? null : operateContent.trim();
        return this;
    }

    /**
     * 获取：操作类型：LOGIN，LOGOUT，INSERT，DELETE，UPDATE，EXCEPTION
     */
    public String getOperateType() {
        return operateType;
    }

    /**
     * 设置：操作类型：LOGIN，LOGOUT，INSERT，DELETE，UPDATE，EXCEPTION
     */
    public Log setOperateType(String operateType) {
        this.operateType = operateType == null ? null : operateType.trim();
        return this;
    }

    /**
     * 获取：操作类型描述
     */
    public String getOperateTypeDesc() {
        return operateTypeDesc;
    }

    /**
     * 设置：操作类型描述
     */
    public Log setOperateTypeDesc(String operateTypeDesc) {
        this.operateTypeDesc = operateTypeDesc == null ? null : operateTypeDesc.trim();
        return this;
    }

    /**
     * 获取：操作耗时(毫秒)
     */
    public Integer getOperateConsumeTime() {
        return operateConsumeTime;
    }

    /**
     * 设置：操作耗时(毫秒)
     */
    public Log setOperateConsumeTime(Integer operateConsumeTime) {
        this.operateConsumeTime = operateConsumeTime;
        return this;
    }

    /**
     * 获取：操作时间
     */
    public LocalDateTime getOperateTime() {
        return operateTime;
    }

    /**
     * 设置：操作时间
     */
    public Log setOperateTime(LocalDateTime operateTime) {
        this.operateTime = operateTime;
        return this;
    }

    /**
     * 获取：操作账号角色的所有上级角色
     */
    public String getSuperior() {
        return superior;
    }

    /**
     * 设置：操作账号角色的所有上级角色
     */
    public void setSuperior(String superior) {
        this.superior = superior == null ? null : superior.trim();
    }

    /**
     * 获取：创建时间
     */
    public LocalDateTime getGmtCreate() {
        return gmtCreate;
    }

    /**
     * 设置：创建时间
     */
    public void setGmtCreate(LocalDateTime gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    /**
     * 获取：更新时间
     */
    public LocalDateTime getGmtModified() {
        return gmtModified;
    }

    /**
     * 设置：更新时间
     */
    public void setGmtModified(LocalDateTime gmtModified) {
        this.gmtModified = gmtModified;
    }

    public String getOperateRoleName() {
        return operateRoleName;
    }

    public void setOperateRoleName(String operateRoleName) {
        this.operateRoleName = operateRoleName;
    }

    public String getOperateModuleName() {
        return operateModuleName;
    }

    public void setOperateModuleName(String operateModuleName) {
        this.operateModuleName = operateModuleName;
    }

    public String getOperateMasterRoleCode() {
        return operateMasterRoleCode;
    }

    public void setOperateMasterRoleCode(String operateMasterRoleCode) {
        this.operateMasterRoleCode = operateMasterRoleCode;
    }

    @Override
    public String toString() {
        return "Log [" +
                "id=" + id +
                ", operateNo=" + operateNo +
                ", operateRoleCode=" + operateRoleCode +
                ", operateIp=" + operateIp +
                ", operateModuleCode=" + operateModuleCode +
                ", operateUrl=" + operateUrl +
                ", operateMethod=" + operateMethod +
                ", operateException=" + operateException +
                ", operateContent=" + operateContent +
                ", operateType=" + operateType +
                ", operateTypeDesc=" + operateTypeDesc +
                ", operateConsumeTime=" + operateConsumeTime +
                ", operateTime=" + operateTime +
                ", superior=" + superior +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}