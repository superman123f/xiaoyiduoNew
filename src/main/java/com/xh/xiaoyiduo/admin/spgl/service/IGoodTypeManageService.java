package com.xh.xiaoyiduo.admin.spgl.service;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_SON;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

/**
 */
public interface IGoodTypeManageService {

    String getGoodFatherList(Model model); //获取商品父类列表

    String getGoodSonList(String fatherId); //获取商品子类列表

    B_GOOD_FATHER selectGoodFatherById(String fatherId); // 根据id获取商品父类信息

    B_GOOD_SON selectGoodSonById(String sonId); // 根据id获取商品子类信息

    Map<String, Object> insertGoodFatherType(B_GOOD_FATHER father); // 新增商品父类信息

    Map<String, Object> updateGoodFatherType(B_GOOD_FATHER father); // 编辑商品父类信息

    Map<String, Object> insertGoodSonType(B_GOOD_SON son); // 新增商品子类信息

    Map<String, Object> updateGoodSonType(B_GOOD_SON son); // 编辑商品子类信息

    Map<String, Object> deleteGoodFatherById(String fatherId); // 删除父类信息

    Map<String, Object> deleteGoodSonById(String sonId); // 删除子类信息

    Map<String, Object> deleteGoodFatherTypeByIds(String fatherIds); // 批量删除父类

    Map<String, Object> deleteGoodSonTypeByIds(String sonIds); // 批量删除子类
}
