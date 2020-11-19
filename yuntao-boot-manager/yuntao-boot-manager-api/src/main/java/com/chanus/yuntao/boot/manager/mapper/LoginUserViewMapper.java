package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.manager.model.LoginUserView;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * 登录用户视图
 *
 * @author Chanus
 * @date 2020-08-01 09:23:20
 * @since 1.0.0
 */
@Mapper
public interface LoginUserViewMapper {
    @Select("select login_no, login_name, role_code, master_no, master_role_code, valid_status, head_image " +
            "from view_login_user where login_no = #{loginNo,jdbcType=VARCHAR}")
    LoginUserView getUser(String loginNo);

    @Select("select login_no, login_name, password, role_code, master_no, master_role_code, valid_status, head_image " +
            "from view_login_user where binary login_no = #{loginNo,jdbcType=VARCHAR}")
    LoginUserView login(String loginNo);

    @Select("select user_name from view_user where user_name = #{userName,jdbcType=VARCHAR} limit 1")
    String getUserName(String userName);
}