package com.chanus.yuntao.boot.manager.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 系统字典项表
 *
 * @author Chanus
 * @date 2020-08-10 16:07:52
 * @since 1.0.0
 */
public class DictItem implements Serializable {
    private static final long serialVersionUID = 1L;

    // ID
    private Integer id;
    // 字典集代码
    private String dictCode;
    // 字典项代码
    private String itemCode;
    // 字典项名称
    private String itemName;
    // 字典项值
    private String itemData;
    // 备注
    private String remark;
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
     * 获取：ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置：ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取：字典集代码
     */
    public String getDictCode() {
        return dictCode;
    }

    /**
     * 设置：字典集代码
     */
    public void setDictCode(String dictCode) {
        this.dictCode = dictCode == null ? null : dictCode.trim();
    }

    /**
     * 获取：字典项代码
     */
    public String getItemCode() {
        return itemCode;
    }

    /**
     * 设置：字典项代码
     */
    public void setItemCode(String itemCode) {
        this.itemCode = itemCode == null ? null : itemCode.trim();
    }

    /**
     * 获取：字典项名称
     */
    public String getItemName() {
        return itemName;
    }

    /**
     * 设置：字典项名称
     */
    public void setItemName(String itemName) {
        this.itemName = itemName == null ? null : itemName.trim();
    }

    /**
     * 获取：字典项值
     */
    public String getItemData() {
        return itemData;
    }

    /**
     * 设置：字典项值
     */
    public void setItemData(String itemData) {
        this.itemData = itemData == null ? null : itemData.trim();
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
        return "DictItem [" +
                "id=" + id +
                ", dictCode=" + dictCode +
                ", itemCode=" + itemCode +
                ", itemName=" + itemName +
                ", itemData=" + itemData +
                ", remark=" + remark +
                ", validStatus=" + validStatus +
                ", priority=" + priority +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}
