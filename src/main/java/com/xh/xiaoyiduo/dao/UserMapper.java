package com.xh.xiaoyiduo.dao;

import com.xh.xiaoyiduo.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
//@Mapper
public interface UserMapper {
    public User getUser(String username);
    public int insertUser(String username);
}
