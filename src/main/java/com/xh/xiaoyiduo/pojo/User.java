package com.xh.xiaoyiduo.pojo;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

/**
 */
@Component
@Alias(value="user")
public class User {
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
