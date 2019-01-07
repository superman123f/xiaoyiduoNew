package com.xh.xiaoyiduo.admin.scjgl.controller;

import com.xh.xiaoyiduo.admin.scjgl.pojo.B_GOOD_FAVORITE_FOLDER;
import com.xh.xiaoyiduo.admin.scjgl.service.IFavoriteManageService;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 */
@Controller
@RequestMapping("/favorite")
public class FavoriteManageController {

    @Autowired
    IFavoriteManageService favoriteManageService;

    @RequestMapping("/toFavoritePage")
    public String toFavoritePage(){
        return "/shop/favoriteFolder";
    }

    @RequestMapping("/addToFavorite")
    @ResponseBody
    public Map<String, Object> addToFavorite(String goodId, Boolean star){
        Map<String, Object> result = new HashMap<>();
        S_USER user = (S_USER)SecurityUtils.getSubject().getPrincipal();

        if(user == null){
            result.put("isLogin", false);
        } else
            if(star) {
                //获取当前用户ID
                String currentUserId = user.getUserId();
                //生成收藏夹ID
                String folderId = UUID.randomUUID().toString().replaceAll("\\-", "");
                //收藏商品
                B_GOOD_FAVORITE_FOLDER folder = new B_GOOD_FAVORITE_FOLDER();
                folder.setFolderId(folderId);
                folder.setUserId(currentUserId);
                folder.setGoodId(goodId);

                int i = favoriteManageService.insert(folder);
                if(i > 0) {
                    result.put("success", true);
                    result.put("msg", "收藏成功");
                } else {
                    result.put("success", false);
                    result.put("msg", "收藏失败");
                }
            } else {
                favoriteManageService.deleteByPrimaryKey(goodId);
                result.put("success", false);
                result.put("msg", "取消收藏失败");
            }

        return result;
    }
}
