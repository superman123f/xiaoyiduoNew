package com.xh.xiaoyiduo.admin.lygl.dao;

import com.xh.xiaoyiduo.admin.lygl.pojo.B_GOOD_MESSAGE_REPLY;

public interface B_GOOD_MESSAGE_REPLYMapper {
    int deleteByPrimaryKey(String replyId);

    int insert(B_GOOD_MESSAGE_REPLY record);

    int insertSelective(B_GOOD_MESSAGE_REPLY record);

    B_GOOD_MESSAGE_REPLY selectByPrimaryKey(String replyId);

    int updateByPrimaryKeySelective(B_GOOD_MESSAGE_REPLY record);

    int updateByPrimaryKey(B_GOOD_MESSAGE_REPLY record);
}