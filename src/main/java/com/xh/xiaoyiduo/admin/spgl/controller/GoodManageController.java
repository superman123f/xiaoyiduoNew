package com.xh.xiaoyiduo.admin.spgl.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.StringUtil;
import com.xh.xiaoyiduo.admin.gwcgl.service.ICartManageService;
import com.xh.xiaoyiduo.admin.jpgl.pojo.B_GOOD_BAN;
import com.xh.xiaoyiduo.admin.jpgl.service.IBanGoodManageService;
import com.xh.xiaoyiduo.admin.lygl.pojo.B_GOOD_MESSAGE;
import com.xh.xiaoyiduo.admin.lygl.service.IMessageManageService;
import com.xh.xiaoyiduo.admin.scjgl.service.IFavoriteManageService;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_SON;
import com.xh.xiaoyiduo.admin.spgl.service.IGoodManageService;
import com.xh.xiaoyiduo.admin.utils.Pager;
import com.xh.xiaoyiduo.admin.yygl.service.IUserManageService;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.shop.service.IS_USERService;
import com.xh.xiaoyiduo.utils.baidu.entity.CustomBean;
import com.xh.xiaoyiduo.utils.baidu.entity.Results;
import net.sf.json.JSONObject;
import org.apache.commons.collections.map.HashedMap;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.*;

import static com.xh.xiaoyiduo.utils.baidu.BaiduExample.easydl;

/**
 * 商品管理Controller
 */

@Controller
@RequestMapping("/good")
public class GoodManageController {

    @Autowired
    private IGoodManageService goodManageService;

    @Autowired
    private IUserManageService userManageService;

    @Autowired
    private IFavoriteManageService favoriteManageService;

    @Autowired
    private ICartManageService cartManageService;

    @Autowired
    private IS_USERService userService; //在shop模块下

    @Autowired
    private IBanGoodManageService banGoodManageService;

    @Autowired
    private IMessageManageService messageManageService;

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
     * 跳转到默认商品页
     * @return
     */
    @RequestMapping("/getReport")
    public String getReport(Model model){
        goodManageService.getGoodTypeReport(model);
        return "/admin/tjfx/report";
    }


    /**
     * 获取对应商品子类物品
     * @return
     */
    @RequestMapping("/getSonGoodList")
    public String getSonGoodList(String sonId, String currentPage, String pageSize, Model model, HttpServletRequest request){
        String goodName1 =request.getParameter("goodName1")=="" ? "":request.getParameter("goodName1");
        S_USER user = (S_USER) SecurityUtils.getSubject().getPrincipal();
        HttpSession session = request.getSession();
        Integer cartGoodCount = null;
        if(user != null) {
            String currentUserId = user.getUserId();
            cartGoodCount = cartManageService.queryCartGoodCountsByUserId(currentUserId);
            if(cartGoodCount != null){
                session.setAttribute("cartGoodCount", cartGoodCount); //保存当前登录用户的购物车商品个数
            } else {
                session.setAttribute("cartGoodCount", 0); //保存当前登录用户的购物车商品个数
            }
        }

        List<B_GOOD_FATHER> goodFatherList = goodManageService.getGoodTypeList(); //获取商品菜单栏列表
        List<B_GOOD> sonGoodList = goodManageService.getSonGoodList(null, null, null, null, null, null, "1", "2"); //获取对应商品子类物品
//        Integer sonGoodCount = goodManageService.getSonGoodCount(sonId); //某个子类商品总数

        model.addAttribute("goodFatherList", goodFatherList);
        model.addAttribute("sonGoodList", sonGoodList);
        model.addAttribute("cartGoodCount", cartGoodCount);
        model.addAttribute("goodName1", goodName1);
        model.addAttribute("user", user);
//        model.addAttribute("sonGoodCount", sonGoodCount);

        return "/shop/commodity";
    }

    /**
     * 商品列表（分页）
     * @return
     */
    @RequestMapping("/getSonGoodList1")
    @ResponseBody
    public Object getSonGoodList1(Model model, HttpServletRequest request){

        String sonId = request.getParameter("sonId")=="" ? null:request.getParameter("sonId");
        String goodName = request.getParameter("goodName")=="" ? null:request.getParameter("goodName");
        String time = request.getParameter("time")=="" ? null:request.getParameter("time");
        String price = request.getParameter("price")=="" ? null:request.getParameter("price");
        String degree = request.getParameter("degree")=="" ? null:request.getParameter("degree");
        String collect = request.getParameter("collect")=="" ? null:request.getParameter("collect");

        String currentPage = request.getParameter("currentPage")=="" ? null:request.getParameter("currentPage");
        String pageSize = request.getParameter("pageSize")=="" ? null:request.getParameter("pageSize");

//        List<B_GOOD_FATHER> goodFatherList = goodManageService.getGoodTypeList(); //获取商品菜单栏列表

        //1.查询总记录数
        Integer total = goodManageService.getSonGoodCount(sonId, goodName, time, price, degree, collect);
        //1.1 查询分页数据
        List<B_GOOD> sonGoodList = goodManageService.getSonGoodList(sonId, goodName, time, price, degree, collect, currentPage, pageSize); //获取对应商品子类物品
//        sonGoodList.sort();
        //2. 封装分页类对象
        Pager<B_GOOD> pager = new Pager<>();
        pager.setCurrentPage(Integer.parseInt(currentPage));
        pager.setPageSize(Integer.parseInt(pageSize));
        pager.setTotal(total);
        pager.setData(sonGoodList);
        return pager;
    }

    /**
     * 获取对应的子类商品个数
     * @return
     */
    @RequestMapping("/getSonGoodCount")
    @ResponseBody
    public Map<String, Object> getSonGoodCount(String sonId, String goodName, Model model){
        Map<String, Object> result = new HashMap<>();
        Integer sonGoodCount = goodManageService.getSonGoodCount(sonId, goodName, null, null, null,null); //某个子类商品总数
        if(sonGoodCount != null) {
            result.put("success", true);
            result.put("sonGoodCount", sonGoodCount);
        } else {
            result.put("success", false);
        }
        model.addAttribute("sonGoodCount", sonGoodCount);
        return result;
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
    }


    /**
     * 测试多图片上传
     * @return
     */
    @RequestMapping("/testMultipleUpload")
    @ResponseBody
    public Object testMultipleUpload(MultipartFile file, HttpServletRequest request){

        Map<String,Object> result = new HashMap<>(); //返回给前端的结果
        String oldName = file.getOriginalFilename(); //获取原名
//        String path = request.getServletContext().getRealPath("/upload/"); //获得项目所在绝对路径
        String fileName = changeName(oldName); //将图片重命名
//        String rappendix = "upload/" + fileName; //返回给前端的路径
//        fileName = imgPath + fileName; //合并具体的路径

        boolean isBan = false; // 是否为禁品, 百度接口异常

        // 检测上传的商品是否是违规类商品
        try {
            String results = easydl(file.getBytes());
            // 错误返回的json
            // result:{"error_code":336001,"error_msg":"Invalid argument","log_id":1364784071446883619}
            // 检测百度AI是否返回异常信息的json
            if(results.contains("error_code")){
                isBan = true;
                System.out.println("百度AI接口异常,,,,,,,,");
                result.put("status", "1"); // 0保存成功，1保存失败
                result.put("isBaiDuException", "0"); // 0百度返回异常信息
                result.put("msg", "识别异常");
            } else {
                //json转Object
                JSONObject jsonObject = JSONObject.fromObject(results);
                Map<String, Class> classMap = new HashMap<>();
                classMap.put("results", Results.class);
                // 将json格式的字符创转换为对象
                CustomBean customBean = (CustomBean) JSONObject.toBean(jsonObject, CustomBean.class, classMap);
                List<Results> rsList = customBean.getResults();

                // 准确率设置，后期训练好模型后需要改为0.80
                BigDecimal precision = new BigDecimal(0.60);
                for(Results rs : rsList){
                    // 检测是哪类禁品
                    if(rs.getScore().compareTo(precision) == 1) {
                        System.out.println("大于80% " +rs.getScore() + rs.getName());
                        B_GOOD_BAN banGood = banGoodManageService.selectByBanLabel(rs.getName());
                        if(banGood != null) { // 不为空，说明该商品类已被添加为违规类商品
                            isBan = true;
                            System.out.println("此类禁品是 " + banGood.getBanName());
                            result.put("status", "1"); //0保存成功，1保存失败
                            result.put("isBanGood", "0"); // 是禁品为0
                            result.put("msg", banGood.getBanName());
                        }
                    }
                }
            }

        } catch (IOException e) {
            System.out.println("保存异常,,,,,,,,");
            result.put("status", "1"); //0保存成功，1保存失败
            result.put("msg", "保存异常");
            e.printStackTrace();
        }

        // 当模型训练的不是很好时，每个标签的准确率都低于80%，则默认不是禁品，保存商品图片
        if(isBan == false) {
            // 保存商品图片
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
                // imgUrl.replaceAll("\\\\", "/");
                result.put("status", "0"); //0保存成功，1保存失败
                result.put("src", newImgUrl); //图片路径
                result.put("oldName", oldName); //原图片名称
                System.out.println("save image success");
            } catch (IllegalStateException e) {
                result.put("status", "1");
                System.out.println(imgUrl + "图片保存失败");
            } catch (IOException e){
                result.put("status", "1");
                System.out.println(imgUrl + "图片保存失败");
            }
        }

        // Stringstr = "{\"code\": 0,\"msg\": \"\",\"data\": {\"src\":\"" + imgUrl + "\"}}"; // layui特定json格式
        return result;
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
    public String toGoodDetailPage(String goodId, Integer currentPage, Integer pageSize, Model model){
        S_USER user = (S_USER) SecurityUtils.getSubject().getPrincipal();
        if(user == null){
            model.addAttribute("noFavorite", "true");
        } else {
            String currentUserId = user.getUserId();
            Boolean flag = favoriteManageService.queryGoodInFolder(currentUserId, goodId); // 查询该商品是否在收藏夹中
            if(flag) {
                model.addAttribute("noFavorite", "false");
            } else {
                model.addAttribute("noFavorite", "true");
            }
        }

        B_GOOD goodDetail = goodManageService.getGoodDetailByGoodId(goodId, model); // 获取商品详情信息

        //获取该商品所属者的所有商品
        List<B_GOOD> userGoodList = goodManageService.getUserReleaseAllGood(goodDetail.getUserId());
        //获取卖家昵称
        String userName = (String)userService.selectByUserId(goodDetail.getUserId()).getUserId();

        int messageCount = messageManageService.getMessageCount(goodId);

        //获取该商品的所有留言信息及回复信息
        List<B_GOOD_MESSAGE> messageList= messageManageService.selectAllMessageAndReply(goodId, 1, 10);

        model.addAttribute("goodDetail", goodDetail);
        model.addAttribute("userGoodList", userGoodList);
        model.addAttribute("userName", userName);
        model.addAttribute("messageCount", messageCount);
        model.addAttribute("messageList", messageList);
        return "/shop/details";
    }

    @RequestMapping("/getGoodSonType")
    @ResponseBody
    public List<B_GOOD_SON> getGoodSonType(String fatherId){
        List<B_GOOD_SON> goodSonList = goodManageService.selectGoodSonsByFatherId(fatherId);
        return goodSonList;
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

//    --------------------------后台商品管理列表--------------------------//

    /**
     * 获取商品列表、模糊搜索商品
     * @param limit
     * @param page
     * @param response
     * @return
     */
    @RequestMapping("/getAllGoods")
    @ResponseBody
    public String getAllGoods(String limit, String page, String goodName, String nickname, String realName, HttpServletResponse response){

        int count = goodManageService.getGoodCount(goodName, nickname, realName);
        if(count > 0){
            System.out.println("not good");
        } else {
            System.out.println("good exist");
        }
        List<B_GOOD> goodList = goodManageService.getAllGoods(limit, page, goodName, nickname, realName);
        String goodListJson  = JSON.toJSONString(goodList); //将对象转换成json

        String json = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + goodListJson + "}";
        return json;
    }

    /**
     * 商品新增、编辑
     * @param goodId
     * @return
     */
    @RequestMapping("/goodInfo")
    public String userInfo(String goodId, Model model){
        B_GOOD good = goodManageService.getGoodDetailByGoodId(goodId, model);
        List<B_GOOD_FATHER> fatherList = goodManageService.getGoodFatherList();
        model.addAttribute("good", good);
        model.addAttribute("fatherList", fatherList);
        return "/admin/spgl/goodInfo";
    }
}