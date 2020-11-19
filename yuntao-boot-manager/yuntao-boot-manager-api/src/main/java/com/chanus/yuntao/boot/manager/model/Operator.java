package com.chanus.yuntao.boot.manager.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 操作员表
 *
 * @author Chanus
 * @date 2020-08-07 16:15:15
 * @since 1.0.0
 */
public class Operator implements Serializable {
    private static final long serialVersionUID = 1L;

    // 主键
    private Integer id;
    // 操作员账号
    private String operatorNo;
    // 操作员名称
    private String operatorName;
    // 操作员密码
    private String operatorPassword;
    // 操作员角色
    private String operatorRoleCode;
    // 主账号
    private String masterNo;
    // 主账号角色
    private String masterRoleCode;
    // 邮箱账号
    private String email;
    // 电话号码
    private String tel;
    // 头像图片路径
    private String headImage;
    // 备注
    private String remark;
    // 状态：0-停用，1-启用
    private String validStatus;
    // 所有上级角色代码
    private String superior;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtCreate;
    // 更新时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtModified;

    @TableField(exist = false)
    private String roleName;

    @TableField(exist = false)
    private String aesEmailKey;

    @TableField(exist = false)
    private String aesPhoneKey;

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
     * 获取：操作员账号
     */
    public String getOperatorNo() {
        return operatorNo;
    }

    /**
     * 设置：操作员账号
     */
    public void setOperatorNo(String operatorNo) {
        this.operatorNo = operatorNo == null ? null : operatorNo.trim();
    }

    /**
     * 获取：操作员名称
     */
    public String getOperatorName() {
        return operatorName;
    }

    /**
     * 设置：操作员名称
     */
    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName == null ? null : operatorName.trim();
    }

    /**
     * 获取：操作员密码
     */
    public String getOperatorPassword() {
        return operatorPassword;
    }

    /**
     * 设置：操作员密码
     */
    public void setOperatorPassword(String operatorPassword) {
        this.operatorPassword = operatorPassword == null ? null : operatorPassword.trim();
    }

    /**
     * 获取：操作员角色
     */
    public String getOperatorRoleCode() {
        return operatorRoleCode;
    }

    /**
     * 设置：操作员角色
     */
    public void setOperatorRoleCode(String operatorRoleCode) {
        this.operatorRoleCode = operatorRoleCode == null ? null : operatorRoleCode.trim();
    }

    /**
     * 获取：主账号
     */
    public String getMasterNo() {
        return masterNo;
    }

    /**
     * 设置：主账号
     */
    public void setMasterNo(String masterNo) {
        this.masterNo = masterNo == null ? null : masterNo.trim();
    }

    /**
     * 获取：主账号角色
     */
    public String getMasterRoleCode() {
        return masterRoleCode;
    }

    /**
     * 设置：主账号角色
     */
    public void setMasterRoleCode(String masterRoleCode) {
        this.masterRoleCode = masterRoleCode == null ? null : masterRoleCode.trim();
    }

    /**
     * 获取：邮箱账号
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置：邮箱账号
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * 获取：电话号码
     */
    public String getTel() {
        return tel;
    }

    /**
     * 设置：电话号码
     */
    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    /**
     * 获取：头像图片路径
     */
    public String getHeadImage() {
        return headImage;
    }

    /**
     * 设置：头像图片路径
     */
    public void setHeadImage(String headImage) {
        this.headImage = headImage == null ? null : headImage.trim();
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

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getAesEmailKey() {
        return aesEmailKey;
    }

    public void setAesEmailKey(String aesEmailKey) {
        this.aesEmailKey = aesEmailKey;
    }

    public String getAesPhoneKey() {
        return aesPhoneKey;
    }

    public void setAesPhoneKey(String aesPhoneKey) {
        this.aesPhoneKey = aesPhoneKey;
    }

    @Override
    public String toString() {
        return "Operator [" +
                "id=" + id +
                ", operatorNo=" + operatorNo +
                ", operatorName=" + operatorName +
                ", operatorRoleCode=" + operatorRoleCode +
                ", masterNo=" + masterNo +
                ", masterRoleCode=" + masterRoleCode +
                ", email=" + email +
                ", tel=" + tel +
                ", headImage=" + headImage +
                ", remark=" + remark +
                ", validStatus=" + validStatus +
                ", superior=" + superior +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}
