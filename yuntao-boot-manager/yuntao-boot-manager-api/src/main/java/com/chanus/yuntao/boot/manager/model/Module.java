package com.chanus.yuntao.boot.manager.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 系统模块表
 *
 * @author Chanus
 * @date 2020-08-06 17:34:31
 * @since 1.0.0
 */
public class Module implements Serializable {
    private static final long serialVersionUID = 1L;

    // 模块ID
    @TableId(value = "module_id", type = IdType.INPUT)
    private Integer moduleId;
    // 上级模块ID，一级模块默认为0
    private Integer moduleParentId;
    // 模块代码
    private String moduleCode;
    // 模块名称
    private String moduleName;
    // 模块URL
    private String moduleUrl;
    // 模块层级，一级模块从10开始，二级模块与上级模块层级拼接，从01开始，如1001
    private String moduleLevel;
    // 是否是菜单，0-不是菜单，1-是菜单，默认1
    private String moduleIsMenu;
    // 是否需要设置权限，0-不需要，1-需要，默认1
    private String moduleForPermission;
    // 是否是超级管理员私有菜单，0-不是，1-是，默认0
    private String moduleForAdmin;
    // 菜单分组，0-共有，1-操作员，2-非操作员，默认0
    private String moduleBelong;
    // 模块图标
    private String moduleIcon;
    // 模块页面打开位置：0-页签打开，1-新页面打开
    private String moduleTarget;
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
    // 一级模块的子模块
    @TableField(exist = false)
    private List<Module> children;
    // 模块所具有的权限项
    @TableField(exist = false)
    private List<ModulePower> modulePowers;

    /**
     * 获取：模块ID
     */
    public Integer getModuleId() {
        return moduleId;
    }

    /**
     * 设置：模块ID
     */
    public void setModuleId(Integer moduleId) {
        this.moduleId = moduleId;
    }

    /**
     * 获取：上级模块ID，一级模块默认为0
     */
    public Integer getModuleParentId() {
        return moduleParentId;
    }

    /**
     * 设置：上级模块ID，一级模块默认为0
     */
    public void setModuleParentId(Integer moduleParentId) {
        this.moduleParentId = moduleParentId;
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
     * 获取：模块名称
     */
    public String getModuleName() {
        return moduleName;
    }

    /**
     * 设置：模块名称
     */
    public void setModuleName(String moduleName) {
        this.moduleName = moduleName == null ? null : moduleName.trim();
    }

    /**
     * 获取：模块URL
     */
    public String getModuleUrl() {
        return moduleUrl;
    }

    /**
     * 设置：模块URL
     */
    public void setModuleUrl(String moduleUrl) {
        this.moduleUrl = moduleUrl == null ? null : moduleUrl.trim();
    }

    /**
     * 获取：模块层级，一级模块从10开始，二级模块与上级模块层级拼接，从01开始，如1001
     */
    public String getModuleLevel() {
        return moduleLevel;
    }

    /**
     * 设置：模块层级，一级模块从10开始，二级模块与上级模块层级拼接，从01开始，如1001
     */
    public void setModuleLevel(String moduleLevel) {
        this.moduleLevel = moduleLevel == null ? null : moduleLevel.trim();
    }

    /**
     * 获取：是否是菜单，0-不是菜单，1-是菜单，默认1
     */
    public String getModuleIsMenu() {
        return moduleIsMenu;
    }

    /**
     * 设置：是否是菜单，0-不是菜单，1-是菜单，默认1
     */
    public void setModuleIsMenu(String moduleIsMenu) {
        this.moduleIsMenu = moduleIsMenu == null ? null : moduleIsMenu.trim();
    }

    /**
     * 获取：是否需要设置权限，0-不需要，1-需要，默认1
     */
    public String getModuleForPermission() {
        return moduleForPermission;
    }

    /**
     * 设置：是否需要设置权限，0-不需要，1-需要，默认1
     */
    public void setModuleForPermission(String moduleForPermission) {
        this.moduleForPermission = moduleForPermission == null ? null : moduleForPermission.trim();
    }

    /**
     * 获取：是否是超级管理员私有菜单，0-不是，1-是，默认0
     */
    public String getModuleForAdmin() {
        return moduleForAdmin;
    }

    /**
     * 设置：是否是超级管理员私有菜单，0-不是，1-是，默认0
     */
    public void setModuleForAdmin(String moduleForAdmin) {
        this.moduleForAdmin = moduleForAdmin == null ? null : moduleForAdmin.trim();
    }

    /**
     * 获取：菜单分组，0-共有，1-操作员，2-非操作员，默认0
     */
    public String getModuleBelong() {
        return moduleBelong;
    }

    /**
     * 设置：菜单分组，0-共有，1-操作员，2-非操作员，默认0
     */
    public void setModuleBelong(String moduleBelong) {
        this.moduleBelong = moduleBelong == null ? null : moduleBelong.trim();
    }

    /**
     * 获取：模块图标
     */
    public String getModuleIcon() {
        return moduleIcon;
    }

    /**
     * 设置：模块图标
     */
    public void setModuleIcon(String moduleIcon) {
        this.moduleIcon = moduleIcon == null ? null : moduleIcon.trim();
    }

    /**
     * 获取：模块页面打开位置：0-页签打开，1-新页面打开
     */
    public String getModuleTarget() {
        return moduleTarget;
    }

    /**
     * 设置：模块页面打开位置：0-页签打开，1-新页面打开
     */
    public void setModuleTarget(String moduleTarget) {
        this.moduleTarget = moduleTarget == null ? null : moduleTarget.trim();
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

    public List<Module> getChildren() {
        return children;
    }

    public void setChildren(List<Module> children) {
        this.children = children;
    }

    public List<ModulePower> getModulePowers() {
        return modulePowers;
    }

    public void setModulePowers(List<ModulePower> modulePowers) {
        this.modulePowers = modulePowers;
    }

    @Override
    public String toString() {
        return "Module [" +
                "moduleId=" + moduleId +
                ", moduleParentId=" + moduleParentId +
                ", moduleCode=" + moduleCode +
                ", moduleName=" + moduleName +
                ", moduleUrl=" + moduleUrl +
                ", moduleLevel=" + moduleLevel +
                ", moduleIsMenu=" + moduleIsMenu +
                ", moduleForPermission=" + moduleForPermission +
                ", moduleForAdmin=" + moduleForAdmin +
                ", moduleBelong=" + moduleBelong +
                ", moduleIcon=" + moduleIcon +
                ", moduleTarget=" + moduleTarget +
                ", remark=" + remark +
                ", validStatus=" + validStatus +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                "]";
    }
}
