package com.xh.xiaoyiduo.md5;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.junit.Test;

/**
 */
public class MD5Test {
    @Test
    public void testMD5(){
        for(int i = 3; i <= 15; i++){
            Object obj = new SimpleHash("SHA-1", "123456", "用户"+i, 2);
            System.out.println("用户"+i +" " + obj.toString());
        }

        System.out.println("d");
    }
}
