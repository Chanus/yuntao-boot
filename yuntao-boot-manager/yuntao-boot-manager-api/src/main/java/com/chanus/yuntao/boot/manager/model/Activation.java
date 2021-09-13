package com.chanus.yuntao.boot.manager.model;

import java.io.Serializable;

/**
 * 系统激活码表
 *
 * @author Chanus
 * @date 2021-09-13 15:11:01
 * @since 1.2.0
 */
public class Activation implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 激活码秘钥
     */
    private String activationKey;
    /**
     * 激活码
     */
    private String activationCode;

    public String getActivationKey() {
        return activationKey;
    }

    public void setActivationKey(String activationKey) {
        this.activationKey = activationKey == null ? null : activationKey.trim();
    }

    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode == null ? null : activationCode.trim();
    }

    @Override
    public String toString() {
        return "Activation [" +
                "activationKey=" + activationKey +
                ", activationCode=" + activationCode +
                "]";
    }
}
