package com.chanus.yuntao.boot.manager.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 系统角色表
 *
 * @author Chanus
 * @date 2020-08-07 15:05:33
 * @since 1.0.0
 */
public class Role implements Serializable {
    private static final long serialVersionUID = 1L;

    // 主键
    private Integer id;
    // 角色ID
    private String roleId;
    // 角色代码
    private String roleCode;
    // 角色名称
    private String roleName;
    // 上级角色ID
    private String parentRoleId;
    // 能否登录系统：0-不能登录，1-能登录
    private String loginFlag;
    // 是否可以创建操作员：0-不能，1-能
    private String hasOperator;
    // 状态：0-停用，1-启用
    private String validStatus;
    // 备注
    private String remark;
    // 优先级
    private Integer priority;
    // 所有上级角色代码
    private String superior;
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
     * 获取：角色ID
     */
    public String getRoleId() {
        return roleId;
    }

    /**
     * 设置：角色ID
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
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
     * 获取：角色名称
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * 设置：角色名称
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    /**
     * 获取：上级角色ID
     */
    public String getParentRoleId() {
        return parentRoleId;
    }

    /**
     * 设置：上级角色ID
     */
    public void setParentRoleId(String parentRoleId) {
        this.parentRoleId = parentRoleId == null ? null : parentRoleId.trim();
    }

    /**
     * 获取：能否登录系统：0-不能登录，1-能登录
     */
    public String getLoginFlag() {
        return loginFlag;
    }

    /**
     * 设置：能否登录系统：0-不能登录，1-能登录
     */
    public void setLoginFlag(String loginFlag) {
        this.loginFlag = loginFlag == null ? null : loginFlag.trim();
    }

    /**
     * 获取：是否可以创建操作员：0-不能，1-能
     */
    public String getHasOperator() {
        return hasOperator;
    }

    /**
     * 设置：是否可以创建操作员：0-不能，1-能
     */
    public void setHasOperator(String hasOperator) {
        this.hasOperator = hasOperator == null ? null : hasOperator.trim();
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
     * 获取：所有上级角色代码
     */
    public String getSuperior() {
        return superior;
    }

    /**
     * 设置：所有上级角色代码
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

    @Override
    public String toString() {
        return "Role [" +
                "id=" + id +
                ", roleId=" + roleId +
                ", roleCode=" + roleCode +
                ", roleName=" + roleName +
                ", parentRoleId=" + parentRoleId +
                ", loginFlag=" + loginFlag +
                ", hasOperator=" + hasOperator +
                ", validStatus=" + validStatus +
                ", remark=" + remark +
                ", priority=" + priority +
                ", superior=" + superior +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}
