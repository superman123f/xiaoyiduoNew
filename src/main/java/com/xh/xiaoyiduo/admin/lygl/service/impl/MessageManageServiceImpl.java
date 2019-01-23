package com.xh.xiaoyiduo.admin.lygl.service.impl;

import com.github.pagehelper.PageHelper;
import com.xh.xiaoyiduo.admin.lygl.dao.B_GOOD_MESSAGEMapper;
import com.xh.xiaoyiduo.admin.lygl.pojo.B_GOOD_MESSAGE;
import com.xh.xiaoyiduo.admin.lygl.service.IMessageManageService;
import com.xh.xiaoyiduo.admin.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 */
@Service("messageManageService")
public class MessageManageServiceImpl implements IMessageManageService {

    @Autowired
    B_GOOD_MESSAGEMapper messageMapper;

    @Override
    public int insert(B_GOOD_MESSAGE message) {
        return messageMapper.insert(message);
    }

    @Override
    public int getMessageCount(String goodId) {
        return messageMapper.getMessageCount(goodId);
    }

    /**
     * 分页查询某个商品的所有留言及回复
     * @param goodId
     * @return
     */
    @Override
    public List<B_GOOD_MESSAGE> selectAllMessageAndReply(String goodId, Integer currentPage, Integer pageSize) {
        //设置分页信息，分别是当前页数和每页显示的总记录数【记住：必须在mapper接口中的方法执行之前设置该分页信息】
        PageHelper.startPage(currentPage, pageSize);

        List<B_GOOD_MESSAGE> allMessages = messageMapper.selectAllMessageAndReply(goodId); // 获取该商品所有留言和回复
        int countNums = messageMapper.getMessageCount(goodId); // 该商品留言总数

        PageBean<B_GOOD_MESSAGE> pageData = new PageBean<>(currentPage, pageSize, countNums);
        pageData.setItems(allMessages);

        return pageData.getItems(); // 返回分页结果
    }
}
