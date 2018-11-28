package com.xh.xiaoyiduo.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import java.util.ArrayList;


public class MyRealm extends AuthorizingRealm {

    @Override
    public String getName() {
        return "MyRealm";
    }

    /**
     * 认证
     * @Param token
     * @Return
     * @throws AuthenticationException
     * */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //把token中的username取出来
        Object principal = token.getPrincipal();

        //然后读取数据库，查询是否有该username
        String username = "zhangsan";
//        String password = "0be823215a550dac55388c625209a7ff1e82aed1";
        String password = "666";

        //如果用户不存在，就直接返回null
        if(!username.equals(principal)){
            return null;
        }

        //返回认证对象，包括用户名，正确的凭证，盐，需要传入的数据源名称
        //由上一层来做相关的凭证匹配操作
//        return new SimpleAuthenticationInfo(username, password, ByteSource.Util.bytes("wolf"),getName());
        return new SimpleAuthenticationInfo(username, password, getName());
    }

    /**
     * 授权
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        //获取身份信息
        Object principal = principals.getPrimaryPrincipal();
//        System.out.println(principal);

        //角色集合
        ArrayList<String> roles = new ArrayList<>();
        roles.add("role1");
        roles.add("role2");

        //权限集合
        ArrayList<String> permissions = new ArrayList<>();
        permissions.add("user:create");
        permissions.add("user:delete");

        //包含该用户的所有角色和权限信息的对象
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addRoles(roles);
        info.addStringPermissions(permissions);

        return info;
    }

}
