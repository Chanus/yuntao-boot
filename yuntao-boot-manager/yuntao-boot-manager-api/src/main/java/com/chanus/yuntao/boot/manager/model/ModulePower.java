package com.chanus.yuntao.boot.manager.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 模块权限项关系表
 *
 * @author Chanus
 * @date 2020-08-07 11:47:41
 * @since 1.0.0
 */
public class ModulePower implements Serializable {
    private static final long serialVersionUID = 1L;

    // 主键
    @TableId("mp_id")
    private Integer mpId;
    // 模块代码
    private String moduleCode;
    // 权限项
    private String powerItem;
    // 权限项别名
    private String aliasName;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtCreate;
    // 更新时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtModified;

    @TableField(exist = false)
    private String moduleName;
    // 判断模块是否具有此权限，不为空则具有此权限
    @TableField(exist = false)
    private Integer hasPower;

    /**
     * 获取：主键
     */
    public Integer getMpId() {
        return mpId;
    }

    /**
     * 设置：主键
     */
    public void setMpId(Integer mpId) {
        this.mpId = mpId;
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
     * 获取：权限项别名
     */
    public String getAliasName() {
        return aliasName;
    }

    /**
     * 设置：权限项别名
     */
    public void setAliasName(String aliasName) {
        this.aliasName = aliasName == null ? null : aliasName.trim();
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

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName == null ? null : moduleName.trim();
    }

    public Integer getHasPower() {
        return hasPower;
    }

    public void setHasPower(Integer hasPower) {
        this.hasPower = hasPower;
    }

    @Override
    public String toString() {
        return "ModulePower [" +
                "mpId=" + mpId +
                ", moduleCode=" + moduleCode +
                ", powerItem=" + powerItem +
                ", aliasName=" + aliasName +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}
