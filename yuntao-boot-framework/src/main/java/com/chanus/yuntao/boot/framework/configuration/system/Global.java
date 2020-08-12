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
package com.chanus.yuntao.boot.framework.configuration.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 全局配置类
 *
 * @author Chanus
 * @date 2020-08-04 16:24:32
 * @since 0.0.3
 */
@Component
public class Global {
    /**
     * 项目名称
     */
    public static String name;
    /**
     * 版本号
     */
    public static String version;
    /**
     * 版权声明
     */
    public static String copyright;

    /**
     * 文件上传路径
     */
    public static String profile;

    @Autowired
    public Global(@Value("${yuntao.name}") String name, @Value("${yuntao.version}") String version,
                  @Value("${yuntao.copyright}") String copyright, @Value("${yuntao.profile}") String profile) {
        Global.name = name;
        Global.version = version;
        Global.copyright = copyright;
        Global.profile = profile;
    }
}
