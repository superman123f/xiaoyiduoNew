package com.xh.xiaoyiduo.utils.baidu;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.xh.xiaoyiduo.utils.baidu.entity.CustomBean;
import com.xh.xiaoyiduo.utils.baidu.entity.Results;
import com.xh.xiaoyiduo.utils.baidu.entity.Student;
import net.sf.ezmorph.bean.MorphDynaBean;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
//import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.ConvolveOp;
import java.awt.image.Kernel;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.xh.xiaoyiduo.utils.baidu.getToken.AuthService.getAuth;

public class BaiduExample {

    /**
     * 重要提示代码中所需工具类
     * FileUtil,Base64Util,HttpUtil,GsonUtils请从
     * https://ai.baidu.com/file/658A35ABAB2D404FBF903F64D47C1F72
     * https://ai.baidu.com/file/C8D81F3301E24D2892968F09AE1AD6E2
     * https://ai.baidu.com/file/544D677F5D4E4F17B4122FBD60DB82B3
     * https://ai.baidu.com/file/470B3ACCA3FE43788B5A963BF0B625F3
     * 下载
     */
    public static String easydl(byte[] file1) {
//        String path = "C:/Users/guyuanhui/Desktop/毕设组/数据集/vacuum/1.jpg";
//        FileInputStream fin = null;
        try {
//            fin = new FileInputStream(new File(path));
//            //可能溢出,简单起见就不考虑太多,如果太大就要另外想办法，比如一次传入固定长度byte[]
//            byte[] bytes  = new byte[fin.available()];
//            //将文件内容写入字节数组，提供测试的case
//            fin.read(bytes);
//            fin.close();

//            String str = new String(bytes);
//            Map<String, Object> map = new HashMap<>();
//            map.put("image", bytes);
//            map.put("top_num", "2");
//            map.put("image", "sfasq35sadvsvqwr5q...");
//            map.put("top_num", "5");

//            String param = GsonUtils.toJson(map);
//            System.out.println("====================");
//            System.out.println(param);

        // 请求url
        String url = "https://aip.baidubce.com/rpc/2.0/ai_custom/v1/classification/seeGood";
        String accessToken = getAuth();

//        byte[] file = FileUtil.readFileByBytes("D:\\Documents\\Tencent Files\\1529623111\\FileRecv\\MobileFile\\违禁品\\3.jpg");
        byte[] file = file1;

        String image = Base64Util.encode(file);
        String params = "{\"top_num\":5,\"image\":\""+image+"\"}";
//        String result = HttpUtil.post(url, access_token, params);
//        System.out.println(result);


            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
//            String accessToken = "[调用鉴权接口获取的token]";
//            String accessToken = getAuth();
//            String accessToken = getAuth();
            String result = HttpUtil.post(url, accessToken, "application/json", params);
            System.out.println(result);
            return result;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
//String returnStr = "{\"key\":\"success\",\"message\":\"查询成功\",\"relationKey\":[{\"keybd_state\":1,\"keybd_code\":\"cXzDdfOcHC\"}],\"success\":true}";
//        JSONObject jsonObject=JSONObject.fromObject(returnStr);

//     /   MorphDynaBean bean = (MorphDynaBean) JSONArray.toList((JSONArray) jsonObject.get("relationKey")).get(0);
//        int keybd_state = (int) bean.get("keybd_state");
//        System.out.println(bean);

//        //检测商品种类范围的json结果数据
//        String results =  easydl("1");
//        String results = "{\"log_id\":5132558772297159724,\"results\":[{\"name\":\"[default]\",\"score\":0.9850209951400757},{\"name\":\"vacuum\",\"score\":0.014979000203311443}]}";
//        //json转Object
//        Map classMap = new HashMap();
//        classMap.put(results, Results.class);
//        JSONObject jsonObject = JSONObject.fromObject(results);
//        Map<String, Class> classMap = new HashMap<>();
//        classMap.put("results", Results.class);
//        将json格式的字符创转换为对象
//        CustomBean customBean = (CustomBean) JSONObject.toBean(jsonObject, CustomBean.class, classMap);

//        List<Results> rsList = customBean.getResults();
//        System.out.println(rsList);
//        for(Results rs : rsList){
//            System.out.println(rs.getScore() + " " + rs.getName());
////            if(rs.getName().equals("vacuum")){
////                System.out.println(rs.getScore() + " " + rs.getName());
////            }
//        }
//        System.out.println(customBean.getResults().get);

//        CustomBean customBean = (CustomBean) JSONObject.toBean(object,CustomBean.class);
//        MorphDynaBean bean = (MorphDynaBean) JSONArray.toList((JSONArray) object.get("results")).get(0);
//        System.out.println(bean.get("name"));
//        System.out.println(bean.get("score"));
//        object.size();
//        MorphDynaBean bean = (MorphDynaBean) JSONArray.toList((JSONArray) object.get("results"));

//        System.out.println(customBean.getResults());
//        System.out.println("=============");
////        List<Results> rsList = customBean.getResults();
////        for(Results rs : rsList){
////            System.out.println("...." + rs.getScore());
////            System.out.println("...." + rs.getName());
////        }
////        List<Results> list = customBean.getResults();
//        System.out.println(customBean);
//        System.out.println(customBean.getLog_id());
//        System.out.println(customBean.getResults());

//        //2、使用JSONArray
//        JSONArray jsonArray= JSONArray.fromObject(str);
//        //获得jsonArray的第一个元素
//        Object o=jsonArray.get(0);
//        JSONObject jsonObject2= JSONObject.fromObject(o);
//        CustomBean stu2=(CustomBean)JSONObject.toBean(jsonObject2, CustomBean.class);
//        System.out.println("stu2:"+stu2);

        // 测试比较BigDecimal
        BigDecimal a = new BigDecimal(0.80000000023123);
        BigDecimal b = new BigDecimal(0.80);
        System.out.println(a);
        System.out.println(b);
        System.out.println(a.compareTo(b));
        if(a.compareTo(b) == -1) {
            System.out.println(" a < b");
        } else if(a.compareTo(b) == 0) {
            System.out.println(" a = b");
        } else {
            System.out.println(" a > b");
        }
    }

    public static void imageResize(File originalFile, File resizedFile,
                                int maxWidth,int maxHeight, float quality) throws IOException {

                 if (quality > 1) {
                         throw new IllegalArgumentException(
                                         "图片质量需设置在0.1-1范围");
                     }

                 ImageIcon ii = new ImageIcon(originalFile.getCanonicalPath());
                 Image i = ii.getImage();
                 Image resizedImage = null;

                int iWidth = i.getWidth(null);
                 int iHeight = i.getHeight(null);

                 int newWidth = maxWidth;
                 if(iWidth < maxWidth){
                         newWidth = iWidth;
                     }

                if (iWidth >= iHeight) {
                         resizedImage = i.getScaledInstance(newWidth, (newWidth * iHeight)
                                         / iWidth, Image.SCALE_SMOOTH);
                    }

                int newHeight = maxHeight;
                 if(iHeight < maxHeight){
                        newHeight = iHeight;
                    }
                if(resizedImage==null && iHeight >= iWidth){
                         resizedImage = i.getScaledInstance((newHeight * iWidth) / iHeight,
                                        newHeight, Image.SCALE_SMOOTH);
                     }

                // This code ensures that all the pixels in the image are loaded.
                 Image temp = new ImageIcon(resizedImage).getImage();

                 // Create the buffered image.
                 BufferedImage bufferedImage = new BufferedImage(temp.getWidth(null),
                                 temp.getHeight(null), BufferedImage.TYPE_INT_RGB);

                 // Copy image to buffered image.
                 Graphics g = bufferedImage.createGraphics();

                 // Clear background and paint the image.
                 g.setColor(Color.white);
                 g.fillRect(0, 0, temp.getWidth(null), temp.getHeight(null));
                 g.drawImage(temp, 0, 0, null);
                g.dispose();

                 // Soften.
                float softenFactor = 0.05f;
                 float[] softenArray = { 0, softenFactor, 0, softenFactor,
                                 1 - (softenFactor * 4), softenFactor, 0, softenFactor, 0 };
                 Kernel kernel = new Kernel(3, 3, softenArray);
                 ConvolveOp cOp = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);
                 bufferedImage = cOp.filter(bufferedImage, null);

                 // Write the jpeg to a file.
        JPEGImageEncoder encoder;
        try (FileOutputStream out = new FileOutputStream(resizedFile)) {

            // Encodes image as a JPEG data stream
            encoder = JPEGCodec.createJPEGEncoder(out);
        }

        JPEGEncodeParam param = encoder
                         .getDefaultJPEGEncodeParam(bufferedImage);

                 param.setQuality(quality, true);

                 encoder.setJPEGEncodeParam(param);
                 encoder.encode(bufferedImage);
    } // Example usage
}