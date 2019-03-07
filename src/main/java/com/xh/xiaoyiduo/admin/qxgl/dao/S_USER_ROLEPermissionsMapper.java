package com.xh.xiaoyiduo.admin.qxgl.dao;

import com.xh.xiaoyiduo.admin.qxgl.pojo.S_USER_ROLEPERMISSIONS;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository("rolePermissionsMapper")
public interface S_USER_ROLEPermissionsMapper {
    int deleteByPrimaryKey(@Param("roleId")String roleId, @Param("permissionId")String permissionId);

    int insert(S_USER_ROLEPERMISSIONS record); //角色关联权限

    int insertSelective(S_USER_ROLEPERMISSIONS record);

    S_USER_ROLEPERMISSIONS selectByPrimaryKey(String rolePermissionId);

    int updateByPrimaryKeySelective(S_USER_ROLEPERMISSIONS record);

    int updateByPrimaryKey(S_USER_ROLEPERMISSIONS record);
}