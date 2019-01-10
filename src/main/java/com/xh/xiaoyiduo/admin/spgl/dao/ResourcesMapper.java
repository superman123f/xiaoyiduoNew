package com.xh.xiaoyiduo.admin.spgl.dao;

import com.xh.xiaoyiduo.admin.spgl.pojo.RESOURCES;
import org.springframework.stereotype.Repository;

@Repository("resourcesMapper")
public interface ResourcesMapper {
    int deleteByPrimaryKey(String userId); // 删除用户头像资源文件

    int insert(RESOURCES record);

    int insertSelective(RESOURCES record);

    RESOURCES selectByPrimaryKey(String resourceId);

    int updateByPrimaryKeySelective(RESOURCES record);

    int updateByPrimaryKey(RESOURCES record);
}