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

import com.chanus.yuntao.boot.manager.YuntaoBootManagerApplication;
import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * 服务端基础测试类
 *
 * @author Chanus
 * @date 2020-11-20 10:18:42
 * @since 1.0.1
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = YuntaoBootManagerApplication.class)
public abstract class BaseSpringBootTest {
    protected Logger logger = LoggerFactory.getLogger(BaseSpringBootTest.class);

    @Before
    public void init() {
        logger.info("开始测试...");
    }

    @After
    public void after() {
        logger.info("测试结束...");
    }
}
