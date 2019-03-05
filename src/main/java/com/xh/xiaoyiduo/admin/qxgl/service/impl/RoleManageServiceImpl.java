package com.xh.xiaoyiduo.admin.qxgl.service.impl;


import com.xh.xiaoyiduo.admin.qxgl.service.IRoleManageService;
import com.xh.xiaoyiduo.shop.dao.S_USER_PermissionsMapper;
import com.xh.xiaoyiduo.shop.dao.S_USER_RolesMapper;
import com.xh.xiaoyiduo.shop.pojo.S_USER_PERMISSIONS;
import com.xh.xiaoyiduo.shop.pojo.S_USER_ROLES;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 */
@Service("roleManageService")
public class RoleManageServiceImpl implements IRoleManageService {
    @Autowired
    S_USER_PermissionsMapper permissionsMapper;
    @Autowired
    S_USER_RolesMapper rolesMapper;
    @Override
    public int getPermissionCount(String permissionName) {
        return permissionsMapper.getPermissionCount(permissionName);
    }

    @Override
    public List<S_USER_PERMISSIONS> selectAllPermissions(String pageSize, String currentPage, String permissionName) {
        return permissionsMapper.selectAllPermissions(pageSize,currentPage,permissionName);
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
    public int getRolesCount(String roleName) {
        return rolesMapper.getRolesCount(roleName);
    }

    @Override
    public List<S_USER_ROLES> selectAllRoles(String pageSize, String currentPage, String roleName) {
        return rolesMapper.selectAllRoles(pageSize, currentPage, roleName);
    }
}
