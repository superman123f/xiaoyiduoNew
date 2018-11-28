package com.xh.xiaoyiduo.service;

import com.xh.xiaoyiduo.pojo.User;

/**
 */
public interface IUserService {
    public User getUser(String username);
    public int insertUser(String username);

}
