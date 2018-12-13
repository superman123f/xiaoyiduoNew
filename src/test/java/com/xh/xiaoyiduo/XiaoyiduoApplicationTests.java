package com.xh.xiaoyiduo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class XiaoyiduoApplicationTests {

    @Test
    public void contextLoads() {
        System.out.println((int)((Math.random()*9+1)*100000));
    }

}
