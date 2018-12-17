package com.xh.xiaoyiduo.shop.dao;

import com.xh.xiaoyiduo.shop.pojo.S_USER_ROLES;
import org.springframework.stereotype.Repository;

@Repository("rolesMapper")
public interface S_USER_RolesMapper {
    int deleteByPrimaryKey(String roleId);

    int insert(S_USER_ROLES record);

    int insertSelective(S_USER_ROLES record);

    S_USER_ROLES selectByPrimaryKey(String roleId);

    int updateByPrimaryKeySelective(S_USER_ROLES record);

    int updateByPrimaryKey(S_USER_ROLES record);
}