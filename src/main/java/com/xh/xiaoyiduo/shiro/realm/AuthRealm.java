package com.xh.xiaoyiduo.shiro.realm;

import com.xh.xiaoyiduo.shop.dao.S_USERMapper;
import com.xh.xiaoyiduo.shop.dao.S_USER_PermissionsMapper;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.shop.pojo.S_USER_PERMISSIONS;
import com.xh.xiaoyiduo.shop.pojo.S_USER_ROLES;
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
//    @Override
//    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
//        return null;
//    }

//    @Override
//    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
//        return null;
//    }


    @Autowired
    private S_USERMapper userMapper;

    //认证.登录
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken utoken = (UsernamePasswordToken) token;//获取用户输入的token
//        System.out.println(utoken);
        String userAccount = utoken.getUsername();

        S_USER user = userMapper.selectByPhone(userAccount);

        // 检验手机号
        if(user == null){
            // 检验学号
            user = userMapper.selectByStudentNo(userAccount);
            if(user == null){
                // 检验昵称
                user = userMapper.selectByNickname(userAccount);
                if(user == null){
                   System.out.println("用户不存在");
                   return null;
                }else{
                    System.out.println("匹配昵称成功");
                    return new SimpleAuthenticationInfo(user, user.getPassword(), ByteSource.Util.bytes(user.getNickname()), this.getClass().getName());
                }
            } else {
                System.out.println("匹配学号成功");
                return new SimpleAuthenticationInfo(user, user.getPassword(), ByteSource.Util.bytes(user.getNickname()), this.getClass().getName());
            }
        } else {
            System.out.println("匹配手机号成功");
            return new SimpleAuthenticationInfo(user, user.getPassword(), ByteSource.Util.bytes(user.getNickname()), this.getClass().getName());
        }

        //放入shiro.调用CredentialsMatcher检验密码
//        return new SimpleAuthenticationInfo(user, user.getPassword(), this.getClass().getName());
//        return new SimpleAuthenticationInfo(user, user.getPassword(), ByteSource.Util.bytes(user.getUsername()), this.getClass().getName());
//        System.out.println("该用户不存在");
//        return null;
    }

//    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
        //获取session中的用户

        S_USER user = (S_USER) principal.fromRealm(this.getClass().getName()).iterator().next();
        List<String> rolesCollection = new ArrayList<>();
        List<String> permissionsCollection = new ArrayList<>();


        Set<S_USER_ROLES> roles = user.getRoles();
        if (roles.size() > 0) {
            for (S_USER_ROLES role : roles) {
                //获取角色名称
                rolesCollection.add(role.getRoleName());
                //获取该角色的权限集合
                Set<S_USER_PERMISSIONS> permissions = role.getPermissions();
                if (permissions.size() > 0) {
                    for (S_USER_PERMISSIONS permission : permissions) {
                        permissionsCollection.add(permission.getPermissionName());
                    }
                }
            }
        }

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //将角色放入shiro中
        info.addRoles(rolesCollection);
        //将权限放入shiro中.
        info.addStringPermissions(permissionsCollection);

        return info;
    }
}
