package com.xh.xiaoyiduo.admin.lygl.controller;

import com.xh.xiaoyiduo.admin.lygl.pojo.B_GOOD_MESSAGE;
import com.xh.xiaoyiduo.admin.lygl.service.IMessageManageService;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.apache.shiro.SecurityUtils;
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

    @RequestMapping("/toLayEdit")
    public String toLayEdit(){
        return "/admin/lygl/layedit";
    }

    /**
     * 添加留言信息
     * @param message
     * @return
     */
    @RequestMapping("/insertMessage")
    @ResponseBody
    public Map<String, Object> insertMessage(B_GOOD_MESSAGE message){
        Map<String, Object> result = new HashMap<>();

        S_USER currentUser = (S_USER) SecurityUtils.getSubject().getPrincipal();
        if(currentUser != null){
            String messageId = UUID.randomUUID().toString().replaceAll("\\-", "");
            String userId = currentUser.getUserId();
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
        } else {
            result.put("msg", "该用户未登录");
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
