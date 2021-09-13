package com.chanus.yuntao.boot.manager.service;

import com.chanus.yuntao.utils.core.lang.Message;

/**
 * 系统激活服务接口
 *
 * @author Chanus
 * @date 2021-09-13 15:11:01
 * @since 1.2.0
 */
public interface ActivationService {
    /**
     * 生成激活码
     *
     * @param name       产品名称
     * @param version    产品版本号
     * @param macAddress 设备MAC地址，多个用","分隔，若为0则表示所有地址可用
     * @param expireDate 过期日期，为 yyyy-MM-dd 格式日期字符串，若为0则表示永久有效
     * @param enable     是否启用激活码验证，1-启用，0-禁用
     * @param key        密钥
     * @return 激活码
     */
    String generateActivationCode(String name, String version, String macAddress, String expireDate, String enable, String key);

    /**
     * 校验激活码
     *
     * @param activationCode 激活码
     * @return 校验结果
     */
    Message verifyActivationCode(String activationCode);

    /**
     * 校验系统激活码
     */
    void verify();

    /**
     * 系统激活
     *
     * @param activationCode 激活码
     * @return 激活结果
     */
    Message activate(String activationCode);
}
