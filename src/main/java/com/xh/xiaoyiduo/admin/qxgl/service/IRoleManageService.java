package com.xh.xiaoyiduo.admin.qxgl.service;

import com.xh.xiaoyiduo.admin.qxgl.pojo.S_USER_ROLEPERMISSIONS;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.shop.pojo.S_USER_PERMISSIONS;
import com.xh.xiaoyiduo.shop.pojo.S_USER_ROLES;

import java.util.List;

/**
 */
public interface IRoleManageService {
    int getPermissionCount(String roleId, String status, String permissionName); // 获取权限总数
    List<S_USER_PERMISSIONS> selectAllPermissions(String roleId, String status, String pageSize, String currentPage, String permissionName); //分页查询
    S_USER_PERMISSIONS selectByPrimaryKey(String permissionId); //查看
    int insert(S_USER_PERMISSIONS permission); //新增权限
    int updatePermissionInfoByPermissionId(S_USER_PERMISSIONS rolePermissionId); //更新权限
    int deleteByPrimaryKey(String permissionId); //删除权限

//    -------------------------角色--------------
    int getRolesCount(String roleName); // 获取权限总数
    List<S_USER_ROLES> selectAllRoles(String pageSize, String currentPage, String roleName); //分页查询
    S_USER_ROLES seeRolePermissions(String roleId); // 查看角色权限
    int giveRolePermission(S_USER_ROLEPERMISSIONS record); //给予角色权限
    int cancelRolePermission(String roleId, String permissionId); //取消角色权限


//    -------------------------用户角色--------------
    S_USER seeUserRoles(String userId); // 查看角色权限
    int giveUserRole(String userId, String roleId); //给予角色权限
    int cancelUserRole(String userId, String roleId); //取消角色权限

}
