package com.xh.xiaoyiduo.admin.spgl.controller;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import com.xh.xiaoyiduo.admin.spgl.service.IGoodManageService;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
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
import java.util.*;

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
        List<B_GOOD> sonGoodList = goodManageService.getSonGoodList("4"); //获取对应商品子类物品

        model.addAttribute("goodFatherList", goodFatherList);
        model.addAttribute("sonGoodList", sonGoodList);
        return "/shop/commodity";
    }

    /**
     * 测试单个图片上传
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


    /**
     * 测试多图片上传
     * @return
     */
    @RequestMapping("/testMultipleUpload")
    @ResponseBody
    public Object testMultipleUpload(MultipartFile file, HttpServletRequest request){
        String oldName = file.getOriginalFilename(); //获取原名
//        String path = request.getServletContext().getRealPath("/upload/"); //获得项目所在绝对路径
        String fileName = changeName(oldName); //将图片重命名

//        String rappendix = "upload/" + fileName; //返回给前端的路径
//        fileName = imgPath + fileName; //合并具体的路径


        Map<String,Object> result = new HashMap<>(); //返回给前端的结果
        String imgUrl = null; //保存好后的图片路径

        File file1 = new File(".."); //创建文件夹
        try {
            String basePath = file1.getCanonicalPath()+"/resources/shop";
            File baseFile = new File(basePath);
            System.out.println("ready to make baseFile " + basePath);
            if(!baseFile.exists()){
                baseFile.mkdirs();
                System.out.println("to make file success");
            }

            //获取项目根目录的上级目录,并把图片保存在该目录下
            imgUrl = baseFile+"/"+fileName;
            String newImgUrl = imgUrl.replaceAll("\\\\", "/");
            File file2 = new File(imgUrl);
            file.transferTo(file2); //保存图片
//            imgUrl.replaceAll("\\\\", "/");
            result.put("status", "0"); //0保存成功，1保存失败
            result.put("src", newImgUrl); //图片路径
            result.put("oldName", oldName); //原图片名称
            System.out.println("save image success");
            return result;
        } catch (IllegalStateException e) {
            result.put("status", "1");
            System.out.println(imgUrl + "图片保存失败");
            return result;
        } catch (IOException e){
            result.put("status", "1");
            System.out.println(imgUrl + "图片保存失败");
            return result;
        }
//        String str = "{\"code\": 0,\"msg\": \"\",\"data\": {\"src\":\"" + imgUrl + "\"}}";
//        return result;
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
    public void displayImage(String imageUrl, HttpServletResponse response){
//        File filePic = new File("D:\\1.jpg");
        File filePic = new File(imageUrl);
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

    /**
     * 保存商品信息
     * @return
     */
    @RequestMapping("/saveGoodInfo")
    @ResponseBody
    public Object saveGoodInfo(B_GOOD good, String imgUrls){
        //获取当前登录用户的身份信息
        S_USER user = (S_USER) SecurityUtils.getSubject().getPrincipal();
        String currentUserId = user.getUserId();
//        currentUser.getPrincipals().
//        Long currentUserId = (Long) SecurityUtils.getSubject().getSession().getAttribute("currentUserId");
        String[] imgUrlList = imgUrls.split(",");
        Map<String, Object> result = new HashMap<>();
        //保存商品信息
        String goodId = UUID.randomUUID().toString().replaceAll("\\-", "");
        good.setGoodId(goodId);
        good.setUserId(currentUserId);
        int g = goodManageService.insert(good);
        if(g > 0) {
            result.put("success", true);
            System.out.println("保存商品成功");

            if(imgUrlList.length > 0){
                for(int i = 0; i < imgUrlList.length; i++){
                    System.out.println("imgs path is" + imgUrlList[i]);
                    String resourceId = UUID.randomUUID().toString().replaceAll("\\-", "");
                    //保存商品图片路径到resources表
                    goodManageService.saveGoodImageUrls(resourceId, "1", imgUrlList[i], goodId);
                }
            }
        } else {
            System.out.println("保存商品失败");
            result.put("success", false);
        }
        return result;
    }

    /**
     * 获取商品详情信息
     * @param goodId
     * @return
     */
    @RequestMapping("/toGoodDetailPage")
    public String toGoodDetailPage(String goodId, Model model){
        System.out.println("sonId"+goodId);
        B_GOOD goodDetail = goodManageService.getGoodDetailByGoodId(goodId);
        model.addAttribute("goodDetail", goodDetail);
        return "/shop/details";
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
}
