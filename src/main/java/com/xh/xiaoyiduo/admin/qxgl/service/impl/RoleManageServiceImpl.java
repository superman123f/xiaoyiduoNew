package com.xh.xiaoyiduo.admin.qxgl.service.impl;


import com.xh.xiaoyiduo.admin.qxgl.dao.S_USER_ROLEPermissionsMapper;
import com.xh.xiaoyiduo.admin.qxgl.dao.S_USER_USERRolesMapper;
import com.xh.xiaoyiduo.admin.qxgl.pojo.S_USER_ROLEPERMISSIONS;
import com.xh.xiaoyiduo.admin.qxgl.service.IRoleManageService;
import com.xh.xiaoyiduo.shop.dao.S_USERMapper;
import com.xh.xiaoyiduo.shop.dao.S_USER_PermissionsMapper;
import com.xh.xiaoyiduo.shop.dao.S_USER_RolesMapper;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.shop.pojo.S_USER_PERMISSIONS;
import com.xh.xiaoyiduo.shop.pojo.S_USER_ROLES;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

/**
 */
@Service("roleManageService")
public class RoleManageServiceImpl implements IRoleManageService {
    @Autowired
    S_USER_PermissionsMapper permissionsMapper;
    @Autowired
    S_USER_RolesMapper rolesMapper;
    @Autowired
    S_USER_ROLEPermissionsMapper rolePermissionsMapper;
    @Autowired
    S_USER_USERRolesMapper userRolesMapper;
    @Autowired
    S_USERMapper userMapper;

    @Override
    public int getPermissionCount(String roleId, String status, String permissionName) {
        return permissionsMapper.getPermissionCount(roleId, status, permissionName);
    }

    @Override
    public List<S_USER_PERMISSIONS> selectAllPermissions(String roleId, String status, String pageSize, String currentPage, String permissionName) {
        return permissionsMapper.selectAllPermissions(roleId, status, pageSize,currentPage,permissionName);
    }

    @Override
    public S_USER_PERMISSIONS selectByPrimaryKey(String rolePermissionId) {
        return permissionsMapper.selectByPrimaryKey(rolePermissionId);
    }

    @Override
    public int insert(S_USER_PERMISSIONS permission) {
        return permissionsMapper.insert(permission);
    }

    @Override
    public int updatePermissionInfoByPermissionId(S_USER_PERMISSIONS rolePermissionId) {
        return permissionsMapper.updateByPrimaryKey(rolePermissionId);
    }

    @Override
    public int deleteByPrimaryKey(String permissionId) {
        return permissionsMapper.deleteByPrimaryKey(permissionId);
    }

    @Override
    public int getRolesCount(String userId, String status, String roleName) {
        return rolesMapper.getRolesCount(userId, status, roleName);
    }

    @Override
    public List<S_USER_ROLES> selectAllRoles(String userId, String status, String pageSize, String currentPage, String roleName) {
        return rolesMapper.selectAllRoles(userId, status, pageSize, currentPage, roleName);
    }

    @Override
    public S_USER_ROLES seeRolePermissions(String roleId) {
        return rolesMapper.seeRolePermissions(roleId);
    }

    @Override
    public int giveRolePermission(S_USER_ROLEPERMISSIONS record) {
        return rolePermissionsMapper.insert(record);
    }

    @Override
    public int cancelRolePermission(String roleId, String permissionId) {
        return rolePermissionsMapper.deleteByPrimaryKey(roleId, permissionId);
    }

    @Override
    public int giveUserRole(String userId, String roleId) {
        return userRolesMapper.insert(userId, roleId);
    }

    @Override
    public int cancelUserRole(String userId, String roleId) {
        return userRolesMapper.deleteByPrimaryKey(userId, roleId);
    }

    @Override
    public S_USER seeUserRoles(String userId, Model model) {
        List<String> permissionList = userMapper.getUserPermissions(userId);
        S_USER user = userMapper.seeUserRoles(userId);
        model.addAttribute("permissionList", permissionList);
        model.addAttribute("user", user);
        return null;
    }
}
