package com.chanus.yuntao.boot.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chanus.yuntao.boot.common.constant.Constants;
import com.chanus.yuntao.boot.framework.base.service.impl.BaseServiceImpl;
import com.chanus.yuntao.boot.manager.common.AESKeyConsts;
import com.chanus.yuntao.boot.manager.common.SystemConstants;
import com.chanus.yuntao.boot.manager.mapper.LoginUserViewMapper;
import com.chanus.yuntao.boot.manager.mapper.OperatorMapper;
import com.chanus.yuntao.boot.manager.mapper.RoleMapper;
import com.chanus.yuntao.boot.manager.mapper.RoleModulePowerMapper;
import com.chanus.yuntao.boot.manager.model.LoginUserView;
import com.chanus.yuntao.boot.manager.model.Operator;
import com.chanus.yuntao.boot.manager.model.Role;
import com.chanus.yuntao.boot.manager.model.RoleModulePower;
import com.chanus.yuntao.boot.manager.service.OperatorService;
import com.chanus.yuntao.utils.core.ArrayUtils;
import com.chanus.yuntao.utils.core.StringUtils;
import com.chanus.yuntao.utils.core.encrypt.SHAUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import com.chanus.yuntao.utils.core.lang.Page;
import com.chanus.yuntao.utils.core.map.CustomMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 操作员管理接口实现
 *
 * @author Chanus
 * @date 2020-08-07 16:15:15
 * @since 1.0.0
 */
@Service
public class OperatorServiceImpl extends BaseServiceImpl<OperatorMapper, Operator> implements OperatorService {
    @Autowired
    private LoginUserViewMapper loginUserViewMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private RoleModulePowerMapper roleModulePowerMapper;

    @Override
    public Message insert(Operator t) {
        if (StringUtils.isNotBlank(loginUserViewMapper.getUserName(t.getOperatorNo())))
            return Message.fail("账号已存在");

        if (StringUtils.isNotBlank(t.getOperatorPassword()))
            t.setOperatorPassword(SHAUtils.sha256(t.getOperatorPassword() + t.getOperatorNo()));

        Role role;
        if (SystemConstants.ROLE_SUB_1.equals(t.getOperatorRoleCode())) {// 添加子账号时
            if (StringUtils.isBlank(t.getMasterNo()))
                return Message.fail("主账号不能为空");

            LoginUserView user = loginUserViewMapper.getUser(t.getMasterNo());
            if (user == null)
                return Message.fail("主账号不存在");
            if (SystemConstants.ROLE_SUB_1.equals(user.getRoleCode()))
                return Message.fail("子账号不能创建子账号");

            t.setMasterNo(user.getLoginNo());
            t.setMasterRoleCode(user.getRoleCode());

            role = roleMapper.selectOne(new QueryWrapper<Role>().lambda()
                    .select(Role::getHasOperator, Role::getSuperior)
                    .eq(Role::getRoleCode, user.getRoleCode()));
        } else {
            role = roleMapper.selectOne(new QueryWrapper<Role>().lambda()
                    .select(Role::getHasOperator, Role::getSuperior)
                    .eq(Role::getRoleCode, t.getOperatorRoleCode()));
        }

        if (role == null)
            return Message.fail("角色不存在");
        if (Constants.STATUS_NO.equals(role.getHasOperator()))
            return Message.fail("当前角色不能添加操作员");

        t.setSuperior(role.getSuperior());
        t.setAesEmailKey(AESKeyConsts.KEY_EMAIL);
        t.setAesPhoneKey(AESKeyConsts.KEY_PHONE);

        return super.insert(t);
    }

    @Override
    public Message update(Operator t) {
        if (StringUtils.isNotBlank(t.getOperatorPassword()))
            t.setOperatorPassword(SHAUtils.sha256(t.getOperatorPassword() + t.getOperatorNo()));

        t.setAesEmailKey(AESKeyConsts.KEY_EMAIL);
        t.setAesPhoneKey(AESKeyConsts.KEY_PHONE);

        getBaseMapper().updateById(t);
        return Message.updateSuccess();
    }

    @Override
    public List<Operator> list(CustomMap params) {
        return super.list(params.putNext("aesEmailKey", AESKeyConsts.KEY_EMAIL).putNext("aesPhoneKey", AESKeyConsts.KEY_PHONE));
    }

    @Override
    public Page<Operator> listPagination(CustomMap params) {
        return super.listPagination(params.putNext("aesEmailKey", AESKeyConsts.KEY_EMAIL).putNext("aesPhoneKey", AESKeyConsts.KEY_PHONE));
    }

    @Override
    public Operator get(Integer id) {
        return getBaseMapper().getById(id, AESKeyConsts.KEY_EMAIL, AESKeyConsts.KEY_PHONE);
    }

    @Override
    public Operator get(String operatorNo) {
        return getBaseMapper().getByOperatorNo(operatorNo, AESKeyConsts.KEY_EMAIL, AESKeyConsts.KEY_PHONE);
    }

    @Override
    public Message updatePassword(String operatorNo, String oldPassword, String newPassword, boolean self) {
        if (StringUtils.isBlank(newPassword))
            return Message.fail("新密码不能为空");
        if (self) {// 修改个人密码
            if (StringUtils.isBlank(oldPassword))
                return Message.fail("旧密码不能为空");

            String operatorPassword = getBaseMapper().getPassword(operatorNo);
            if (StringUtils.isBlank(operatorPassword))
                return Message.fail("用户不存在");
            if (!SHAUtils.verifySHA256(oldPassword + operatorNo, operatorPassword))
                return Message.fail("旧密码不正确");
        }

        getBaseMapper().updatePassword(operatorNo, SHAUtils.sha256(newPassword + operatorNo));

        return Message.success("密码修改成功");
    }

    @Override
    public Page<Operator> listSubPagination(CustomMap params) {
        int count = getBaseMapper().countSub(params);
        if (count > 0) {
            params.putNext("aesEmailKey", AESKeyConsts.KEY_EMAIL).putNext("aesPhoneKey", AESKeyConsts.KEY_PHONE);
            return Page.pagination(count, getBaseMapper().listSub(Page.initPageParams(params)));
        }

        return new Page<>();
    }

    @Transactional
    @Override
    public Message grantSubModulePower(String subNo, String[] modulePowers) {
        if (StringUtils.isBlank(subNo))
            return Message.fail("请选择被授权的子账号");

        // 先删除子账号原有权限
        roleModulePowerMapper.deleteBySubNo(subNo);
        // 再写入新的子账号权限
        if (ArrayUtils.isNotEmpty(modulePowers)) {
            List<RoleModulePower> subModulePowers = new ArrayList<>();
            RoleModulePower subModulePower;
            for (String s : modulePowers) {
                subModulePower = new RoleModulePower();
                subModulePower.setRoleCode(SystemConstants.ROLE_SUB_1);
                subModulePower.setSubNo(subNo);
                String[] mp = s.split("\\.");
                subModulePower.setModuleCode(mp[0]);
                subModulePower.setPowerItem(mp[1]);
                subModulePowers.add(subModulePower);
            }
            roleModulePowerMapper.insertBatch(subModulePowers);
        }

        return Message.success("子账号授权成功");
    }

    @Override
    public String getHeadImage(String operatorNo) {
        return getBaseMapper().getHeadImage(operatorNo);
    }

    @Override
    public Message updateHeadImage(String operatorNo, String headImage) {
        getBaseMapper().updateHeadImage(operatorNo, headImage);
        return Message.success("头像上传成功").setData(headImage);
    }
}
