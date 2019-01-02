package com.xh.xiaoyiduo.admin.spgl.dao;

import com.xh.xiaoyiduo.admin.spgl.pojo.RESOURCES;

public interface ResourcesMapper {
    int deleteByPrimaryKey(String resourceId);

    int insert(RESOURCES record);

    int insertSelective(RESOURCES record);

    RESOURCES selectByPrimaryKey(String resourceId);

    int updateByPrimaryKeySelective(RESOURCES record);

    int updateByPrimaryKey(RESOURCES record);
}