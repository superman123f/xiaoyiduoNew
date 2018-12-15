package com.xh.xiaoyiduo.shop.dao;

import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.springframework.stereotype.Repository;

@Repository("userMapper")
public interface S_USERMapper {
    int deleteByPrimaryKey(String studentNo);

    int insert(S_USER record);

    int insertSelective(S_USER record);

    S_USER selectByPhone(String phone); //根据手机号查询

    S_USER selectByStudentNo(String studentNo); //根据学号查询

    S_USER selectByNickname(String nickname); //根据昵称查询

    int updateByPrimaryKeySelective(S_USER record);

    int updateByPrimaryKey(S_USER record);
}