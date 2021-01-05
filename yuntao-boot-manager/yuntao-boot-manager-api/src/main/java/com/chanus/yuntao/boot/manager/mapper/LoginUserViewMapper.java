package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.manager.model.LoginUserView;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

/**
 * 登录用户视图
 *
 * @author Chanus
 * @date 2020-08-01 09:23:20
 * @since 1.0.0
 */
@Mapper
public interface LoginUserViewMapper {
    @Select("select login_no, login_name, password, role_code, master_no, master_role_code, valid_status, head_image " +
            "from view_login_user where binary login_no = #{loginNo,jdbcType=VARCHAR}")
    LoginUserView selectLoginUser(String loginNo);

    @Select("select 1 from view_user where binary user_no = #{userNo,jdbcType=VARCHAR} limit 1")
    Integer isExistUser(String userNo);

    @Select("select * from view_user where binary user_no = #{userNo,jdbcType=VARCHAR} limit 1")
    Map<String, Object> selectUserByUserNo(String userNo);

    @Select("select * from view_user where ${column} = #{value}")
    Map<String, Object> selectUser(@Param("column") String column, @Param("value") String value);
}