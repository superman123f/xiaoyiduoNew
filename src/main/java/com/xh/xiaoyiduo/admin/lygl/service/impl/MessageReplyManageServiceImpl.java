package com.xh.xiaoyiduo.admin.lygl.service.impl;

import com.xh.xiaoyiduo.admin.lygl.dao.B_GOOD_MESSAGE_ReplyMapper;
import com.xh.xiaoyiduo.admin.lygl.pojo.B_GOOD_MESSAGE_REPLY;
import com.xh.xiaoyiduo.admin.lygl.service.IMessageManageService;
import com.xh.xiaoyiduo.admin.lygl.service.IMessageReplyManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 留言回复Service
 */
@Service("replyService")
public class MessageReplyManageServiceImpl implements IMessageReplyManageService {

    @Autowired
    B_GOOD_MESSAGE_ReplyMapper replyMapper;

    @Override
    public int insert(B_GOOD_MESSAGE_REPLY reply) {
        return replyMapper.insert(reply);
    }
}
