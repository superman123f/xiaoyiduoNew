package com.xh.xiaoyiduo.shop.dao;

import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userMapper")
public interface S_USERMapper {
    int deleteByPrimaryKey(String userId); //删除用户

    int insert(S_USER user);

    int insertSelective(S_USER record);

    S_USER selectByUserId(String userId); //根据用户编号查询

    S_USER selectByPhone(String phone); //根据手机号查询

    S_USER selectByStudentNo(String studentNo); //根据学号查询

    S_USER selectByNickname(String nickname); //根据昵称查询

    Integer getUserCount(@Param("studentNo") String studentNo, @Param("nickname")String nickname, @Param("realName")String realName); //获取用户总数

    List<S_USER> getAllUsers(@Param("pageSize") String pageSize, @Param("currentPage") String currentPage, @Param("studentNo") String studentNo, @Param("nickname")String nickname, @Param("realName")String realName);  //获取所有用户

    List<S_USER> fuzzyQueryUsers(@Param("pageSize") String pageSize, @Param("currentPage") String currentPage, @Param("studentNo") String studentNo, @Param("nickname")String nickname, @Param("realName")String realName); //模糊查询用户

    int updateUserInfoByUserId(S_USER user); //更新用户信息

    int updateByPrimaryKey(S_USER record);

    int associateRoleByRoleId(@Param("userRoleId")String userRoleId, @Param("userId")String userId, @Param("roleId")String roleId); //关联角色
    int cancelAssociateRoleByUserId(@Param("userId")String userId);
}