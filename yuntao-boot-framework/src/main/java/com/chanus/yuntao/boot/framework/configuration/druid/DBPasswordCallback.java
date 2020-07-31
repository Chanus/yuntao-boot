/*
 * Copyright (c) 2020 Chanus
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.chanus.yuntao.boot.framework.configuration.druid;

import com.alibaba.druid.util.DruidPasswordCallback;
import com.chanus.yuntao.utils.core.encrypt.AESUtils;

import java.util.Properties;

/**
 * Druid 数据库连接密码加密处理
 *
 * @author Chanus
 * @date 2020-07-29 10:55:47
 * @since 0.0.1
 */
public class DBPasswordCallback extends DruidPasswordCallback {
    private static final long serialVersionUID = -7180857487767828219L;

    @Override
    public void setProperties(Properties properties) {
        super.setProperties(properties);
        String password = properties.getProperty("password");
        String encryptKey = properties.getProperty("encryptKey");

        if (password != null && password.trim().length() > 0) {
            try {
                // 这里的 password 是将 jdbc.properties 配置得到的密码进行解密之后的值，所以这里的代码是将密码进行解密
                password = AESUtils.decrypt(password, encryptKey);
                setPassword(password.toCharArray());
            } catch (Exception e) {
                setPassword(password.toCharArray());
            }
        }
    }
}
