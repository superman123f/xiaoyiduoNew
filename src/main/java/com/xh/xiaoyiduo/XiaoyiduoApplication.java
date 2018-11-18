package com.xh.xiaoyiduo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

@SpringBootApplication(scanBasePackages = "com.xh.xiaoyiduo")
//@MapperScan(basePackages="com.xh.xiaoyiduo", annotationClass = Repository.class)

@MapperScan(basePackages="com.xh.xiaoyiduo")

//@SpringBootApplication(scanBasePackages = "com.xh.xiaoyiduo", exclude = DataSourceAutoConfiguration.class)
//@ComponentScan(basePackages = "com.xh.xiaoyiduo.*")

//这里扫面路径写错了
//@MapperScan(basePackages="com.springboot.chapter5", annotationClass = Repository.class)
public class XiaoyiduoApplication {

    public static void main(String[] args) {
        SpringApplication.run(XiaoyiduoApplication.class, args);
        System.out.println("成功启动");
    }

//    @Autowired
//    SqlSessionFactory sqlSessionFactory = null;
    //定义一个MyBatis的Mapper接口

//    @Bean
//    public MapperFactoryBean<IUserDao> initIUserDao(){
//        MapperFactoryBean<IUserDao> bean = new MapperFactoryBean<>();
//        bean.setMapperInterface(IUserDao.class);
//        bean.setSqlSessionFactory(sqlSessionFactory);
//        return bean;
//    }

}
