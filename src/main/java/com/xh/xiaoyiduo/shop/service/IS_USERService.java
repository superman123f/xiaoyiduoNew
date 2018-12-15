package com.xh.xiaoyiduo.shop.service;

import com.xh.xiaoyiduo.shop.pojo.S_USER;

/**
 */
public interface IS_USERService {
    int insert(S_USER user); //添加用户

    S_USER selectByPhone(String phone); //根据手机号查询

    S_USER selectByStudentNo(String studentNo); //根据学号查询

    S_USER selectByNickname(String nickname); //根据昵称查询
}
