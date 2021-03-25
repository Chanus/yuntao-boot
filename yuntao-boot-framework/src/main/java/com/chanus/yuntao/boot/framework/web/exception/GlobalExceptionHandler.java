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

import com.chanus.yuntao.utils.core.lang.Message;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理器
 *
 * @author Chanus
 * @date 2020-07-29 17:43:14
 * @since 0.0.1
 */
@RestControllerAdvice
public class GlobalExceptionHandler {
    private static final Logger LOGGER = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /**
     * 拦截自定义异常
     *
     * @return 异常信息
     */
    @ExceptionHandler(GlobalException.class)
    public Message globalExceptionHandler(GlobalException e) {
        LOGGER.error(e.getMessage(), e);
        return Message.fail(e.getErrorCode(), e.getMessage());
    }

    /**
     * 拦截其他异常
     *
     * @return 异常信息
     */
    @ExceptionHandler(Exception.class)
    public Message exceptionHandler(Exception e) {
        LOGGER.error(e.getMessage(), e);
        return Message.fail(ErrorEnum.INTERNAL_SERVER_ERROR.getErrorCode(), ErrorEnum.INTERNAL_SERVER_ERROR.getErrorMsg());
    }
}
