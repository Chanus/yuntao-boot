package com.chanus.yuntao.boot.manager.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 系统角色权限表
 *
 * @author Chanus
 * @date 2020-08-01 09:23:20
 * @since 1.0.0
 */
public class RoleModulePower implements Serializable {
    private static final long serialVersionUID = 1L;

    // 主键
    private Integer rmpId;
    // 角色代码
    private String roleCode;
    // 模块代码
    private String moduleCode;
    // 权限项
    private String powerItem;
    // 子账号
    private String subNo;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtCreate;
    // 更新时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtModified;

    /**
     * 获取：主键
     */
    public Integer getRmpId() {
        return rmpId;
    }

    /**
     * 设置：主键
     */
    public void setRmpId(Integer rmpId) {
        this.rmpId = rmpId;
    }

    /**
     * 获取：角色代码
     */
    public String getRoleCode() {
        return roleCode;
    }

    /**
     * 设置：角色代码
     */
    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode == null ? null : roleCode.trim();
    }

    /**
     * 获取：模块代码
     */
    public String getModuleCode() {
        return moduleCode;
    }

    /**
     * 设置：模块代码
     */
    public void setModuleCode(String moduleCode) {
        this.moduleCode = moduleCode == null ? null : moduleCode.trim();
    }

    /**
     * 获取：权限项
     */
    public String getPowerItem() {
        return powerItem;
    }

    /**
     * 设置：权限项
     */
    public void setPowerItem(String powerItem) {
        this.powerItem = powerItem == null ? null : powerItem.trim();
    }

    /**
     * 获取：子账号
     */
    public String getSubNo() {
        return subNo;
    }

    /**
     * 设置：子账号
     */
    public void setSubNo(String subNo) {
        this.subNo = subNo == null ? null : subNo.trim();
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
        return "SysRoleModulePower [" +
                "rmpId=" + rmpId +
                ", roleCode=" + roleCode +
                ", moduleCode=" + moduleCode +
                ", powerItem=" + powerItem +
                ", subNo=" + subNo +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}