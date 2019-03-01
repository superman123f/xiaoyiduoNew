package com.xh.xiaoyiduo.admin.scjgl.controller;

import com.xh.xiaoyiduo.admin.scjgl.pojo.B_GOOD_FAVORITE_FOLDER;
import com.xh.xiaoyiduo.admin.scjgl.service.IFavoriteManageService;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 */
@Controller
@RequestMapping("/favorite")
public class FavoriteManageController {

    /**
     * 转到收藏夹页面
     */
    @Autowired
    IFavoriteManageService favoriteManageService;

    @RequestMapping("/toFavoritePage")
    public String toFavoritePage(Model model){
        S_USER user = (S_USER)SecurityUtils.getSubject().getPrincipal();
        //获取当前用户ID
        if(user != null) {
            String userId = user.getUserId();
            List<B_GOOD_FAVORITE_FOLDER> folderList = favoriteManageService.getFavoriteFolderByUserId(userId);
            model.addAttribute("folderList", folderList);
        }

        return "/shop/favoriteFolder";
    }

    /**
     * 添加商品到收藏夹
     * @param goodId
     * @param star
     * @return
     */
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

    /**
     * 删除收藏夹
     * @return
     */
    @RequestMapping("/deleteFolderItemByFolderId")
    @ResponseBody
    public Map<String, Object> deleteFolderItemByFolderId(String folderId, Model model) {
        Map<String, Object> result = new HashMap<>();
        int i = favoriteManageService.deleteFolderItemByFolderId(folderId);
        if(i > 0) {
            result.put("success", true);
            System.out.println("删除收藏夹成功");
        } else {
            System.out.println("删除收藏夹失败");
        }
        return result;
    }

    /**
     * 批量删除收藏夹
     * @return
     */
    @RequestMapping("/deleteFolderItemByFolderIds")
    @ResponseBody
    public Map<String, Object> deleteFolderItemByFolderIds(String folderIds) {
        Map<String, Object> result = new HashMap<>();
        String[] folders = folderIds.split(",");
        int sum = 0;
        int temp = 0;
        for(int i = 0; i < folders.length; i++) {
            temp = favoriteManageService.deleteFolderItemByFolderId(folders[i]);
            if(temp > 0) {
                sum++;
            }
        }

        if(sum > 0) {
            result.put("success", true);
            result.put("msg", "成功取消" + sum + "个收藏夹");
            System.out.println("批量删除收藏夹成功 ");
        } else {
            System.out.println("批量删除收藏夹失败 ");
        }
        return result;
    }

}
