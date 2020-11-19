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
package com.chanus.yuntao.boot.manager;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 服务启动入口
 *
 * @author Chanus
 * @date 2020-08-01 10:48:51
 * @since 1.0.0
 */
@SpringBootApplication(scanBasePackages = {"com.chanus.yuntao.boot.framework", "com.chanus.yuntao.boot.manager"})
public class YuntaoBootManagerApplication {
    public static void main(String[] args) {
        SpringApplication.run(YuntaoBootManagerApplication.class, args);
    }
}
