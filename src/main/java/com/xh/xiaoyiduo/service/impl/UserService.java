package com.xh.xiaoyiduo.service.impl;

import com.xh.xiaoyiduo.dao.UserMapper;
import com.xh.xiaoyiduo.pojo.User;
import com.xh.xiaoyiduo.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 */
@Service
public class UserService implements IUserService {

    @Autowired
    UserMapper userMapper = null;

    @Override
    public User getUser(String username) {
        return userMapper.getUser(username);
    }

    @Override
    public int insertUser(String username) {
        return userMapper.insertUser(username);
    }
}
