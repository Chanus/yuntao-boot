package com.chanus.yuntao.boot.manager.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 系统字典集表
 *
 * @author Chanus
 * @date 2020-08-10 16:06:05
 * @since 1.0.0
 */
public class Dict implements Serializable {
    private static final long serialVersionUID = 1L;

    // ID
    private Integer id;
    // 字典集代码
    private String dictCode;
    // 字典集名称
    private String dictName;
    // 备注
    private String remark;
    // 状态：0-停用，1-启用
    private String validStatus;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtCreate;
    // 更新时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtModified;

    @TableField(exist = false)
    private List<DictItem> dictItems;

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
     * 获取：字典集名称
     */
    public String getDictName() {
        return dictName;
    }

    /**
     * 设置：字典集名称
     */
    public void setDictName(String dictName) {
        this.dictName = dictName == null ? null : dictName.trim();
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

    public List<DictItem> getDictItems() {
        return dictItems;
    }

    public void setDictItems(List<DictItem> dictItems) {
        this.dictItems = dictItems;
    }

    @Override
    public String toString() {
        return "Dict [" +
                "id=" + id +
                ", dictCode=" + dictCode +
                ", dictName=" + dictName +
                ", remark=" + remark +
                ", validStatus=" + validStatus +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}
