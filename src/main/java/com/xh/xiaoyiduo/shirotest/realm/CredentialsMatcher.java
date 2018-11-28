package com.xh.xiaoyiduo.shirotest.realm;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * 权限用户密码校验类
 */
public class CredentialsMatcher extends SimpleCredentialsMatcher {

    //校验
    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        UsernamePasswordToken utoken = (UsernamePasswordToken) token;
        //获得用户输入的密码:(可以采用加盐(salt)的方式去检验)
        String inPassword = new String(utoken.getPassword());

        //        SHA-1加密
        String hashAlgorithName = "SHA-1";
//        char[] password = utoken.getPassword();
        int hashIterations = 2; //加密次数
        ByteSource credentialsSalt = ByteSource.Util.bytes(utoken.getUsername());
        Object obj = new SimpleHash(hashAlgorithName, inPassword, credentialsSalt, hashIterations);

        inPassword = obj.toString();
        //获得数据库中的密码
        String dbPassword = (String) info.getCredentials();
        //进行密码的比对
        boolean bool = equals(obj, dbPassword);
        System.out.println(bool);
        return this.equals(inPassword, dbPassword);
    }
}