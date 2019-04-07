package com.xh.xiaoyiduo.admin.spgl.dao;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * 商品管理Mapper
 */

@Repository
public interface B_GOODMapper {
    int deleteByPrimaryKey(String goodId);

    int insert(B_GOOD good); //保存商品信息

    int insertSelective(B_GOOD record);

    B_GOOD selectByPrimaryKey(String goodId); //获取商品详情信息，测试一对多级联

    List<B_GOOD> getSonGoodList(@Param("sonId")String sonId, @Param("goodName")String goodName, @Param("time")String time, @Param("price")String price, @Param("degree")String degree, @Param("collect")String collect, @Param("currentPage")String currentPage, @Param("pageSize")String pageSize); //获取对应子类的商品列表

    List<B_GOOD> getUserReleaseAllGood(String userId); //获取用户发布的所有商品

    Integer getSonGoodCount(@Param("sonId")String sonId, @Param("goodName") String goodName, @Param("time")String time, @Param("price")String price, @Param("degree")String degree, @Param("collect")String collect); //获取子类商品个数

    B_GOOD getGoodDetailByGoodId(String goodId); //获取商品详情信息

    int updateByPrimaryKeySelective(B_GOOD record);

    int updateByPrimaryKey(B_GOOD record);

    int updateGoodStock(@Param("goodId")String goodId, @Param("goodNumber")BigDecimal goodNumber);

    int saveGoodImageUrls(@Param("resourceId")String resourceId, @Param("type")String type, @Param("imgUrl") String imgUrl, @Param("sonId")String sonId); //保存商品图片路径

    List<Map<String, String>> getGoodTypeReport(@Param("isAdmin")boolean isAdmin, @Param("userId")String userId);// 种类商品数量统计报表

    int getGoodCount(@Param("goodName")String goodName, @Param("nickname")String nickname, @Param("realName")String realName, @Param("userId")String userId); //获取商品总数

    List<B_GOOD> getAllGoods(@Param("pageSize")String pageSize, @Param("currentPage")String currentPage, @Param("goodName")String goodName, @Param("nickname")String nickname, @Param("realName")String realName, @Param("userId")String userId);  //获取所有商品

    int deleteGoodByGoodId(String goodId);
}