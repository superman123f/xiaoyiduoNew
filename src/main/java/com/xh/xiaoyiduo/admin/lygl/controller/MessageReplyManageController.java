package com.xh.xiaoyiduo.admin.lygl.controller;

import com.xh.xiaoyiduo.admin.lygl.pojo.B_GOOD_MESSAGE_REPLY;
import com.xh.xiaoyiduo.admin.lygl.service.IMessageReplyManageService;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 回复留言表Controller
 */
@RequestMapping("/reply")
@Controller
public class MessageReplyManageController {

    @Autowired
    IMessageReplyManageService replyService;

    @RequestMapping("/toLayEdit")
    public String toLayEdit(String messageId, Model model){
        model.addAttribute("messageId", messageId);
        return "/admin/lygl/layedit";
    }

    /**
     * 回复留言
     * @param replyMessage
     * @return
     */
    @RequestMapping("/insertReplyMessage")
    @ResponseBody
    public Map<String, Object> insertReplyMessage(B_GOOD_MESSAGE_REPLY replyMessage){
        Map<String, Object> result = new HashMap<>();

        S_USER currentUser = (S_USER) SecurityUtils.getSubject().getPrincipal();
        if(currentUser != null){
            String replyId = UUID.randomUUID().toString().replaceAll("\\-", "");
            String userId = currentUser.getUserId();
            Date replyTime = new Date();

            replyMessage.setReplyId(replyId);
            replyMessage.setReplyTime(replyTime);
            replyMessage.setUserId(userId);

            int i = replyService.insert(replyMessage); // 添加留言信息
//            int messageCount = replyService.getMessageCount(message.getGoodId());
            if(i > 0){
                result.put("success", true);
//                result.put("messageCount", messageCount);
                result.put("msg", "回复留言成功");
            } else {
                result.put("msg", "回复留言失败");
            }
        } else {
            result.put("msg", "该用户未登录");
        }

        return result;
    }
}
