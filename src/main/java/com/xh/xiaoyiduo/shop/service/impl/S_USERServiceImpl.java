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
    public int insert(S_USER user) {
        return userMapper.insert(user);
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
    public int getUserCount() {
        return userMapper.getUserCount();
    }

    @Override
    public List<S_USER> getAllUsers(String pageSize, String currentPage) {
        return userMapper.getAllUsers(pageSize, currentPage);
    }
}
