package com.xh.xiaoyiduo.admin.lygl.dao;

import com.xh.xiaoyiduo.admin.lygl.pojo.B_GOOD_MESSAGE;

public interface B_GOOD_MESSAGEMapper {
    int deleteByPrimaryKey(String messageId);

    int insert(B_GOOD_MESSAGE record);

    int insertSelective(B_GOOD_MESSAGE record);

    B_GOOD_MESSAGE selectByPrimaryKey(String messageId);

    int updateByPrimaryKeySelective(B_GOOD_MESSAGE record);

    int updateByPrimaryKey(B_GOOD_MESSAGE record);
}