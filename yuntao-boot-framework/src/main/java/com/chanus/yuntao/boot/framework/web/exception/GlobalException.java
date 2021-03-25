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
 * 全局异常封装类
 *
 * @author Chanus
 * @date 2021-03-25 18:01:34
 * @since 1.1.4
 */
public class GlobalException extends RuntimeException {
    private static final long serialVersionUID = 1735373142914667142L;

    /**
     * 错误代码
     */
    private int errorCode;

    public GlobalException() {
        super(ErrorEnum.INTERNAL_SERVER_ERROR.getErrorMsg());
        this.errorCode = ErrorEnum.INTERNAL_SERVER_ERROR.getErrorCode();
    }

    public GlobalException(int errorCode, String errorMsg) {
        super(errorMsg);
        this.errorCode = errorCode;
    }

    public GlobalException(ErrorEnum errorEnum) {
        super(errorEnum.getErrorMsg());
        this.errorCode = errorEnum.getErrorCode();
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }
}
