package com.xh.xiaoyiduo;

import com.github.pagehelper.PageHelper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

import java.util.Properties;

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

    /**
     * 分页插件
     * @return
     */
    @Bean
    public PageHelper pageHelper(){
        PageHelper pageHelper = new PageHelper();
        Properties properties = new Properties();
        properties.setProperty("offsetAsPageNum","true");
        properties.setProperty("rowBoundsWithCount","true");
        properties.setProperty("reasonable","true");
        properties.setProperty("dialect","oracle");    //配置mysql数据库的方言
        pageHelper.setProperties(properties);
        return pageHelper;
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
