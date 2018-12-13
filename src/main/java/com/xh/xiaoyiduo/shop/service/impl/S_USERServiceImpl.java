package com.xh.xiaoyiduo.shop.service.impl;

import com.xh.xiaoyiduo.shop.dao.S_USERMapper;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.shop.service.IS_USERService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class S_USERServiceImpl implements IS_USERService {

    @Autowired
    S_USERMapper userMapper;

    @Override
    public int insert(S_USER user) {
        return userMapper.insert(user);
    }
}
