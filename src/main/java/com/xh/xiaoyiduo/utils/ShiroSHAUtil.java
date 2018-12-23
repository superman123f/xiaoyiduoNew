package com.xh.xiaoyiduo.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Component;

/**
 * shiro的SHA-1加密工具
 */
@Component
public class ShiroSHAUtil {

    public static String sha1ToPassword(String nickname, String password){

        String hashAlgorithName = "SHA-1"; //使用SHA-1加密
        int hashIterations = 2;//加密次数
        ByteSource credentialsSalt = ByteSource.Util.bytes(nickname);

        password = new SimpleHash(hashAlgorithName, password, credentialsSalt, hashIterations).toString();
        return password;

    }
}
