package com.xh.xiaoyiduo.admin.qxgl.dao;

import com.xh.xiaoyiduo.admin.qxgl.pojo.S_USER_USERROLES;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository("userRolesMapper")
public interface S_USER_USERRolesMapper {
    int deleteByPrimaryKey(@Param("userId") String userId, @Param("roleId")String roleId);

    int insert(@Param("userId") String userId, @Param("roleId")String roleId);

    int insertSelective(S_USER_USERROLES record);

    S_USER_USERROLES selectByPrimaryKey(String userRoleId);

    int updateByPrimaryKeySelective(S_USER_USERROLES record);

    int updateByPrimaryKey(S_USER_USERROLES record);
}