package com.chanus.yuntao.boot.manager.service;

import com.chanus.yuntao.boot.framework.base.service.BaseService;
import com.chanus.yuntao.boot.manager.model.Operator;
import com.chanus.yuntao.utils.core.lang.Message;
import com.chanus.yuntao.utils.core.lang.Page;
import com.chanus.yuntao.utils.core.map.CustomMap;

/**
 * 操作员管理接口
 *
 * @author Chanus
 * @date 2020-08-07 16:15:15
 * @since 1.0.0
 */
public interface OperatorService extends BaseService<Operator> {
    /**
     * 根据操作员 ID 查询操作员信息
     *
     * @param id 操作员 ID
     * @return
     */
    Operator get(Integer id);

    /**
     * 根据操作员账号查询操作员信息
     *
     * @param operatorNo 操作员账号
     * @return
     */
    Operator get(String operatorNo);

    /**
     * 修改密码，操作员修改个人密码时旧密码不能为空
     *
     * @param operatorNo  操作员账号
     * @param oldPassword 旧密码
     * @param newPassword 新密码
     * @param self        操作标识：{@code true}-修改个人密码，{@code false}-管理员修改当前账号的密码
     * @return
     */
    Message updatePassword(String operatorNo, String oldPassword, String newPassword, boolean self);

    /**
     * 分页查询子账号
     *
     * @param params loginRoleCode    登录角色编码，必需
     *               loginNo    登录账号，必需
     *               subNo  子账号
     *               masterNo   主账号
     *               masterRoleCode   主账号角色编码
     *               validStatus    状态
     * @return
     */
    Page<Operator> listSubPagination(CustomMap params);

    /**
     * 子账号授权
     *
     * @param subNo        子账号
     * @param modulePowers 模块-权限项数组
     * @return
     */
    Message grantSubModulePower(String subNo, String[] modulePowers);

    /**
     * 获取操作员的头像路径
     *
     * @param operatorNo 操作员账号
     * @return
     */
    String getHeadImage(String operatorNo);

    /**
     * 更新操作员头像
     *
     * @param operatorNo 操作员账号
     * @param headImage  操作员账号头像路径
     * @return
     */
    Message updateHeadImage(String operatorNo, String headImage);
}
