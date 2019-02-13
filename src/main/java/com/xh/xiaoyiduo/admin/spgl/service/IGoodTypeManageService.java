package com.xh.xiaoyiduo.admin.spgl.service;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;

import java.util.List;
import java.util.Map;

/**
 */
public interface IGoodTypeManageService {

    String getGoodFatherList(); //获取商品父类列表

    B_GOOD_FATHER selectGoodFatherById(String fatherId); // 根据id获取商品父类信息

    Map<String, Object> insertGoodFatherType(B_GOOD_FATHER father); // 添加商品父类信息

    Map<String, Object> updateGoodFatherType(B_GOOD_FATHER father); // 添加商品父类信息

    Map<String, Object> deleteGoodFatherById(String fatherId); // 删除父类信息

    Map<String, Object> deleteGoodFatherTypeByIds(String fatherIds); // 批量删除父类
}
