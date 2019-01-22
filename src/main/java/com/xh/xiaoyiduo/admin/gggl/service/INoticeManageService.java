package com.xh.xiaoyiduo.admin.gggl.service;

import com.xh.xiaoyiduo.admin.gggl.pojo.NOTICE;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 */
public interface INoticeManageService {
    int deleteByPrimaryKey(String noticeId);
    int insert(NOTICE notice);
    NOTICE selectByPrimaryKey(String noticeId); // 查询公告信息
    List<NOTICE> displayAllNotices(); // 前端显示所有公告信息
    Integer getNoticeCount(String title); // 获取禁品总数
    List<NOTICE> selectAllNotice(String pageSize, String currentPage); // 查询所有公告信息
    int updateNoticeInfoByNoticeId(NOTICE notice); // 修改公告信息
    List<NOTICE> fuzzyQueryNotices(String pageSize, String currentPage, String title); //模糊查询

}
