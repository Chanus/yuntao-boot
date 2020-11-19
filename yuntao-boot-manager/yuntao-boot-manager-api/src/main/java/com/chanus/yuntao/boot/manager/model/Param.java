package com.chanus.yuntao.boot.manager.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 系统基础参数表
 *
 * @author Chanus
 * @date 2020-08-06 15:45:26
 * @since 1.0.0
 */
public class Param implements Serializable {
    private static final long serialVersionUID = 1L;

    // 主键
    private Integer id;
    // 参数代码
    private String paramCode;
    // 参数值
    private String paramData;
    // 备注
    private String remark;
    // 状态：0-停用，1-启用
    private String validStatus;
    // 可以看到该参数的角色，多个角色用‘,’隔开，为空则所有角色都可以看到
    private String modifiedRoleCode;
    // 优先级
    private Integer priority;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtCreate;
    // 更新时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtModified;

    /**
     * 获取：主键
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置：主键
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取：参数代码
     */
    public String getParamCode() {
        return paramCode;
    }

    /**
     * 设置：参数代码
     */
    public void setParamCode(String paramCode) {
        this.paramCode = paramCode == null ? null : paramCode.trim();
    }

    /**
     * 获取：参数值
     */
    public String getParamData() {
        return paramData;
    }

    /**
     * 设置：参数值
     */
    public void setParamData(String paramData) {
        this.paramData = paramData == null ? null : paramData.trim();
    }

    /**
     * 获取：备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置：备注
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     * 获取：状态：0-停用，1-启用
     */
    public String getValidStatus() {
        return validStatus;
    }

    /**
     * 设置：状态：0-停用，1-启用
     */
    public void setValidStatus(String validStatus) {
        this.validStatus = validStatus == null ? null : validStatus.trim();
    }

    /**
     * 获取：可以看到该参数的角色，多个角色用‘,’隔开，为空则所有角色都可以看到
     */
    public String getModifiedRoleCode() {
        return modifiedRoleCode;
    }

    /**
     * 设置：可以看到该参数的角色，多个角色用‘,’隔开，为空则所有角色都可以看到
     */
    public void setModifiedRoleCode(String modifiedRoleCode) {
        this.modifiedRoleCode = modifiedRoleCode == null ? null : modifiedRoleCode.trim();
    }

    /**
     * 获取：优先级
     */
    public Integer getPriority() {
        return priority;
    }

    /**
     * 设置：优先级
     */
    public void setPriority(Integer priority) {
        this.priority = priority;
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

    @Override
    public String toString() {
        return "Param [" +
                "id=" + id +
                ", paramCode=" + paramCode +
                ", paramData=" + paramData +
                ", remark=" + remark +
                ", validStatus=" + validStatus +
                ", modifiedRoleCode=" + modifiedRoleCode +
                ", priority=" + priority +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}
