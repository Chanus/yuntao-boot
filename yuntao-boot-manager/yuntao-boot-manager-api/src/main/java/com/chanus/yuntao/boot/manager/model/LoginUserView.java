package com.chanus.yuntao.boot.manager.model;

import java.io.Serializable;

/**
 * 登录用户视图
 *
 * @author Chanus
 * @date 2020-08-01 09:23:20
 * @since 1.0.0
 */
public class LoginUserView implements Serializable {
    private static final long serialVersionUID = 1L;

    private String loginNo;

    private String loginName;

    private String password;

    private String roleCode;

    private String masterNo;

    private String masterRoleCode;

    private String validStatus;

    private String headImage;

    public String getLoginNo() {
        return loginNo;
    }

    public void setLoginNo(String loginNo) {
        this.loginNo = loginNo == null ? null : loginNo.trim();
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode == null ? null : roleCode.trim();
    }

    public String getMasterNo() {
        return masterNo;
    }

    public void setMasterNo(String masterNo) {
        this.masterNo = masterNo == null ? null : masterNo.trim();
    }

    public String getMasterRoleCode() {
        return masterRoleCode;
    }

    public void setMasterRoleCode(String masterRoleCode) {
        this.masterRoleCode = masterRoleCode == null ? null : masterRoleCode.trim();
    }

    public String getValidStatus() {
        return validStatus;
    }

    public void setValidStatus(String validStatus) {
        this.validStatus = validStatus == null ? null : validStatus.trim();
    }

    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage == null ? null : headImage.trim();
    }

    @Override
    public String toString() {
        return "LoginUserView [" +
                "loginNo=" + loginNo +
                ", loginName=" + loginName +
                ", password=" + password +
                ", roleCode=" + roleCode +
                ", masterNo=" + masterNo +
                ", masterRoleCode=" + masterRoleCode +
                ", validStatus=" + validStatus +
                ", headImage=" + headImage +
                "]";
    }
}