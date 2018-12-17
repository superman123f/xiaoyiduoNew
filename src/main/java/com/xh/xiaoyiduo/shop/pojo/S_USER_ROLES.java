package com.xh.xiaoyiduo.shop.pojo;

import java.util.HashSet;
import java.util.Set;

public class S_USER_ROLES {
    private String roleId;

    private String roleName;

    private String userId; //缺省，用不上

    private Set<S_USER_PERMISSIONS> permissions = new HashSet<>();

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Set<S_USER_PERMISSIONS> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<S_USER_PERMISSIONS> permissions) {
        this.permissions = permissions;
    }
}