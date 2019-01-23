package com.xh.xiaoyiduo.admin.lygl.service;

import com.xh.xiaoyiduo.admin.lygl.pojo.B_GOOD_MESSAGE;

import java.util.List;

/**
 */
public interface IMessageManageService {
    int insert(B_GOOD_MESSAGE message); // 添加留言信息

    int getMessageCount(String goodId); // 获取该商品留言总数

    List<B_GOOD_MESSAGE> selectAllMessageAndReply(String goodId, Integer currentPage, Integer pageSize); // 查询所有留言信息和对应的回复
}
