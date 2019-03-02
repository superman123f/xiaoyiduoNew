package com.xh.xiaoyiduo.admin.spgl.service;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_SON;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 商品管理Service
 */
public interface IGoodManageService {

    int insert(B_GOOD good); //保存商品信息

    List<B_GOOD_FATHER> getGoodTypeList(); //获取商品菜单列表 父类跟子类

    List<B_GOOD_FATHER> getGoodFatherList(); //获取商品父类列表

    List<B_GOOD_SON> selectGoodSonsByFatherId(String fatherId); //通过父类ID查询子类目

    List<B_GOOD> getSonGoodList(String sonId, String goodName, String time, String price, String degree, String collect, String currentPage, String pageSize); //获取对应子类商品列表

    Integer getSonGoodCount(String sonId, String goodName, String time, String price, String degree, String collect); //获取子类商品个数

    B_GOOD getGoodDetailByGoodId(String goodId); //获取商品详情信息

    List<B_GOOD> getUserReleaseAllGood(String userId); //获取用户发布的所有商品

    int saveGoodImageUrls(String resourceId, String type, String imgUrl, String sonId); //保存商品图片路径

    void getGoodTypeReport(Model model);// 种类商品数量统计报表
}
