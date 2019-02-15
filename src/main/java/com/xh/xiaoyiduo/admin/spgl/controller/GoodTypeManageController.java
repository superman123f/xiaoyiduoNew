package com.xh.xiaoyiduo.admin.spgl.controller;

import com.alibaba.fastjson.JSON;
import com.xh.xiaoyiduo.admin.gggl.pojo.NOTICE;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_SON;
import com.xh.xiaoyiduo.admin.spgl.service.IGoodTypeManageService;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * 商品类目管理Controller
 */
@Controller
@RequestMapping("/type")
public class GoodTypeManageController {

    @Autowired
    IGoodTypeManageService goodTypeManageService;

    @RequestMapping("/toGoodTypePage")
    public String toGoodTypePage(Model model){
        goodTypeManageService.getGoodFatherList(model);
        return "/admin/spgl/goodType";
    }

    /**
     * 获取所有商品父类
     * @return
     */
    @RequestMapping("/getGoodFatherList")
    @ResponseBody
    public String getGoodFatherList(Model model){
        String result = goodTypeManageService.getGoodFatherList(model);
        return result;
    }

    /**
     * 获取所有商品子类
     * @return
     */
    @RequestMapping("/getGoodSonList")
    @ResponseBody
    public String getGoodSonList(String fatherId){
        String result = goodTypeManageService.getGoodSonList(fatherId);
        return result;
    }

    /**
     * 新增、编辑父类
     * @param
     * @param
     * @param
     * @return
     */
    @RequestMapping("/updateGoodFatherType")
    @ResponseBody
    public Object updateGoodFatherType(B_GOOD_FATHER father){
        Map<String, Object> result = null;

        //新增父类，判断id是否存在
        if(father.getFatherId().equals("") || father.getFatherId() == null){
            result = goodTypeManageService.insertGoodFatherType(father);
        } else { //编辑父类
            result = goodTypeManageService.updateGoodFatherType(father);
        }
        return result;
    }

    /**
     * 新增、编辑子类
     * @param
     * @param
     * @param
     * @return
     */
    @RequestMapping("/updateGoodSonType")
    @ResponseBody
    public Object updateGoodSonType(B_GOOD_SON son){
        Map<String, Object> result = null;

        //新增父类，判断id是否存在
        if(son.getSonId().equals("") || son.getSonId() == null){
            result = goodTypeManageService.insertGoodSonType(son);
        } else { //编辑父类
            result = goodTypeManageService.updateGoodSonType(son);
        }
        return result;
    }

    /**
     * 加载父类新增页面
     * @return
     */
    @RequestMapping("/editGoodFatherType")
    public String editGoodFatherType(Model model, String fatherId){
        B_GOOD_FATHER father = null;
        if(fatherId != null) {
            father = goodTypeManageService.selectGoodFatherById(fatherId);
        }
        model.addAttribute("father", father);
        return "/admin/spgl/editGoodFatherType";
    }

    /**
     * 加载子类新增页面
     * @return
     */
    @RequestMapping("/editGoodSonType")
    public String editGoodSonType(Model model, String sonId, String fatherId){
        B_GOOD_SON son = null;
        if(sonId != null) {
            son = goodTypeManageService.selectGoodSonById(sonId);
            fatherId = son.getFatherId();
        }
        model.addAttribute("son", son);
        model.addAttribute("fatherId", fatherId);
        return "/admin/spgl/editGoodSonType";
    }

    /**
     * 单个删除父类
     * @param fatherId
     * @return
     */
    @RequestMapping("/deleteGoodFatherType")
    @ResponseBody
    public Map<String, Object> deleteGoodFatherType(String fatherId){
        Map<String, Object> result = null;
        result = goodTypeManageService.deleteGoodFatherById(fatherId);
        return result;
    }
    /**
     * 单个删除子类
     * @param sonId
     * @return
     */
    @RequestMapping("/deleteGoodSonType")
    @ResponseBody
    public Map<String, Object> deleteGoodSonType(String sonId){
        Map<String, Object> result = null;
        result = goodTypeManageService.deleteGoodSonById(sonId);
        return result;
    }

    /**
     * 批量删除父类
     * @param
     * @param
     * @return
     */
    @RequestMapping("/deleteGoodFatherTypes")
    @ResponseBody
    public Object deleteGoodFatherTypes(String fatherIds, HttpServletResponse response){
        Map<String,Object> result = new HashMap<>();
        if(fatherIds != null) {
            result = goodTypeManageService.deleteGoodFatherTypeByIds(fatherIds);
        }
        return result;
    }
    /**
     * 批量删除子类
     * @param
     * @param
     * @return
     */
    @RequestMapping("/deleteGoodSonTypes")
    @ResponseBody
    public Object deleteGoodSonTypes(String sonIds, HttpServletResponse response){
        Map<String,Object> result = new HashMap<>();
        if(sonIds != null) {
            result = goodTypeManageService.deleteGoodSonTypeByIds(sonIds);
        }
        return result;
    }
}
