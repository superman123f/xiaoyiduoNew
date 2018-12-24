package com.xh.xiaoyiduo.admin.spgl.dao;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("fatherMapper")
public interface B_GOOD_FatherMapper {

    public List<B_GOOD_FATHER> getGoodTypeList(); //获取商品类目列表 父类跟子类

    int deleteByPrimaryKey(String fatherId);

    int insert(B_GOOD_FATHER record);

    int insertSelective(B_GOOD_FATHER record);

    B_GOOD_FATHER selectByPrimaryKey(String fatherId);

    int updateByPrimaryKeySelective(B_GOOD_FATHER record);

    int updateByPrimaryKey(B_GOOD_FATHER record);

}