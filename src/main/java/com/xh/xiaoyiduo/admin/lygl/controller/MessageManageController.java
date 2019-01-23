package com.xh.xiaoyiduo.admin.lygl.controller;

import com.xh.xiaoyiduo.admin.lygl.pojo.B_GOOD_MESSAGE;
import com.xh.xiaoyiduo.admin.lygl.service.IMessageManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 */
@RequestMapping("/message")
@Controller
public class MessageManageController {
    @Autowired
    IMessageManageService messageManageService;

    /**
     * 添加留言信息
     * @param message
     * @return
     */
    @RequestMapping("/insertMessage")
    @ResponseBody
    public Map<String, Object> insertMessage(B_GOOD_MESSAGE message){
        Map<String, Object> result = new HashMap<>();

        String messageId = UUID.randomUUID().toString().replaceAll("\\-", "");
        String userId = "201811";
        Date messageTime = new Date();

        message.setMessageId(messageId);
        message.setUserId(userId);
        message.setMessageTime(messageTime);

        int i = messageManageService.insert(message); // 添加留言信息
        int messageCount = messageManageService.getMessageCount(message.getGoodId());
        if(i > 0){
            result.put("success", true);
            result.put("messageCount", messageCount);
            result.put("msg", "添加留言信息成功");
        } else {
            result.put("msg", "添加留言信息失败");
        }

        return result;
    }

    /**
     * 查询所有留言信息和对应的回复
     * @param
     * @return
     */
    @RequestMapping("/getAllMessageAndReply")
    @ResponseBody
    public List<B_GOOD_MESSAGE> getAllMessageAndReply(String goodId, @RequestParam("curr")Integer currentPage, @RequestParam("limit")Integer pageSize) {
        return messageManageService.selectAllMessageAndReply(goodId, currentPage, pageSize);
    }

}
