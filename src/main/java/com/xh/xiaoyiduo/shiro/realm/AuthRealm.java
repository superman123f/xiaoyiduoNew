package com.xh.xiaoyiduo.shiro.realm;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class AuthRealm extends AuthorizingRealm {
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        return null;
    }

    //    @Autowired
//    private UserMapper myUserMapper;
//
//    //认证.登录
//    @Override
//    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
//        UsernamePasswordToken utoken = (UsernamePasswordToken) token;//获取用户输入的token
//        System.out.println(utoken);
//        String username = utoken.getUsername();
//
//        User user = myUserMapper.queryUserName(username);
//
//        if(!user.getUsername().equals(username)){
//            System.out.println("用戶名不存在");
//            return null;
//        }
//        //放入shiro.调用CredentialsMatcher检验密码
////        return new SimpleAuthenticationInfo(user, user.getPassword(), this.getClass().getName());
//        return new SimpleAuthenticationInfo(user, user.getPassword(), ByteSource.Util.bytes(user.getUsername()), this.getClass().getName());
//    }
//
//    //授权
//    @Override
//    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
//        //获取session中的用户
//        User user = (User) principal.fromRealm(this.getClass().getName()).iterator().next();
//        List<String> permissions = new ArrayList<>();
//        List<String> rolesCollection = new ArrayList<>();
//
//        Set<Role> roles = user.getRoles();
//        if (roles.size() > 0) {
//            for (Role role : roles) {
//                //获取角色名称
//                rolesCollection.add(role.getRname());
//                //获取该角色的权限集合
//                Set<Module> modules = role.getModules();
//                if (modules.size() > 0) {
//                    for (Module module : modules) {
//                        permissions.add(module.getMname());
//                    }
//                }
//            }
//        }
//        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
//        //将权限放入shiro中.
//        info.addStringPermissions(permissions);
//        //将角色放入shiro中
//        info.addRoles(rolesCollection);
//        return info;
//    }
}
