package com.xh.xiaoyiduo.shirotest.dao;

import com.xh.xiaoyiduo.shirotest.pojo.User;
import org.springframework.stereotype.Repository;

/**
 */
@Repository(value="myUserMapper")
public interface UserMapper {
    User selectByPrimaryKey(Integer uid);
    User queryUserName(String username);
    int deleteByPrimaryKey(Integer uid);
    int insert(String uid, String username, String password);
    int insertSelective(String uid, String username, String password);
    int updateByPrimaryKeySelective(String uid, String username, String password);
    int updateByPrimaryKey(String uid, String username, String password);
}
