package com.xh.xiaoyiduo.admin.qxgl.dao;

import com.xh.xiaoyiduo.admin.qxgl.pojo.S_USER_ROLEPERMISSIONS;
import org.springframework.stereotype.Repository;

@Repository("rolePermissionsMapper")
public interface S_USER_ROLEPermissionsMapper {
    int deleteByPrimaryKey(String rolePermissionId);

    int insert(S_USER_ROLEPERMISSIONS record);

    int insertSelective(S_USER_ROLEPERMISSIONS record);

    S_USER_ROLEPERMISSIONS selectByPrimaryKey(String rolePermissionId);

    int updateByPrimaryKeySelective(S_USER_ROLEPERMISSIONS record);

    int updateByPrimaryKey(S_USER_ROLEPERMISSIONS record);
}