package com.xh.xiaoyiduo.admin.spgl.controller;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import com.xh.xiaoyiduo.admin.spgl.service.IGoodManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

/**
 * 商品管理Controller
 */

@Controller
@RequestMapping("/good")
public class GoodManageController {

    @Autowired
    private IGoodManageService goodManageService;

    @RequestMapping("/testGood")
    public String testGoodParent(){
        List<B_GOOD_FATHER> goodFatherList = goodManageService.getGoodTypeList();
        return "/pages/shop/commodity";
    }

    /**
     * 跳转到默认商品页
     * @return
     */
    @RequestMapping("/toDefaultGoodPage")
    public String getGoodTypeList(String sonId, Model model){
        List<B_GOOD_FATHER> goodFatherList = goodManageService.getGoodTypeList(); //获取商品菜单栏列表

//        goodManageService.getSonGoodList(sonId);
        model.addAttribute("goodFatherList", goodFatherList);
        return "/shop/commodity";
    }

    /**
     * 获取对应商品子类物品
     * @return
     */
    @RequestMapping("/getSonGoodList")
    public String getSonGoodList(String sonId, Model model){

        List<B_GOOD_FATHER> goodFatherList = goodManageService.getGoodTypeList(); //获取商品菜单栏列表
        List<B_GOOD> sonGoodList = goodManageService.getSonGoodList("1"); //获取对应商品子类物品

        model.addAttribute("goodFatherList", goodFatherList);
        model.addAttribute("sonGoodList", sonGoodList);
        return "/shop/commodity";
    }

    /**
     * 测试图片上传
     */
    @RequestMapping("/testUploadImage")
    @ResponseBody
    public Object testUploadImage(MultipartFile file, Model model, HttpServletRequest request){
        //String realPath = request.getServletContext().getRealPath("/"); //具体到webapp路径,不利于打包
        //String realPath1 = request.getSession().getServletContext().getRealPath("/");//具体到webapp路径
        //        String oldName = file.getOriginalFilename();
//        System.out.println(System.getProperty("user.dir"));
//        Map<String,String> data = new HashMap<>();
//        data.put("code", "1");

//        String imgPath = ":\\"; //打算这里自定义路径

        String oldName = file.getOriginalFilename(); //获取原名
//        String path = request.getServletContext().getRealPath("/upload/"); //获得项目所在路径
        String fileName = changeName(oldName); //将图片重命名
        String rappendix = "upload/" + fileName; //返回给前端的路径
//        fileName = imgPath + fileName; //合并具体的路径

        File file1 = new File(".."); //创建文件夹
        try {
            String basePath = file1.getCanonicalPath()+"/resources/shop";
            File baseFile = new File(basePath);
            System.out.println("ready to make baseFile " + basePath);
            if(!baseFile.exists()){
                baseFile.mkdirs();
                System.out.println("to make file success");
            }
            //获取项目根目录的上级目录,并把图片保存在上级目录下
            File file2 = new File(baseFile+"/"+fileName);
            file.transferTo(file2);
            System.out.println("save image success");
        } catch (IOException e) {
            e.printStackTrace();
        }
        String str = "{\"code\": 0,\"msg\": \"\",\"data\": {\"src\":\"" + rappendix + "\"}}";
        return str;

//        return data;
    }

    //将图片重命名
    public static String changeName(String oldName){
//        Random r = new Random();
//        Date d = new Date();
        //使用uuid命名
        String uuid = UUID.randomUUID().toString().replaceAll("\\-","");
        String newName = oldName.substring(oldName.indexOf('.'));
//        newName = r.nextInt(99999999) + d.getTime() + newName;
        newName = uuid + newName;
        return newName;
    }

    /**
     * 测试多图片上传
     * @return
     */
    @RequestMapping("/testMultipleUpload")
    @ResponseBody
    public Object testMultipleUpload(MultipartFile file, HttpServletRequest request){
        String oldName = file.getOriginalFilename(); //获取原名
//        String path = request.getServletContext().getRealPath("/upload/"); //获得项目所在路径
        String fileName = changeName(oldName); //将图片重命名
        String rappendix = "upload/" + fileName; //返回给前端的路径
//        fileName = imgPath + fileName; //合并具体的路径

        File file1 = new File(".."); //创建文件夹
        try {
            String basePath = file1.getCanonicalPath()+"/resources/shop";
            File baseFile = new File(basePath);
            System.out.println("ready to make baseFile " + basePath);
            if(!baseFile.exists()){
                baseFile.mkdirs();
                System.out.println("to make file success");
            }
            //获取项目根目录的上级目录,并把图片保存在上级目录下
            File file2 = new File(baseFile+"/"+fileName);
            file.transferTo(file2);
            System.out.println("save image success");
        } catch (IOException e) {
            e.printStackTrace();
        }
        String str = "{\"code\": 0,\"msg\": \"\",\"data\": {\"src\":\"" + rappendix + "\"}}";
        return str;
    }

    //返回path路径对应于网络硬盘根目录的本地路径
//    public static String getAbsolutePath(String path)
//    {
//        String absolutePath = userRoot + (File.separator.equals("\\") ? path.replaceAll("/", "\\\\") : path);
//        return absolutePath;
//    }


//    /**
//     * 获取商品类目菜单
//     * @return
//     */
//    @RequestMapping("/getGoodTypeList")
//    public String getGoodTypeList(Model model){
//        List<B_GOOD_FATHER> goodFatherList = goodManageService.getGoodTypeList();
//        model.addAttribute("goodFatherList", goodFatherList);
//        return "/shop/commodity";
//    }

    /**
     * 测试读取图片
     */
    @RequestMapping("/displayImage")
    public void displayImage(HttpServletResponse response){
        File filePic = new File("D:\\1.jpg");
        System.out.println("displayImage");
        try {
            if(filePic.exists()){
                FileInputStream fis = new FileInputStream(filePic);
                int i = fis.available(); // 得到文件大小
                byte data[] = new byte[i];
                fis.read(data); // 读数据
                fis.close();
                response.setContentType("image/*"); // 设置返回的文件类型
                OutputStream out = response.getOutputStream(); // 得到向客户端输出二进制数据的对象
                out.write(data); // 输出数据
                out.flush();
                out.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
