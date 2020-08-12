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
package com.chanus.yuntao.boot.common.constant;

/**
 * 系统常量配置
 *
 * @author Chanus
 * @date 2020-07-30 09:54:11
 * @since 0.0.1
 */
public class Constants {
    /**
     * 状态：否
     */
    public final static String STATUS_NO = "0";
    /**
     * 状态：是
     */
    public final static String STATUS_YES = "1";
    /**
     * 通用成功标识
     */
    public static final String SUCCESS = "0";
    /**
     * 通用失败标识
     */
    public static final String FAIL = "1";
    /**
     * 定时任务状态：停止
     */
    public final static String STATUS_JOB_STOP = "0";
    /**
     * 定时任务状态：启动
     */
    public final static String STATUS_JOB_START = "1";

    /**
     * 定时任务状态：暂停
     */
    public final static String STATUS_JOB_PAUSE = "2";

    /**
     * 文件上传路径
     */
    public final static String UPLOAD_PATH = "/upload/";
}
