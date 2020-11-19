package com.chanus.yuntao.boot.manager.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 定时任务定义表
 *
 * @author Chanus
 * @date 2020-08-10 17:26:26
 * @since 1.0.0
 */
public class ScheduleJob implements Serializable {
    private static final long serialVersionUID = 1L;

    // ID
    private Integer id;
    // 任务名称
    private String jobName;
    // 任务组
    private String jobGroup;
    // 执行类
    private String jobClassName;
    // 属性配置，json格式
    private String jobData;
    // 备注
    private String remark;
    // 状态：0-停止，1-启动，2-暂停
    private String validStatus;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtCreate;
    // 更新时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime gmtModified;

    @TableField(exist = false)
    private List<ScheduleTrigger> scheduleTriggers;

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
     * 获取：任务名称
     */
    public String getJobName() {
        return jobName;
    }

    /**
     * 设置：任务名称
     */
    public void setJobName(String jobName) {
        this.jobName = jobName == null ? null : jobName.trim();
    }

    /**
     * 获取：任务组
     */
    public String getJobGroup() {
        return jobGroup;
    }

    /**
     * 设置：任务组
     */
    public void setJobGroup(String jobGroup) {
        this.jobGroup = jobGroup == null ? null : jobGroup.trim();
    }

    /**
     * 获取：执行类
     */
    public String getJobClassName() {
        return jobClassName;
    }

    /**
     * 设置：执行类
     */
    public void setJobClassName(String jobClassName) {
        this.jobClassName = jobClassName == null ? null : jobClassName.trim();
    }

    /**
     * 获取：属性配置，json格式
     */
    public String getJobData() {
        return jobData;
    }

    /**
     * 设置：属性配置，json格式
     */
    public void setJobData(String jobData) {
        this.jobData = jobData == null ? null : jobData.trim();
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
     * 获取：状态：0-停止，1-启动，2-暂停
     */
    public String getValidStatus() {
        return validStatus;
    }

    /**
     * 设置：状态：0-停止，1-启动，2-暂停
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

    public List<ScheduleTrigger> getScheduleTriggers() {
        return scheduleTriggers;
    }

    public void setScheduleTriggers(List<ScheduleTrigger> scheduleTriggers) {
        this.scheduleTriggers = scheduleTriggers;
    }

    @Override
    public String toString() {
        return "ScheduleJob [" +
                "id=" + id +
                ", jobName=" + jobName +
                ", jobGroup=" + jobGroup +
                ", jobClassName=" + jobClassName +
                ", jobData=" + jobData +
                ", remark=" + remark +
                ", validStatus=" + validStatus +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}
