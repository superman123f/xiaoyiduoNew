package com.xh.xiaoyiduo.shiro;

import com.xh.xiaoyiduo.shiro.realm.AuthRealm;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;

/**
 * shiro的配置类
 * @author
 *
 */
@Configuration
public class ShiroConfiguration {
    /**
     * 密码校验规则HashedCredentialsMatcher
     * 这个类是为了对密码进行编码的 ,
     * 防止密码在数据库里明码保存 , 当然在登陆认证的时候 ,
     * 这个类也负责对form里输入的密码进行编码
     * 处理认证匹配处理器：如果自定义需要实现继承HashedCredentialsMatcher
     */
    @Bean("hashedCredentialsMatcher")
    public HashedCredentialsMatcher hashedCredentialsMatcher() {
        HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
        //指定加密方式为SHA-1
        credentialsMatcher.setHashAlgorithmName("SHA-1");
        //加密次数
        credentialsMatcher.setHashIterations(2);
        credentialsMatcher.setStoredCredentialsHexEncoded(true);
        return credentialsMatcher;
    }

    //配置自定义的密码比较器
//    @Bean(name = "credentialsMatcher")
//    public CredentialsMatcher credentialsMatcher() {
//        return new CredentialsMatcher();
//    }

    //配置自定义的权限登录器
//    @Bean(name = "authRealm")
//    public AuthRealm authRealm(@Qualifier("credentialsMatcher") CredentialsMatcher matcher) {
//        AuthRealm authRealm = new AuthRealm();
//        authRealm.setCredentialsMatcher(matcher);
//        return authRealm;
//    }

    @Bean("authRealm")
//    @DependsOn("lifecycleBeanPostProcessor")//可选
    public AuthRealm authRealm(@Qualifier("hashedCredentialsMatcher") HashedCredentialsMatcher matcher) {
        AuthRealm authRealm = new AuthRealm();
        authRealm.setAuthorizationCachingEnabled(false);//启动授权缓存
        authRealm.setCredentialsMatcher(matcher);
        return authRealm;
    }

    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean shiroFilter(@Qualifier("securityManager") SecurityManager manager) {
        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
        bean.setSecurityManager(manager);
        //配置登录的url和登录成功的url
        // bean.setLoginUrl("/s/login");
        bean.setLoginUrl("/user/login");
        // 登录成功跳转的页面
        bean.setSuccessUrl("/s/home");
        //设置未授权跳转的页面
//        bean.setUnauthorizedUrl("/jsp/unauthorized.jsp");

        //配置访问权限
        LinkedHashMap<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
        filterChainDefinitionMap.put("/s/login*", "anon"); //表示可以匿名访问
        filterChainDefinitionMap.put("/s/loginUser", "anon");
        filterChainDefinitionMap.put("/s/a", "anon");
        filterChainDefinitionMap.put("/s/logout*", "anon");

        filterChainDefinitionMap.put("/admin", "anon");
        filterChainDefinitionMap.put("/adminRole", "anon");
        filterChainDefinitionMap.put("/control", "anon");
        filterChainDefinitionMap.put("/create", "anon");
        filterChainDefinitionMap.put("/index", "anon");
        filterChainDefinitionMap.put("/role", "anon");
        filterChainDefinitionMap.put("/rule", "anon");
        filterChainDefinitionMap.put("/sysConfig", "anon");
        filterChainDefinitionMap.put("/upload", "anon");
        filterChainDefinitionMap.put("/member", "anon");

        //jsp访问
        filterChainDefinitionMap.put("/jsp/error.jsp*", "anon");
        filterChainDefinitionMap.put("/jsp/login.jsp*", "authc"); //表示需要认证访问
        filterChainDefinitionMap.put("/documents/**", "anon");
        filterChainDefinitionMap.put("/user/**", "anon"); //访问用户页面

        filterChainDefinitionMap.put("/images/**", "anon"); //访问静态资源
        filterChainDefinitionMap.put("/styles/**", "anon");
        filterChainDefinitionMap.put("/scripts/**", "anon");

        filterChainDefinitionMap.put("/shop/**", "anon"); //访问商城资源
        filterChainDefinitionMap.put("/admin/**", "authc"); //访问后端模板资源
        filterChainDefinitionMap.put("/good/**", "anon");
        filterChainDefinitionMap.put("/cart/**", "anon"); //访问购物车资源
        filterChainDefinitionMap.put("/register", "anon");

        // 具有某个角色的用户可以访问
        filterChainDefinitionMap.put("/s/admin", "roles[admin]");
        filterChainDefinitionMap.put("/s/customer", "roles[customer]");

        // 具有以下权限的可以访问
        filterChainDefinitionMap.put("/s/add", "perms[add]");
        filterChainDefinitionMap.put("/s/delete", "perms[delete]");
        filterChainDefinitionMap.put("/s/update", "perms[update]");
        filterChainDefinitionMap.put("/s/query", "perms[query]");
        filterChainDefinitionMap.put("/static/**", "anon"); //匿名访问静态资源,注意是兩個星星

        filterChainDefinitionMap.put("/*", "authc");//表示需要认证才可以访问
        filterChainDefinitionMap.put("/*.*", "authc");
        //需要登录访问的资源 , 一般将/**放在最下边
        filterChainDefinitionMap.put("/**", "authc");//表示需要认证才可以访问
        bean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return bean;
    }

    //配置核心安全事务管理器
    @Bean(name = "securityManager")
    public SecurityManager securityManager(@Qualifier("authRealm") AuthRealm authRealm) {
        System.err.println("--------------shiro已经加载----------------");
        DefaultWebSecurityManager manager = new DefaultWebSecurityManager();
        manager.setRealm(authRealm);
        return manager;
    }



    /**
     * lifecycleBeanPostProcessor是负责生命周期的 , 初始化和销毁的类
     * (可选)
     */
    @Bean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    /**
     * Spring的一个bean , 由Advisor决定对哪些类的方法进行AOP代理 .
     * @return
     */
    @Bean
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator creator = new DefaultAdvisorAutoProxyCreator();
        creator.setProxyTargetClass(true);
        return creator;
    }

    /**
     * 配置shiro跟spring的关联
     * @param
     * @return
     */
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(@Qualifier("securityManager") SecurityManager manager) {
        AuthorizationAttributeSourceAdvisor advisor = new AuthorizationAttributeSourceAdvisor();
        advisor.setSecurityManager(manager);
        return advisor;
    }

}