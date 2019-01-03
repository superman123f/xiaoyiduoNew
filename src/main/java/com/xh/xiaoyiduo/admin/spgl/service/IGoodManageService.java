package com.xh.xiaoyiduo.admin.spgl.service;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;

import java.util.List;
import java.util.Set;

/**
 * 商品管理Service
 */
public interface IGoodManageService {

    int insert(B_GOOD good); //保存商品信息

    List<B_GOOD_FATHER> getGoodTypeList(); //获取商品菜单列表 父类跟子类

    List<B_GOOD> getSonGoodList(String sonId); //获取对应子类商品列表

    B_GOOD getGoodDetailByGoodId(String goodId); //获取商品详情信息

    int saveGoodImageUrls(String resourceId, String type, String imgUrl, String sonId); //保存商品图片路径
}
