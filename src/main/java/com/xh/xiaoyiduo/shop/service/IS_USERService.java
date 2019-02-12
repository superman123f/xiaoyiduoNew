package com.xh.xiaoyiduo.shop.service;

import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 */
public interface IS_USERService {

    int deleteByPrimaryKey(String userId); //删除用户

    int deleteByUserIds(String[] userId); //批量删除用户

    int insert(S_USER user); //添加用户

    S_USER selectByUserId(String userId); //根据用户编号查询

    S_USER selectByPhone(String phone); //根据手机号查询

    S_USER selectByStudentNo(String studentNo); //根据学号查询

    S_USER selectByNickname(String nickname); //根据昵称查询

    Integer getUserCount(String studentNo, String nickname, String realName); //获取用户总数

    List<S_USER> getAllUsers(String pageSize, String currentPage, String studentNo, String nickname, String realName);  //获取所有用户

    List<S_USER> fuzzyQueryUsers(String pageSize, String currentPage, String studentNo, String nickname, String realName); //模糊查询用户

    List<S_USER> exportUserExcel(); // 导出用户数据

    int updateUserInfoByUserId(S_USER user); //更新用户信息

    int associateRoleByRoleId(String userRoleId, String userId, String roleId); //关联角色

}
