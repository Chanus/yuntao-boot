package com.chanus.yuntao.boot.manager.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 模块权限项方法配置表
 *
 * @author Chanus
 * @date 2020-08-07 11:48:58
 * @since 1.0.0
 */
public class ModulePowerMethod implements Serializable {
    private static final long serialVersionUID = 1L;

    // 主键ID
    @TableId("mpm_id")
    private Integer mpmId;
    // 模块权限项ID
    private Integer mpId;
    // 类名
    private String className;
    // 请求URL
    private String url;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtCreate;
    // 更新时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtModified;

    /**
     * 获取：主键ID
     */
    public Integer getMpmId() {
        return mpmId;
    }

    /**
     * 设置：主键ID
     */
    public void setMpmId(Integer mpmId) {
        this.mpmId = mpmId;
    }

    /**
     * 获取：模块权限项ID
     */
    public Integer getMpId() {
        return mpId;
    }

    /**
     * 设置：模块权限项ID
     */
    public void setMpId(Integer mpId) {
        this.mpId = mpId;
    }

    /**
     * 获取：类名
     */
    public String getClassName() {
        return className;
    }

    /**
     * 设置：类名
     */
    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    /**
     * 获取：请求URL
     */
    public String getUrl() {
        return url;
    }

    /**
     * 设置：请求URL
     */
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
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
        return "ModulePowerMethod [" +
                "mpmId=" + mpmId +
                ", mpId=" + mpId +
                ", className=" + className +
                ", url=" + url +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}
