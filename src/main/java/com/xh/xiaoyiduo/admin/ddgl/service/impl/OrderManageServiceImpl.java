package com.xh.xiaoyiduo.admin.ddgl.service.impl;

import com.xh.xiaoyiduo.admin.ddgl.dao.B_GOOD_ORDERMapper;
import com.xh.xiaoyiduo.admin.ddgl.dao.B_GOOD_ORDER_DetailMapper;
import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER;
import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER_DETAIL;
import com.xh.xiaoyiduo.admin.ddgl.service.IOrderManageService;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOODMapper;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

/**
 */
@Service("orderManageService")
public class OrderManageServiceImpl implements IOrderManageService {
    @Autowired
    B_GOOD_ORDERMapper orderMapper;
    @Autowired
    B_GOODMapper goodMapper;

    /**
     * 生成订单
     * @param goodId
     * @param goodNum
     * @param model
     * @return
     */
    @Override
    public Map<String, Object> createGoodOrder(String goodId, Integer goodNum, Model model) {
        Map<String, Object> result = new HashMap<>();

        S_USER currentUser = (S_USER)SecurityUtils.getSubject().getPrincipal();
        String userId = currentUser.getUserId();
        String orderId = UUID.randomUUID().toString().replaceAll("\\-","");

        B_GOOD good = goodMapper.selectByPrimaryKey(goodId); //获取商品信息

        Date date = new Date();

        B_GOOD_ORDER order = new B_GOOD_ORDER();
        order.setOrderId(orderId); //订单id
        order.setBuyerId(userId); //买家id
        order.setBuyerName(currentUser.getRealName()); //买家姓名
        order.setBuyerAddress(currentUser.getDormitoryAddress()); //收货地址
        order.setPhone(currentUser.getPhone()); //联系电话
        order.setEmail(currentUser.getEmail()); //电子邮箱
//        order.setOrderCreateTime(date); //订单创建时间
        order.setSinglePrice(good.getSecondPrice()); //商品单价
        order.setGoodNumber(goodNum); //商品数量
        order.setTotalPrice(good.getSecondPrice()*goodNum); //订单总价
        order.setOrderStatus("未付款"); //订单状态
        order.setDeliveryMethod("卖家配送"); //配送方式
        order.setOrderMessage("");
        order.setSellerId(good.getUserId()); //卖家id
        order.setGoodId(good.getGoodId());

//        int i = orderMapper.insert(order);
        if(order !=null){
            result.put("success", true);
            result.put("msg", "生成订单成功");
            result.put("orderId", orderId);
            System.out.println("生成订单成功");
            model.addAttribute("order", order);
        } else {
            result.put("success", false);
            result.put("msg", "生成订单失败");
            System.out.println("生成订单失败");
        }

        return result;
    }

    @Override
    public B_GOOD_ORDER showGoodOrdel(String orderId, Model model) {
        B_GOOD_ORDER order = orderMapper.selectByPrimaryKey(orderId);
        model.addAttribute("order", order);
        return order;
    }

    @Override
    public int saveGoodOrder(B_GOOD_ORDER order) {
        String orderId = UUID.randomUUID().toString().replaceAll("\\-", "");
        Date date = new Date();
        order.setOrderId(orderId);
        order.setOrderCreateTime(date);

        int i = orderMapper.insert(order);
        if(i > 0) {
            System.out.println("订单保存成功");
        } else {
            System.out.println("订单保存失败");
        }
        return 0;
    }

    @Override
    public List<B_GOOD_ORDER> showGoodOrderList() {
        orderMapper.selectAllOrder();
        return orderMapper.selectAllOrder();
    }

    @Override
    public int deleteOrderItemByOrderId(String orderId) {
        return orderMapper.deleteByPrimaryKey(orderId);
    }
}
