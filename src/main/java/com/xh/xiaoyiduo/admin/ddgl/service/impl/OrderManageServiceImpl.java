package com.xh.xiaoyiduo.admin.ddgl.service.impl;

import com.xh.xiaoyiduo.admin.ddgl.dao.B_GOOD_ORDERMapper;
import com.xh.xiaoyiduo.admin.ddgl.dao.B_GOOD_ORDER_DetailMapper;
import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER;
import com.xh.xiaoyiduo.admin.ddgl.pojo.B_GOOD_ORDER_DETAIL;
import com.xh.xiaoyiduo.admin.ddgl.service.IOrderManageService;
import com.xh.xiaoyiduo.admin.gwcgl.dao.B_GOOD_CartMapper;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOODMapper;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import com.xh.xiaoyiduo.shop.dao.S_USERMapper;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 */
@Service("orderManageService")
public class OrderManageServiceImpl implements IOrderManageService {
    @Autowired
    B_GOOD_ORDERMapper orderMapper;
    @Autowired
    B_GOODMapper goodMapper;
    @Autowired
    B_GOOD_CartMapper cartMapper;
    @Autowired
    S_USERMapper userMapper;

    /**
     * 生成订单（未保存）
     * @param goodIds
     * @param goodNums
     * @param model
     * @return
     */
    @Override
    public Map<String, Object> createGoodOrder(String goodIds, String goodNums, Model model) {
        Map<String, Object> result = new HashMap<>();

        String[] goodId = goodIds.split(",");
        String[] goodNum1 = goodNums.split(",");
        List<Integer> goodNum = new ArrayList<>();
        for(int i = 0; i < goodNum1.length; i++) {
            goodNum.add(Integer.parseInt(goodNum1[i]));
        }

        S_USER currentUser = (S_USER)SecurityUtils.getSubject().getPrincipal();
        S_USER user = new S_USER();
        List<B_GOOD_ORDER> orderList = new ArrayList<>();
        Double bigPrice = 0D;
        if(ObjectUtils.isEmpty(currentUser)){

        }else{
            String userId = currentUser.getUserId();
            user = userMapper.selectByUserId(userId);

            for(int i = 0; i < goodId.length; i++) {
                B_GOOD good  = goodMapper.selectByPrimaryKey(goodId[i]); //获取商品信息
                if(ObjectUtils.isEmpty(good)){
                } else {
                    Date date = new Date();
                    String orderId = UUID.randomUUID().toString().replaceAll("\\-","");
                    B_GOOD_ORDER order = new B_GOOD_ORDER();
                    bigPrice += good.getSecondPrice()*goodNum.get(i);
                    order.setOrderId(orderId); //订单id
                    order.setBuyerId(userId); //买家id
                    order.setGood(good); //商品信息
                    order.setBuyerName(currentUser.getRealName()); //买家姓名
                    order.setBuyerAddress(currentUser.getDormitoryAddress()); //收货地址
                    order.setPhone(currentUser.getPhone()); //联系电话
                    order.setEmail(currentUser.getEmail()); //电子邮箱
//        order.setOrderCreateTime(date); //订单创建时间
                    order.setSinglePrice(good.getSecondPrice()); //商品单价
                    order.setGoodNumber(goodNum.get(i)); //商品数量
                    order.setTotalPrice(good.getSecondPrice()*goodNum.get(i)); //订单总价
                    order.setOrderStatus("未付款"); //订单状态
                    order.setDeliveryMethod("卖家配送"); //配送方式
                    order.setOrderMessage("");
                    order.setSellerId(good.getUserId()); //卖家id
                    order.setGoodId(good.getGoodId());

                    orderList.add(order);
                }
            }
        }



//        int i = orderMapper.insert(order);
        if(orderList !=null){
            result.put("success", true);
            result.put("msg", "生成订单成功");
//            result.put("orderId", orderId);
            model.addAttribute("user", user);
            model.addAttribute("orderList", orderList);
            model.addAttribute("bigPrice", bigPrice);
        } else {
            result.put("success", false);
            result.put("msg", "生成订单失败");
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
    public int saveGoodOrder(List<B_GOOD_ORDER> orderList, String cartIds, String source, Model model, HttpServletRequest request) {
        S_USER currentUser = (S_USER) SecurityUtils.getSubject().getPrincipal();
        S_USER user = null;
        HttpSession session = request.getSession();
        String orderIds = ""; //保存所有订单id
        Date date = new Date();
        Double bigPrice = 0D; //订单总价
        Double smallPrice; //小计
        int count = 0; //保存个数
        if(currentUser != null) {
            String userId = currentUser.getUserId();
            user = userMapper.selectByUserId(userId);

            String[] carId = cartIds.split(",");
            int carIndex = 0;

            for(B_GOOD_ORDER order: orderList) {
                B_GOOD _good = goodMapper.selectByPrimaryKey(order.getGoodId());
                if(_good != null && !_good.equals("")) {
                    orderIds += order.getOrderId() + ",";
                    smallPrice = _good.getSecondPrice() * order.getGoodNumber(); //小计
                    bigPrice += smallPrice;

                    order.setBuyerId(userId);
                    order.setSellerId(_good.getUserId());
                    order.setOrderCreateTime(date);
                    order.setDeliveryMethod("卖家配送");
                    order.setSinglePrice(_good.getSecondPrice());
                    order.setTotalPrice(smallPrice);
                    order.setOrderStatus("未付款");

                    //保存订单
                    int i = orderMapper.insert(order);
                    if(i > 0) {
                        if(!carId[carIndex].equals("")) {
                            cartMapper.deleteByPrimaryKey(carId[carIndex]); //删除购物项
                        }

                        //减少商品数量
                        count++;
                    }
                }
                carIndex++;
            }
        }

        if(count > 0) {
            System.out.println("成功保存" + count + "个订单");
            int cartGoodCount;
            if(source.equals("buynow")) {
                cartGoodCount = (int)session.getAttribute("cartGoodCount"); //立即购买则为原数量
            } else {
                cartGoodCount = (int)session.getAttribute("cartGoodCount") - count; //减少购物车数量
            }
            session.setAttribute("cartGoodCount", cartGoodCount);
            model.addAttribute("bigPrice", bigPrice);
            model.addAttribute("orderIds", orderIds);
            model.addAttribute("user", user);
        }

        return 0;
    }

    @Override
    public List<B_GOOD_ORDER> showGoodOrderList(String buyerId) {
        return orderMapper.selectAllOrder(buyerId);
    }

    @Override
    public int deleteOrderItemByOrderId(String orderId) {
        return orderMapper.deleteByPrimaryKey(orderId);
    }

//    @Override
//    public List<B_GOOD_ORDER> selectAllOrderBackend(String sellerId) {
//        return orderMapper.selectAllOrderBackend(sellerId);
//    }


    @Override
    public int getOrderCount(String sellerId,String orderId, String buyerName,String orderStatus) {
        return orderMapper.getOrderCount(sellerId,orderId,buyerName,orderStatus);
    }

    @Override
    public List<B_GOOD_ORDER> getAllOrdersBackend(String sellerId, String orderId, String buyerName,String orderStatus,String currentPage, String pageSize) {
        return orderMapper.getAllOrdersBackend(sellerId,orderId,buyerName,orderStatus,currentPage, pageSize);
    }

    @Override
    public int deleteOrderByOrderId(String orderId) {
        return orderMapper.deleteByPrimaryKey(orderId);
    }

    @Override
    public B_GOOD_ORDER showBackGoodOrdel(String orderId) {
        return orderMapper.showBackGoodOrdel(orderId);
    }

    @Override
    public int saveBackOrderDetail(B_GOOD_ORDER order) {
        return orderMapper.updateByPrimaryKeySelective(order);
    }

    @Override
    public int updateUserInfoByUserId(S_USER user) {
        return userMapper.updateUserInfoByUserId(user);
    }
}
