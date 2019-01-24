package com.xh.xiaoyiduo.admin.lygl.dao;

import com.xh.xiaoyiduo.admin.lygl.pojo.B_GOOD_MESSAGE_REPLY;
import org.springframework.stereotype.Repository;

@Repository("replyMapper")
public interface B_GOOD_MESSAGE_ReplyMapper {
    int deleteByPrimaryKey(String replyId);

    int insert(B_GOOD_MESSAGE_REPLY reply);

    int insertSelective(B_GOOD_MESSAGE_REPLY record);

    B_GOOD_MESSAGE_REPLY selectByPrimaryKey(String messageId);

    int updateByPrimaryKeySelective(B_GOOD_MESSAGE_REPLY record);

    int updateByPrimaryKey(B_GOOD_MESSAGE_REPLY record);
}