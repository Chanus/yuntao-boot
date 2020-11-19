package com.chanus.yuntao.boot.manager.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;

/**
 * 中国行政区划表
 *
 * @author Chanus
 * @date 2020-08-3 22:17:26
 * @since 1.0.0
 */
public class ChinaArea implements Serializable {
    private static final long serialVersionUID = -2057199923039898023L;

    // 行政区划代码
    @TableId(value = "area_id", type = IdType.INPUT)
    private Integer areaId;
    // 上级行政区划代码
    private Integer areaParentId;
    // 行政区名称
    private String areaName;
    // 行政区级别：1-省、直辖市、自治区，2-市，3-区、县
    private String areaLevel;

    /**
     * 获取：行政区划代码
     */
    public Integer getAreaId() {
        return areaId;
    }

    /**
     * 设置：行政区划代码
     */
    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    /**
     * 获取：上级行政区划代码
     */
    public Integer getAreaParentId() {
        return areaParentId;
    }

    /**
     * 设置：上级行政区划代码
     */
    public void setAreaParentId(Integer areaParentId) {
        this.areaParentId = areaParentId;
    }

    /**
     * 获取：行政区名称
     */
    public String getAreaName() {
        return areaName;
    }

    /**
     * 设置：行政区名称
     */
    public void setAreaName(String areaName) {
        this.areaName = areaName == null ? null : areaName.trim();
    }

    /**
     * 获取：行政区级别：1-省、直辖市、自治区，2-市，3-区、县
     */
    public String getAreaLevel() {
        return areaLevel;
    }

    /**
     * 设置：行政区级别：1-省、直辖市、自治区，2-市，3-区、县
     */
    public void setAreaLevel(String areaLevel) {
        this.areaLevel = areaLevel == null ? null : areaLevel.trim();
    }

    @Override
    public String toString() {
        return "ChinaArea [" +
                "areaId=" + areaId +
                ", areaParentId=" + areaParentId +
                ", areaName=" + areaName +
                ", areaLevel=" + areaLevel +
                "]";
    }
}