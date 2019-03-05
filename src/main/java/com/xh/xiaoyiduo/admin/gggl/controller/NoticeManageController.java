package com.xh.xiaoyiduo.admin.gggl.controller;

import com.alibaba.fastjson.JSON;
import com.xh.xiaoyiduo.admin.gggl.pojo.NOTICE;
import com.xh.xiaoyiduo.admin.gggl.service.INoticeManageService;
import com.xh.xiaoyiduo.admin.gggl.service.impl.NoticeManageServiceImpl;
import com.xh.xiaoyiduo.admin.jpgl.pojo.B_GOOD_BAN;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.*;


@Controller
@RequestMapping("/notice")
public class NoticeManageController {

    @Autowired
    INoticeManageService noticeManageService;

    /**
     * 前端公告页面
     * @param model
     * @return
     */
    @RequestMapping("/toNoticePage")
    public String toNoticePage(Model model){
        List<NOTICE> noticeList = noticeManageService.displayAllNotices();
        model.addAttribute("noticeList", noticeList);
        return "/admin/gggl/noticePage";
    }

    /**
     * 后端公告管理页面
     * @return
     */
    @RequestMapping("/noticeAdminPage")
    public String noticeAdminPage(){
        return "/admin/gggl/noticeAdmin";
    }

    /**
     * 后端查看公告详情页
     * @return
     */
    @RequestMapping("/editNotice")
    public String banGoodInfo(String noticeId, Model model){
        NOTICE notice = noticeManageService.selectByPrimaryKey(noticeId);
        model.addAttribute("notice", notice);
        return "/admin/gggl/editNotice";
    }

    /**
     * 获取公告信息列表
     * @param limit
     * @param page
     * @return
     */
    @RequestMapping("/getAllNotices")
    @ResponseBody
    public String getAllNotices(String limit, String page){
        Integer count = noticeManageService.getNoticeCount(""); // 获取公告的总数量
        if (count == null){
            count = 0;
        }
        List<NOTICE> noticeList = noticeManageService.selectAllNotice(limit, page); //获取所有公告的信息
        String noticeListJson = JSON.toJSONString(noticeList); //将对象转换为json
        String json = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + noticeListJson + "}";
        return json;
    }

    /**
     * 新增与编辑
     * @param
     * @param
     * @param
     * @return
     */
    @RequestMapping("/updateNoticeInfo")
    @ResponseBody
    public Object updateNoticeInfo(NOTICE notice){
        Map<String, Object> data = new HashMap<>();
        Date date = new Date(); // 发布时间，新增或修改都要更新

        //新增公告，判断id是否存在
        if(notice.getNoticeId().equals("") || notice.getNoticeId() == null){

            String uuid = UUID.randomUUID().toString().replaceAll("\\-", "");
            notice.setNoticeId(uuid);  //插入主键
            notice.setReleaseTime(date);

            int i = noticeManageService.insert(notice); //添加公告信息

            if(i > 0) {
                System.out.println("新增公告成功");
                data.put("success", true);
                data.put("msg", "新增成功");
            } else {
                System.out.println("新增公告失败");
                data.put("success", false);
                data.put("msg", "新增失败");
            }

        } else { //编辑公告
            notice.setReleaseTime(date);
            int i = noticeManageService.updateNoticeInfoByNoticeId(notice);

            if(i > 0) {
                data.put("success", true);
                data.put("msg", "保存成功");
                System.out.println("编辑公告信息成功");
            } else {
                data.put("success", false);
                data.put("msg", "保存失败");
            }
        }
        return data;
    }

    /**
     * 删除公告
     * @param noticeId
     * @return
     */
    @RequestMapping("/deleteNotice")
    @ResponseBody
    public Map<String, Object> deleteNotice(String noticeId){
        Map<String, Object> result = new HashMap<>();
        int i = noticeManageService.deleteByPrimaryKey(noticeId);
        if(i > 0){
            result.put("success", true);
            result.put("msg", "删除公告成功");
        } else {
            result.put("success", false);
            result.put("msg", "删除公告失败");
        }

        return result;
    }

    /**
     * 批量删除公告
     * @param
     * @param
     * @return
     */
    @RequestMapping("/deleteNoticeInfos")
    @ResponseBody
    public Object deleteNoticeInfos(String noticeIds, HttpServletResponse response){
        String[] noticeId = noticeIds.split("，");
        int count = 0;
        for(int i = 0; i < noticeId.length; i++){
            noticeManageService.deleteByPrimaryKey(noticeId[i]);
            count++;
        }

        System.out.println("成功删除" + count + "条记录");
        Map<String,Object> data = new HashMap<>();
        if(count > 0) {
            data.put("success", true);
            data.put("msg", "批量删除公告 成功");
        } else {
            data.put("success", false);
            data.put("msg", "批量删除公告 失败");
        }
        return data;
    }

    /**
     * 搜索公告
     * @param
     * @return
     */
    @RequestMapping("/searchNotice")
    @ResponseBody
    public String searchNotice(String limit, String page, String title, HttpServletResponse response){
        Integer count = noticeManageService.getNoticeCount(title); // 获取公告的总数量

        if (count == null){
            count = 0;
        }
        List<NOTICE> noticeList = noticeManageService.fuzzyQueryNotices(limit, page, title);
        String noticeListJson = JSON.toJSONString(noticeList);
        String json = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + noticeListJson + "}";

        return  json;
    }
}
