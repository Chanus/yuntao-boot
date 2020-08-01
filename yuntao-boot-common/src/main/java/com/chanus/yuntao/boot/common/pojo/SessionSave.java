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
package com.chanus.yuntao.boot.common.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 * 存储全局的 SessionId，实现账号只能在同一地点登录
 *
 * @author Chanus
 * @date 2020-08-01 15:05:44
 * @since 0.0.2
 */
public class SessionSave {
    private static Map<String, String> SessionIdSave = new HashMap<>();

    public static Map<String, String> getSessionIdSave() {
        return SessionIdSave;
    }

    public static void setSessionIdSave(Map<String, String> sessionIdSave) {
        SessionIdSave = sessionIdSave;
    }
}
