package com.xh.xiaoyiduo.shop.dao;

import com.xh.xiaoyiduo.shop.pojo.S_USER_PERMISSIONS;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("permissionsMapper")
public interface S_USER_PermissionsMapper {
    int deleteByPrimaryKey(String permissionId);

    int insert(S_USER_PERMISSIONS record);

    int insertSelective(S_USER_PERMISSIONS record);

    S_USER_PERMISSIONS selectByPrimaryKey(String permissionId);

    int updateByPrimaryKeySelective(S_USER_PERMISSIONS record);

    int updateByPrimaryKey(S_USER_PERMISSIONS record);

    int getPermissionCount(@Param("permissionName")String permissionName); // 获取权限总数
    List<S_USER_PERMISSIONS> selectAllPermissions(@Param("pageSize") String pageSize, @Param("currentPage") String currentPage, @Param("permissionName")String permissionName); //分页查询
}