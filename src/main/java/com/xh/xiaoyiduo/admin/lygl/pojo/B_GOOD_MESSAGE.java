package com.xh.xiaoyiduo.admin.lygl.pojo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class B_GOOD_MESSAGE {
    private String messageId;

    private String goodId;

    private String userId;

    private String messageContent;

    @DateTimeFormat(pattern="yyyy-MM-dd HH24:mi:ss")//页面写入数据库时格式化
//    @JSONField(format="yyyy-MM-dd HH:mm:ss")//数据库导出页面时json格式化
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date messageTime;

    private String userImgUrl; // 用户头像

    private String nickname; // 用户昵称

    private List<B_GOOD_MESSAGE_REPLY> replyList; // 回复信息

    public String getMessageId() {
        return messageId;
    }

    public void setMessageId(String messageId) {
        this.messageId = messageId == null ? null : messageId.trim();
    }

    public String getGoodId() {
        return goodId;
    }

    public void setGoodId(String goodId) {
        this.goodId = goodId == null ? null : goodId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent == null ? null : messageContent.trim();
    }

    public Date getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(Date messageTime) {
        this.messageTime = messageTime;
    }

    public String getUserImgUrl() {
        return userImgUrl;
    }

    public void setUserImgUrl(String userImgUrl) {
        this.userImgUrl = userImgUrl;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public List<B_GOOD_MESSAGE_REPLY> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<B_GOOD_MESSAGE_REPLY> replyList) {
        this.replyList = replyList;
    }
}