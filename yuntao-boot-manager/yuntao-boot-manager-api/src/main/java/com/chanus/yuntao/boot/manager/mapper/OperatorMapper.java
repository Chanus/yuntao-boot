package com.chanus.yuntao.boot.manager.mapper;

import com.chanus.yuntao.boot.framework.base.mapper.BaseMapper;
import com.chanus.yuntao.boot.manager.model.Operator;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * 操作员表
 *
 * @author Chanus
 * @date 2020-08-07 16:15:15
 * @since 1.0.0
 */
@Mapper
public interface OperatorMapper extends BaseMapper<Operator> {
    @Override
    int updateById(Operator operator);

    Operator getById(@Param("id") Integer id, @Param("aesEmailKey") String aesEmailKey, @Param("aesPhoneKey") String aesPhoneKey);

    Operator getByOperatorNo(@Param("operatorNo") String operatorNo, @Param("aesEmailKey") String aesEmailKey, @Param("aesPhoneKey") String aesPhoneKey);

    @Select("select operator_password from sys_operator where operator_no = #{operatorNo,jdbcType=VARCHAR}")
    String getPassword(String operatorNo);

    @Update("update sys_operator set operator_password = #{operatorPassword,jdbcType=CHAR} " +
            "where operator_no = #{operatorNo,jdbcType=VARCHAR}")
    void updatePassword(@Param("operatorNo") String operatorNo, @Param("operatorPassword") String operatorPassword);

    int countSub(Map<String, Object> params);

    List<Operator> listSub(Map<String, Object> params);

    @Select("select head_image from sys_operator where operator_no = #{operatorNo,jdbcType=VARCHAR}")
    String getHeadImage(String operatorNo);

    @Update("update sys_operator set head_image = #{headImage,jdbcType=VARCHAR} where operator_no = #{operatorNo,jdbcType=VARCHAR}")
    void updateHeadImage(@Param("operatorNo") String operatorNo, @Param("headImage") String headImage);
}