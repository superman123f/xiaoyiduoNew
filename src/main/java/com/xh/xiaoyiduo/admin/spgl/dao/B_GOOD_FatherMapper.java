package com.xh.xiaoyiduo.admin.spgl.dao;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("fatherMapper")
public interface B_GOOD_FatherMapper {

    List<B_GOOD_FATHER> getGoodTypeList(); //获取商品类目列表 父类跟子类

    List<B_GOOD_FATHER> getGoodFatherList(); //获取商品父类列表

    int getGoodFatherCount(); // 获取商品父类个数

    B_GOOD_FATHER selectByPrimaryKey(String fatherId); // 根据id获取商品父类信息

    int deleteByPrimaryKey(String fatherId); // 删除父类信息

    int insert(B_GOOD_FATHER father); // 添加商品父类信息

    int insertSelective(B_GOOD_FATHER record);

    int updateByPrimaryKeySelective(B_GOOD_FATHER record);

    int updateByPrimaryKey(B_GOOD_FATHER father); // 根据id编辑父类

}