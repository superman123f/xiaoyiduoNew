package com.xh.xiaoyiduo.admin.lygl.dao;

import com.xh.xiaoyiduo.admin.lygl.pojo.B_GOOD_MESSAGE;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("messageMapper")
public interface B_GOOD_MESSAGEMapper {
    int deleteByPrimaryKey(String messageId);

    int insert(B_GOOD_MESSAGE messsage); // 添加留言信息

    int insertSelective(B_GOOD_MESSAGE record);

    B_GOOD_MESSAGE selectByPrimaryKey(String messageId);

    int getMessageCount(String goodId); // 获取该商品留言总数

    List<B_GOOD_MESSAGE> selectAllMessageAndReply(@Param("goodId")String goodId); // 查询所有留言和对应回复

    int updateByPrimaryKeySelective(B_GOOD_MESSAGE record);

    int updateByPrimaryKey(B_GOOD_MESSAGE record);
}