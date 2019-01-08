package com.xh.xiaoyiduo.admin.spgl.dao;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 商品管理Mapper
 */

@Repository
public interface B_GOODMapper {
    int deleteByPrimaryKey(String goodId);

    int insert(B_GOOD good); //保存商品信息

    int insertSelective(B_GOOD record);

    B_GOOD selectByPrimaryKey(String goodId); //获取商品详情信息，测试一对多级联

    List<B_GOOD> getSonGoodList(@Param("sonId")String sonId, @Param("goodName")String goodName, @Param("currentPage")String currentPage, @Param("pageSize")String pageSize); //获取对应子类的商品列表

    List<B_GOOD> getUserReleaseAllGood(String userId); //获取用户发布的所有商品

    Integer getSonGoodCount(@Param("sonId")String sonId, @Param("goodName") String goodName); //获取子类商品个数

    B_GOOD getGoodDetailByGoodId(String goodId); //获取商品详情信息

    int updateByPrimaryKeySelective(B_GOOD record);

    int updateByPrimaryKey(B_GOOD record);

    int saveGoodImageUrls(@Param("resourceId")String resourceId, @Param("type")String type, @Param("imgUrl") String imgUrl, @Param("sonId")String sonId); //保存商品图片路径

}