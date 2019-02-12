package com.xh.xiaoyiduo.shop.service.impl;

import com.xh.xiaoyiduo.shop.dao.S_USERMapper;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.shop.service.IS_USERService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class S_USERServiceImpl implements IS_USERService {

    @Autowired
    S_USERMapper userMapper;

    @Override
    public int deleteByPrimaryKey(String userId) {
        int i = userMapper.cancelAssociateRoleByUserId(userId);
        String msg = i > 0 ? "取消关联角色成功" : "取消关联角色失败";
        System.out.println(msg);
        return userMapper.deleteByPrimaryKey(userId);
    }

    @Override
    public int deleteByUserIds(String[] userId) {
        int count = 0;
        for(int i = 0 ; i < userId.length; i++){
            userMapper.cancelAssociateRoleByUserId(userId[i]); //先删除外表
            if(userMapper.deleteByPrimaryKey(userId[i]) > 0){
                count++;
            }
        }
        return count;
    }

    @Override
    public int insert(S_USER user) {
        return userMapper.insert(user);
    }

    @Override
    public S_USER selectByUserId(String userId) {
        return userMapper.selectByUserId(userId);
    }

    @Override
    public S_USER selectByPhone(String phone) {
        return userMapper.selectByPhone(phone);
    }

    @Override
    public S_USER selectByStudentNo(String studentNo) {
        return userMapper.selectByStudentNo(studentNo);
    }

    @Override
    public S_USER selectByNickname(String nickname) {
        return userMapper.selectByNickname(nickname);
    }

    /**
     * 获取用户数量
     * @param studentNo
     * @return
     */
    @Override
    public Integer getUserCount(String studentNo, String nickname, String realName) {
        return userMapper.getUserCount(studentNo, nickname, realName);
    }

    /**
     * 获取所有用户
     */
    @Override
    public List<S_USER> getAllUsers(String pageSize, String currentPage, String studnetNo, String nickname, String realName) {
        return userMapper.getAllUsers(pageSize, currentPage, studnetNo, nickname, realName);
    }

    @Override
    public List<S_USER> fuzzyQueryUsers(String pageSize, String currentPage, String studentNo, String nickname, String realName) {
        return userMapper.fuzzyQueryUsers(pageSize, currentPage, studentNo, nickname, realName);
    }

    @Override
    public int updateUserInfoByUserId(S_USER user) {
        return userMapper.updateUserInfoByUserId(user);
    }

    @Override
    public int associateRoleByRoleId(String userRoleId, String userId, String roleId) {
        return userMapper.associateRoleByRoleId(userRoleId, userId, roleId);
    }
}
