package com.xh.xiaoyiduo.admin.spgl.dao;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 商品管理Mapper
 */

@Repository
public interface B_GOODMapper {
    int deleteByPrimaryKey(String goodId);

    int insert(B_GOOD record);

    int insertSelective(B_GOOD record);

    B_GOOD selectByPrimaryKey(String goodId);

    List<B_GOOD> getSonGoodList(String sonId); //获取对应子类的商品列表

    int updateByPrimaryKeySelective(B_GOOD record);

    int updateByPrimaryKey(B_GOOD record);
}