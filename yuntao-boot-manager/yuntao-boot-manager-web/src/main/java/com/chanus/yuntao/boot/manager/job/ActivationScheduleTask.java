/*
 * Copyright (c) 2021 Chanus
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
package com.chanus.yuntao.boot.manager.job;

import com.chanus.yuntao.boot.manager.service.ActivationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

/**
 * 系统激活校验定时任务
 *
 * @author Chanus
 * @date 2021-09-13 16:42:22
 * @since 1.2.0
 */
@Configuration
@EnableScheduling
public class ActivationScheduleTask {
    @Autowired
    private ActivationService activationService;

    @Scheduled(cron = "0 0 0 * * ?")
    private void activationTask() {
        activationService.verify();
    }
}
