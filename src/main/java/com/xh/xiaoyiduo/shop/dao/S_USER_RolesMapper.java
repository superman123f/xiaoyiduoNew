package com.xh.xiaoyiduo.shop.dao;

import com.xh.xiaoyiduo.shop.pojo.S_USER_ROLES;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("rolesMapper")
public interface S_USER_RolesMapper {
    int deleteByPrimaryKey(String roleId);

    int insert(S_USER_ROLES record);

    int insertSelective(S_USER_ROLES record);

    S_USER_ROLES selectByPrimaryKey(String roleId);

    int updateByPrimaryKeySelective(S_USER_ROLES record);

    int updateByPrimaryKey(S_USER_ROLES record);

    //    -------------------------角色--------------
    int getRolesCount(@Param("roleName")String roleName); // 获取权限总数
    List<S_USER_ROLES> selectAllRoles(@Param("pageSize")String pageSize, @Param("currentPage")String currentPage, @Param("roleName")String roleName); //分页查询
}