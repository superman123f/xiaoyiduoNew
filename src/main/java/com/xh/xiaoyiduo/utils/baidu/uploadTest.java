package com.xh.xiaoyiduo.utils.baidu;

import org.apache.tomcat.util.codec.binary.Base64;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

/**
 */
public class uploadTest {
    public static void main(String[] args){
        String path = "C:/Users/guyuanhui/Desktop/毕设组/数据集/vacuum/1.jpg";
        FileInputStream fin = null;
        try {
            fin = new FileInputStream(new File(path));
            //可能溢出,简单起见就不考虑太多,如果太大就要另外想办法，比如一次传入固定长度byte[]
            byte[] bytes  = new byte[fin.available()];
            //将文件内容写入字节数组，提供测试的case
            fin.read(bytes);
            fin.close();
            System.out.println("写入文件成功");

//            String url ="https://aip.baidubce.com/rpc/2.0/ai_custom/v1/classification/seeGood?";
//            String access_token="BWZc4HjUztGVp9XM2v6dfjUG xbxInwCjlWDQXsrRvKlM8oUoIW7ecI2a ";
//            String image = Base64.encodeBase64(bytes);
            String image = Base64.encodeBase64String(bytes);

//            String params = "{\"top_num\":5,\"image\":\""+image+"\"}";
//            String result = HttpUtil.post(url, access_token, params);
//            System.out.println(result);

            System.out.println(image.length());
            System.out.println(image);

            System.out.println("===================");
            System.out.println("Base64编码成功");
            FileOutputStream outputStream = new FileOutputStream(new File("D:/a/1.jpg"));
            outputStream.write(bytes);
            outputStream.close();
            System.out.println("输出文件成功");
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
