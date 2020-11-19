package com.chanus.yuntao.boot.manager.service.impl;

import com.chanus.yuntao.boot.framework.base.service.impl.BaseServiceImpl;
import com.chanus.yuntao.boot.manager.mapper.WhiteIpMapper;
import com.chanus.yuntao.boot.manager.model.WhiteIp;
import com.chanus.yuntao.boot.manager.service.WhiteIpService;
import org.springframework.stereotype.Service;

/**
 * IP白名单管理接口实现
 *
 * @author Chanus
 * @date 2020-08-10 10:28:03
 * @since 1.0.0
 */
@Service
public class WhiteIpServiceImpl extends BaseServiceImpl<WhiteIpMapper, WhiteIp> implements WhiteIpService {

}
