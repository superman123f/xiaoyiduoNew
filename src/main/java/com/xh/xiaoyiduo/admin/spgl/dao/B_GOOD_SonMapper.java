package com.xh.xiaoyiduo.admin.spgl.dao;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_SON;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("SonMapper")
public interface B_GOOD_SonMapper {

    List<B_GOOD_SON> selectGoodSonsByFatherId(String fatherId); //通过父类ID查询子类目

    int deleteByPrimaryKey(String sonId);

    int insert(B_GOOD_SON record);

    int insertSelective(B_GOOD_SON record);

    B_GOOD_SON selectByPrimaryKey(String sonId);

    int updateByPrimaryKeySelective(B_GOOD_SON record);

    int updateByPrimaryKey(B_GOOD_SON record);
}