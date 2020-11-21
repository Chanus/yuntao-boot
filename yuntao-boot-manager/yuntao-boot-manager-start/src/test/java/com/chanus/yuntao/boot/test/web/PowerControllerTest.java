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
package com.chanus.yuntao.boot.test.web;

import com.chanus.yuntao.boot.common.constant.Constants;
import com.chanus.yuntao.boot.common.utils.JsonUtils;
import com.chanus.yuntao.boot.manager.controller.PowerController;
import com.chanus.yuntao.boot.manager.model.Power;
import com.chanus.yuntao.boot.test.BaseSpringBootWebTest;
import net.minidev.json.JSONObject;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

/**
 * PowerController 单元测试
 *
 * @author Chanus
 * @date 2020-11-20 10:49:31
 * @since 1.0.1
 */
public class PowerControllerTest extends BaseSpringBootWebTest {
    @Autowired
    private PowerController powerController;

    @Override
    @Before
    public void setup() {
        mockMvc = MockMvcBuilders.standaloneSetup(powerController).build();
    }

    @Test
    public void listTest() throws Exception {
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.post("/system/power/list")
                .accept(MediaType.APPLICATION_JSON).param("validStatus", Constants.STATUS_NO))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();

        logger.info(mvcResult.getResponse().getContentAsString());
    }

    @Test
    public void updateTest() throws Exception {
        Power power = new Power();
        power.setId(1);
        power.setValidStatus(Constants.STATUS_NO);

        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.post("/system/power/update")
                .param("id", "1").param("validStatus", Constants.STATUS_NO))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();

        logger.info(mvcResult.getResponse().getContentAsString());
    }
}
