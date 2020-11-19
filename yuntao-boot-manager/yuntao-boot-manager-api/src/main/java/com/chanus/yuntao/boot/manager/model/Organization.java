package com.chanus.yuntao.boot.manager.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 组织结构表
 *
 * @author Chanus
 * @date 2020-08-10 11:40:42
 * @since 1.0.0
 */
public class Organization implements Serializable {
    private static final long serialVersionUID = 1L;

    // 组织ID
    @TableId("org_id")
    private Integer orgId;
    // 组织代码
    private String orgCode;
    // 组织名称
    private String orgName;
    // 上级组织ID
    private Integer orgParentId;
    // 组织简称
    private String orgShortName;
    // 组织全称
    private String orgLongName;
    // 组织地址
    private String orgLocation;
    // 组织联系方式
    private String orgPhone;
    // 状态：0-停用，1-启用
    private String validStatus;
    // 优先级
    private Integer priority;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtCreate;
    // 更新时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtModified;

    /**
     * 获取：组织ID
     */
    public Integer getOrgId() {
        return orgId;
    }

    /**
     * 设置：组织ID
     */
    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    /**
     * 获取：组织代码
     */
    public String getOrgCode() {
        return orgCode;
    }

    /**
     * 设置：组织代码
     */
    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode == null ? null : orgCode.trim();
    }

    /**
     * 获取：组织名称
     */
    public String getOrgName() {
        return orgName;
    }

    /**
     * 设置：组织名称
     */
    public void setOrgName(String orgName) {
        this.orgName = orgName == null ? null : orgName.trim();
    }

    /**
     * 获取：上级组织ID
     */
    public Integer getOrgParentId() {
        return orgParentId;
    }

    /**
     * 设置：上级组织ID
     */
    public void setOrgParentId(Integer orgParentId) {
        this.orgParentId = orgParentId;
    }

    /**
     * 获取：组织简称
     */
    public String getOrgShortName() {
        return orgShortName;
    }

    /**
     * 设置：组织简称
     */
    public void setOrgShortName(String orgShortName) {
        this.orgShortName = orgShortName == null ? null : orgShortName.trim();
    }

    /**
     * 获取：组织全称
     */
    public String getOrgLongName() {
        return orgLongName;
    }

    /**
     * 设置：组织全称
     */
    public void setOrgLongName(String orgLongName) {
        this.orgLongName = orgLongName == null ? null : orgLongName.trim();
    }

    /**
     * 获取：组织地址
     */
    public String getOrgLocation() {
        return orgLocation;
    }

    /**
     * 设置：组织地址
     */
    public void setOrgLocation(String orgLocation) {
        this.orgLocation = orgLocation == null ? null : orgLocation.trim();
    }

    /**
     * 获取：组织联系方式
     */
    public String getOrgPhone() {
        return orgPhone;
    }

    /**
     * 设置：组织联系方式
     */
    public void setOrgPhone(String orgPhone) {
        this.orgPhone = orgPhone == null ? null : orgPhone.trim();
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
        return "Organization [" +
                "orgId=" + orgId +
                ", orgCode=" + orgCode +
                ", orgName=" + orgName +
                ", orgParentId=" + orgParentId +
                ", orgShortName=" + orgShortName +
                ", orgLongName=" + orgLongName +
                ", orgLocation=" + orgLocation +
                ", orgPhone=" + orgPhone +
                ", validStatus=" + validStatus +
                ", priority=" + priority +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}
