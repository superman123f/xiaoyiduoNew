package com.xh.xiaoyiduo.admin.spgl.controller;

import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import com.xh.xiaoyiduo.admin.spgl.service.IGoodManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

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
     * 获取商品类目菜单
     * @return
     */
    @RequestMapping("/getGoodTypeList")
    public String getGoodTypeList(Model model){
        List<B_GOOD_FATHER> goodFatherList = goodManageService.getGoodTypeList();
        model.addAttribute("goodFatherList", goodFatherList);
        return "/shop/commodity";
    }

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
