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
package com.chanus.yuntao.boot.framework.web.exception;

/**
 * 错误枚举
 *
 * @author Chanus
 * @date 2021-03-25 18:19:21
 * @since 1.1.4
 */
public enum ErrorEnum {
    SUCCESS(0, "成功"),
    NO_AUTH(401, "未登录"),
    NO_PERMISSION(403, "无权限"),
    NOT_FOUND(404, "未找到资源"),
    INTERNAL_SERVER_ERROR(500, "服务器异常");

    /**
     * 错误码
     */
    private final Integer errorCode;

    /**
     * 错误信息
     */
    private final String errorMsg;

    ErrorEnum(Integer errorCode, String errorMsg) {
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
    }

    public Integer getErrorCode() {
        return errorCode;
    }

    public String getErrorMsg() {
        return errorMsg;
    }
}
