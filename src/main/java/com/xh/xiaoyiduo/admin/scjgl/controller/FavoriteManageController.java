package com.xh.xiaoyiduo.admin.scjgl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 */
@Controller
@RequestMapping("/favorite")
public class FavoriteManageController {

    @RequestMapping("/toFavoritePage")
    public String toFavoritePage(){
        return "/shop/favoriteFolder";
    }
}
