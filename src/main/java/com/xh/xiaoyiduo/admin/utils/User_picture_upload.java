package com.xh.xiaoyiduo.admin.utils;


import java.util.HashMap;

import java.util.Map;

import java.util.UUID;



import org.springframework.web.multipart.MultipartFile;



//import utils.FastDFSClient;
//
//import utils.JsonUtils;


public class User_picture_upload {
//    参考的范例
    public void upload(MultipartFile pictureFile,byte[] byteArray){
//        // 图片上传
//        // 设置图片名称，不能重复，可以使用uuid
//        String picName = UUID.randomUUID().toString();
//        // 如果插入的图片不为空，则上传
//        if (!pictureFile.isEmpty()) {
//            try {
//                // 把图片上传的图片服务器
//                FastDFSClient fastDFSClient = new FastDFSClient("E:/EEwspace/sd-sso/src/main/resources/conf/client.conf");
//                // 取文件扩展名
//                String originalFilename = pictureFile.getOriginalFilename();
//                String extName = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
//                // 得到一个图片的地址和文件名
//                //String url = fastDFSClient.uploadFile(pictureFile.getBytes(), extName);String url = fastDFSClient.uploadFile(byteArray, extName);
//                // 补充为完整的url
//                url = "http://192.168.25.133/" + url;
//                System.out.println(url);
//                // 封装到map中返回
//                Map result = new HashMap<>();
//                result.put("error", 0);
//                result.put("url", url);
//                //return JsonUtils.objectToJson(result);
//            } catch (Exception e) {
//                e.printStackTrace();
//                Map result = new HashMap<>();
//                result.put("error", 1);
//                result.put("message", "图片上传失败");
//            }

//        }

    }

}
