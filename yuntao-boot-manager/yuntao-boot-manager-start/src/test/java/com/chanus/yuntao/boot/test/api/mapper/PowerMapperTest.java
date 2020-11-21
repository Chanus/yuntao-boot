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
package com.chanus.yuntao.boot.test.api.mapper;

import com.chanus.yuntao.boot.common.constant.Constants;
import com.chanus.yuntao.boot.manager.mapper.PowerMapper;
import com.chanus.yuntao.boot.manager.model.Power;
import com.chanus.yuntao.boot.test.BaseSpringBootTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * PowerMapper 单元测试
 *
 * @author Chanus
 * @date 2020-11-20 10:25:13
 * @since 1.0.1
 */
public class PowerMapperTest extends BaseSpringBootTest {
    @Autowired
    private PowerMapper powerMapper;

    @Test
    public void getMaxPriorityTest() {
        Integer maxPriority = powerMapper.getMaxPriority();
        logger.info("maxPriority = {}", maxPriority);
    }

    @Test
    public void updateByIdTest() {
        Power power = new Power();
        power.setId(1);
        power.setValidStatus(Constants.STATUS_NO);
        powerMapper.updateById(power);
        logger.info("updateById 执行结束");
    }
}
