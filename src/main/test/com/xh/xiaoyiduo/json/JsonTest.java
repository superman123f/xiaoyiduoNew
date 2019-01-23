package com.xh.xiaoyiduo.json;

import org.junit.Test;

/**
 */
public class JsonTest {

    /**
     * 测试字符串中是否包含某个子串
     */
    @Test
    public void testSearchJson(){
         String result = "result:{\"error_code\":336001,\"error_msg\":\"Invalid argument\",\"log_id\":1364784071446883619}";
        System.out.println(result.contains("errorcode"));
    }
}
