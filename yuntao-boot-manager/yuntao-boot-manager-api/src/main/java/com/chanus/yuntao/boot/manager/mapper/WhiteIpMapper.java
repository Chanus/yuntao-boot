package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.framework.base.mapper.BaseMapper;
import com.chanus.yuntao.boot.manager.model.WhiteIp;
import org.apache.ibatis.annotations.Mapper;

/**
 * 系统IP白名单
 *
 * @author Chanus
 * @date 2020-08-10 10:28:03
 * @since 1.0.0
 */
@Mapper
public interface WhiteIpMapper extends BaseMapper<WhiteIp> {
    String getFixedWhiteIps(String loginNo);
}