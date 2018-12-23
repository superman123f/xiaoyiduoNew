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
        return userMapper.deleteByPrimaryKey(userId);
    }

    @Override
    public int deleteByUserIds(String[] userId) {
        int count = 0;
        for(int i = 0 ; i < userId.length; i++){
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

    @Override
    public Integer getUserCount(String studentNo) {
        return userMapper.getUserCount(studentNo);
    }

    @Override
    public List<S_USER> getAllUsers(String pageSize, String currentPage, String studnetNo) {
        return userMapper.getAllUsers(pageSize, currentPage, studnetNo);
    }

    @Override
    public List<S_USER> fuzzyQueryUsers(String pageSize, String currentPage, String studentNo) {
        return userMapper.fuzzyQueryUsers(pageSize, currentPage, studentNo);
    }

    @Override
    public int updateUserInfoByUserId(S_USER user) {
        return userMapper.updateUserInfoByUserId(user);
    }
}
