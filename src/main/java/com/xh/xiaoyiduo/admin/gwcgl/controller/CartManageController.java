package com.xh.xiaoyiduo.admin.gwcgl.controller;

import com.xh.xiaoyiduo.admin.gwcgl.pojo.B_GOOD_CART;
import com.xh.xiaoyiduo.admin.gwcgl.service.ICartManageService;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 购物车
 */
@Controller
@RequestMapping("/cart")
public class CartManageController {

    @Autowired
    ICartManageService cartManageService;
    // cart_id: 通过uuid生成
    // buyer_id:, 后台获取当前用户id
//    good_name: ${goodDetail.goodName},
//    single_price: ${goodDetail.secondPrice},
//    good_number: cur,
//    good_id: ${goodDetail.goodId},
    /**
     * 加入购物车
     * */
    @RequestMapping("/addGoodToCart")
    @ResponseBody
    public Object addGoodToCart(@RequestParam(value = "good_name", required = false)String goodName,
                             @RequestParam(value = "single_price", required = false)Double singlePrice,
                             @RequestParam(value = "good_number", required = false)Integer goodNumber,
                             @RequestParam(value = "good_id", required = false) String goodId, HttpServletRequest request){
        Map<String, Object> result = new HashMap<>();
        S_USER user = (S_USER)SecurityUtils.getSubject().getPrincipal();
        if(user != null){
            result.put("isLogin", true);
            String currentUserId = user.getUserId(); //当前登录用户id
            String cartId = UUID.randomUUID().toString().replaceAll("\\-", ""); //购物车id
            B_GOOD_CART cart = new B_GOOD_CART();
            cart.setCartId(cartId);
            cart.setUserId(currentUserId);
            cart.setGoodName(goodName);
            cart.setSinglePrice(singlePrice);
            cart.setGoodNumber(goodNumber);
            cart.setGoodId(goodId);

            HttpSession session = request.getSession();
            int i = cartManageService.insert(cart);
            if(i > 0){
                int count = cartManageService.queryCartGoodCountsByUserId(currentUserId);
                session.setAttribute("cartGoodCount", count);
                System.out.println("添加购物车成功");
                result.put("success", true);
                result.put("msg", "添加购物车成功");
                result.put("cartGoodCount", count);
            } else {
                System.out.println("添加购物车失败");
                result.put("success", false);
                result.put("msg", "添加购物车失败");
            }
        } else {
            result.put("isLogin", false);
        }

        return result;
    }


    @RequestMapping("/seeCartList")
    public String seeCartList(Model model){
        S_USER user = (S_USER) SecurityUtils.getSubject().getPrincipal();
        if(user != null) {
            String currentUserId = user.getUserId();
            List<B_GOOD_CART> cartList = cartManageService.getCurrentUserCartInfos(currentUserId);
            model.addAttribute("cartList", cartList);
        }
        return "/shop/shopcart";
    }

    /**
     * 删除单个购物项
     * @param cartId
     * @param model
     * @return
     */
    @RequestMapping("/deleteCartItemByCartId")
    @ResponseBody
    public Map<String, Object> deleteCartItemByCartId(String cartId, Model model, HttpServletRequest request){
        int i = cartManageService.deleteCartItemByCartId(cartId);
        Map<String, Object> result = new HashMap<>();

        HttpSession session = request.getSession();
        int count = (int)session.getAttribute("cartGoodCount");

        if(i > 0){
            session.setAttribute("cartGoodCount", count - i);
            result.put("success", true);
            result.put("msg", "购物项删除成功");
            result.put("cartGoodCount", count - i);
        } else {
            result.put("success", false);
            result.put("msg", "购物项删除失败");
        }
        return result;
    }

    /**
     * 批量删除购物项
     * @param cartIds
     * @param model
     * @return
     */
    @RequestMapping("/deleteCartItemByCartIds")
    @ResponseBody
    public Map<String, Object> deleteCartItemByCartIds(String cartIds, Model model, HttpServletRequest request){
        String[] cartIdList = cartIds.trim().split(",");
        int count = 0; //统计成功删除个数
        for(int i = 0; i < cartIdList.length; i++){
            cartManageService.deleteCartItemByCartId(cartIdList[i]);
            count ++;
        }

        //更新购物车中商品数目
        HttpSession session = request.getSession();
        session.setAttribute("cartGoodCount", cartIdList.length - count);

        Map<String, Object> result = new HashMap<>();
        if(count > 0){
            result.put("success", true);
            result.put("msg", "成功删除" + count + "个");
            result.put("cartGoodCount", cartIdList.length - count);
        } else {
            result.put("success", false);
            result.put("msg", "删除失败");
        }
        return result;
    }

}
