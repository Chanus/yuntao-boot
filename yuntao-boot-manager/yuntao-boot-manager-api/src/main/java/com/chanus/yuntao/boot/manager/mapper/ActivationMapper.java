package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.manager.model.Activation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * 系统激活码表
 *
 * @author Chanus
 * @date 2021-09-13 15:11:01
 * @since 1.2.0
 */
@Mapper
public interface ActivationMapper {
    @Select("select activation_key, activation_code from sys_activation limit 1")
    Activation select();

    @Select("select activation_key from sys_activation limit 1")
    String selectActivationKey();

    @Update("update sys_activation set activation_code = #{activationCode,jdbcType=VARCHAR}")
    int updateActivationCode(String activationCode);
}