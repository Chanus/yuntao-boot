package com.chanus.yuntao.boot.manager.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 系统IP白名单
 *
 * @author Chanus
 * @date 2020-08-10 10:28:03
 * @since 1.0.0
 */
public class WhiteIp implements Serializable {
    private static final long serialVersionUID = 1L;

    // 自增长字段
    private Integer id;
    // IP列表，多个以逗号分隔
    private String whiteIp;
    // 登录账号列表，若为null则该组IP所有用户都可以登录
    private String loginNo;
    // 备注
    private String remark;
    // 是否固定IP：0-不固定，1-固定。若不固定IP，则其他组IP满足条件也可登录，若固定IP，则只能使用当前组IP登录
    private String fixedStatus;
    // 状态：0-停用，1-启用
    private String validStatus;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtCreate;
    // 更新时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtModified;

    /**
     * 获取：自增长字段
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置：自增长字段
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取：IP列表，多个以逗号分隔
     */
    public String getWhiteIp() {
        return whiteIp;
    }

    /**
     * 设置：IP列表，多个以逗号分隔
     */
    public void setWhiteIp(String whiteIp) {
        this.whiteIp = whiteIp == null ? null : whiteIp.trim();
    }

    /**
     * 获取：登录账号列表，若为null则该组IP所有用户都可以登录
     */
    public String getLoginNo() {
        return loginNo;
    }

    /**
     * 设置：登录账号列表，若为null则该组IP所有用户都可以登录
     */
    public void setLoginNo(String loginNo) {
        this.loginNo = loginNo == null ? null : loginNo.trim();
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
     * 获取：是否固定IP：0-不固定，1-固定。若不固定IP，则其他组IP满足条件也可登录，若固定IP，则只能使用当前组IP登录
     */
    public String getFixedStatus() {
        return fixedStatus;
    }

    /**
     * 设置：是否固定IP：0-不固定，1-固定。若不固定IP，则其他组IP满足条件也可登录，若固定IP，则只能使用当前组IP登录
     */
    public void setFixedStatus(String fixedStatus) {
        this.fixedStatus = fixedStatus == null ? null : fixedStatus.trim();
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
        return "WhiteIp [" +
                "id=" + id +
                ", whiteIp=" + whiteIp +
                ", loginNo=" + loginNo +
                ", remark=" + remark +
                ", fixedStatus=" + fixedStatus +
                ", validStatus=" + validStatus +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}
