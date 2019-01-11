package com.xh.xiaoyiduo.admin.jpgl.controller;

import com.alibaba.fastjson.JSON;
import com.xh.xiaoyiduo.admin.jpgl.pojo.B_GOOD_BAN;
import com.xh.xiaoyiduo.admin.jpgl.service.IBanGoodManageService;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.utils.ShiroSHAUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/ban")
public class BanGoodManageController {

    @Autowired
    IBanGoodManageService banGoodManageService;

    @RequestMapping("/toBanManagePage")
    public String toBanManagePage(){
        return "/admin/jpgl/ban";
    }

    /**
     * 跳转到禁品详细信息页面
     * @return
     */
    @RequestMapping("/banGoodInfo")
    public String banGoodInfo(String banId, Model model){
        B_GOOD_BAN banGood = banGoodManageService.selectByPrimaryKey(banId);
        model.addAttribute("banGood", banGood);
        return "/admin/jpgl/banInfo";
    }

    @RequestMapping("/deleteBanGood")
    @ResponseBody
    public Map<String, Object> deleteBanGood(String banId){
        Map<String, Object> result = new HashMap<>();
        int i = banGoodManageService.deleteByPrimaryKey(banId);
        if(i > 0){
            result.put("success", true);
            result.put("msg", "删除禁品成功");
        } else {
            result.put("success", false);
            result.put("msg", "删除禁品失败");
        }

        return result;
    }
    /**
     * 编辑禁品信息
     * @param banId
     * @param banName
     * @param banGood
     * @return
     */
    @RequestMapping("/updateBanGoodInfo")
    @ResponseBody
    public Object updateBanGoodInfo(String banId, String banName, B_GOOD_BAN banGood){
        Map<String, Object> data = new HashMap<>();

        //新增用户，判断id是否存在
        if(banGood.getBanId().equals("") || banGood.getBanId() == null){

            String uuid = UUID.randomUUID().toString().replaceAll("\\-", "");
            banGood.setBanId(uuid);  //插入主键

            int i = banGoodManageService.insert(banGood); //添加禁品

            if(i > 0) {
                System.out.println("新增禁品成功");
                data.put("success", true);
                data.put("msg", "新增成功");
            } else {
                System.out.println("新增禁品失败");
                data.put("success", false);
                data.put("msg", "新增失败");
            }

        } else { //编辑禁品
            int i = banGoodManageService.updateBanGoodInfoByBanId(banId, banName);

            if(i > 0) {
                data.put("success", true);
                data.put("msg", "保存成功");
                System.out.println("编辑禁品成功");
            } else {
                data.put("success", false);
                data.put("msg", "保存失败");
                System.out.println("编辑禁品失败");
            }
        }
        return data;
    }

    @RequestMapping("/getAllBanGoods")
    @ResponseBody
    public String getAllBanGoods(String limit, String page, String banName){
        Integer count = banGoodManageService.getBanGoodCount(banName); // 获取禁品的总数量
        List<B_GOOD_BAN> banGoodList = null;
        if (count == null){
            count = 0;
        }
        banGoodList = banGoodManageService.getAllBanGoods(limit, page, banName); //获取所有禁品的信息
        String banGoodListJson = JSON.toJSONString(banGoodList); //将对象转换为json
        String json = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + banGoodListJson + "}";
        return json;
    }
}
