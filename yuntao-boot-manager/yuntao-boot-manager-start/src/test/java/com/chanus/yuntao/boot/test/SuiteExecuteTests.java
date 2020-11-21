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
package com.chanus.yuntao.boot.test;

import com.chanus.yuntao.boot.test.api.mapper.PowerMapperTest;
import com.chanus.yuntao.boot.test.api.service.PowerServiceTest;
import com.chanus.yuntao.boot.test.web.PowerControllerTest;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

/**
 * 打包测试，配置测试类，一次性执行所有配置的测试类
 *
 * @author Chanus
 * @date 2020-11-20 11:16:25
 * @since 1.0.1
 */
@RunWith(Suite.class)
@Suite.SuiteClasses({PowerMapperTest.class, PowerServiceTest.class, PowerControllerTest.class})
public class SuiteExecuteTests {
    // 不用写代码，只需要注解即可(在 SuiteClasses 中配置测试类)
}
