package com.chanus.yuntao.boot.manager.service.impl;

import com.chanus.yuntao.boot.common.constant.Constants;
import com.chanus.yuntao.boot.manager.common.AESKeyConsts;
import com.chanus.yuntao.boot.manager.mapper.ActivationMapper;
import com.chanus.yuntao.boot.manager.model.Activation;
import com.chanus.yuntao.boot.manager.service.ActivationService;
import com.chanus.yuntao.utils.core.*;
import com.chanus.yuntao.utils.core.encrypt.AESUtils;
import com.chanus.yuntao.utils.core.encrypt.RSAUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.time.LocalDate;
import java.util.Map;
import java.util.Set;

/**
 * 系统激活服务接口实现
 *
 * @author Chanus
 * @date 2021-09-13 15:11:01
 * @since 1.2.0
 */
@Service
public class ActivationServiceImpl implements ActivationService {
    @Autowired
    private ActivationMapper activationMapper;
    @Resource
    private ServletContext servletContext;

    protected Logger logger = LoggerFactory.getLogger(ActivationServiceImpl.class);

    @Override
    public String generateActivationCode(String name, String version, String macAddress, String expireDate, String enable, String key) {
        String text = "name=" + name + "&version=" + version + "&macAddress=" + macAddress + "&expireDate=" + expireDate +
                "&enable=" + enable;
        key = AESUtils.decryptWithEcb(key, AESKeyConsts.KEY_ACTIVATION);
        String sign = RSAUtils.sign(text, key);
        text = text + "&sign=" + sign;

        return RSAUtils.encryptByPrivateKey(text, key);
    }

    @Override
    public Message verifyActivationCode(String activationCode) {
        String activationKey = activationMapper.selectActivationKey();
        return verifyActivationCode(activationKey, activationCode);
    }

    @Override
    public void verify() {
        Activation activation = activationMapper.select();
        if (activation == null) {
            logger.info("系统无激活码");
            servletContext.setAttribute("activationStatus", Constants.STATUS_NO);
            return;
        }

        Message message = verifyActivationCode(activation.getActivationKey(), activation.getActivationCode());
        if (message.isSuccess())
            servletContext.setAttribute("activationStatus", Constants.STATUS_YES);
        else
            servletContext.setAttribute("activationStatus", Constants.STATUS_NO);
    }

    @Override
    public Message activate(String activationCode) {
        Message message = verifyActivationCode(activationCode);
        if (message.isSuccess()) {
            activationMapper.updateActivationCode(activationCode);
            servletContext.setAttribute("activationStatus", Constants.STATUS_YES);
            return message.setSuccess("激活成功");
        }

        return message;
    }

    private Message verifyActivationCode(String activationKey, String activationCode) {
        if (StringUtils.isBlank(activationKey)) {
            logger.info("校验失败：密钥不能为空");
            return Message.fail("激活码无效");
        }

        if (StringUtils.isBlank(activationCode)) {
            logger.info("校验失败：激活码不能为空");
            return Message.fail("激活码无效");
        }

        try {
            activationKey = AESUtils.decryptWithEcb(activationKey, AESKeyConsts.KEY_ACTIVATION);
            String text = RSAUtils.decryptByPublicKey(activationCode, activationKey);
            Map<String, String> map = UrlUtils.getParamsMap(text, null);
            if (MapUtils.isEmpty(map))
                return Message.fail("激活码无效");

            String name = map.get("name");
            String version = map.get("version");
            String macAddress = map.get("macAddress");
            String expireDate = map.get("expireDate");
            String enable = map.get("enable");
            String sign = map.get("sign");
            String signText = "name=" + name + "&version=" + version + "&macAddress=" + macAddress + "&expireDate=" + expireDate + "&enable=" + enable;

            if (!RSAUtils.verify(signText, sign, activationKey))
                return Message.fail("激活码无效");

            if (Constants.STATUS_NO.equals(enable))
                return Message.success("校验成功");

            Set<String> macSet = SystemUtils.getHostMac();
            if (CollectionUtils.isEmpty(macSet)) {
                logger.info("校验失败：无法获取本机 Mac 地址");
                return Message.fail("校验失败");
            }

            boolean b = Constants.STATUS_NO.equals(macAddress);
            if (!b) {
                for (String mac : macSet) {
                    if (StringUtils.contains(macAddress, mac)) {
                        b = true;
                        break;
                    }
                }
                if (!b) {
                    logger.info("校验失败：机器码无效");
                    return Message.fail("激活码无效");
                }
            }

            if (StringUtils.isBlank(expireDate)) {
                logger.info("校验失败：激活码过期日期无效");
                return Message.fail("激活码无效");
            }
            if (!Constants.STATUS_NO.equals(expireDate)) {
                LocalDate date = LocalDateTimeUtils.parseDate(expireDate);
                if (LocalDateTimeUtils.compareNow(date) == -1)
                    return Message.fail("激活码已过期");
            }

            return Message.success("校验成功");
        } catch (Exception e) {
            logger.error("激活码校验失败", e);
            return Message.fail("激活码无效");
        }
    }
}
