package com.chanus.yuntao.boot.manager.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 系统权限项表
 *
 * @author Chanus
 * @date 2020-08-06 14:13:16
 * @since 1.0.0
 */
public class Power implements Serializable {
    private static final long serialVersionUID = 1L;

    // 主键
    private Integer id;
    // 权限项代码
    private String powerItem;
    // 权限项名称
    private String powerName;
    // 备注
    private String remark;
    // 优先级
    private Integer priority;
    // 状态：0-停用，1-启用
    private String validStatus;
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
     * 获取：权限项代码
     */
    public String getPowerItem() {
        return powerItem;
    }

    /**
     * 设置：权限项代码
     */
    public void setPowerItem(String powerItem) {
        this.powerItem = powerItem == null ? null : powerItem.trim();
    }

    /**
     * 获取：权限项名称
     */
    public String getPowerName() {
        return powerName;
    }

    /**
     * 设置：权限项名称
     */
    public void setPowerName(String powerName) {
        this.powerName = powerName == null ? null : powerName.trim();
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
        return "Power [" +
                "id=" + id +
                ", powerItem=" + powerItem +
                ", powerName=" + powerName +
                ", remark=" + remark +
                ", priority=" + priority +
                ", validStatus=" + validStatus +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}
