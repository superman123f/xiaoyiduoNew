package com.xh.xiaoyiduo.shop.dao;

import com.xh.xiaoyiduo.shop.pojo.S_USER_PERMISSIONS;
import org.springframework.stereotype.Repository;

@Repository("permissionsMapper")
public interface S_USER_PermissionsMapper {
    int deleteByPrimaryKey(String permissionId);

    int insert(S_USER_PERMISSIONS record);

    int insertSelective(S_USER_PERMISSIONS record);

    S_USER_PERMISSIONS selectByPrimaryKey(String permissionId);

    int updateByPrimaryKeySelective(S_USER_PERMISSIONS record);

    int updateByPrimaryKey(S_USER_PERMISSIONS record);
}