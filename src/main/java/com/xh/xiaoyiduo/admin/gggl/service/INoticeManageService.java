package com.xh.xiaoyiduo.admin.gggl.service;

import com.xh.xiaoyiduo.admin.gggl.pojo.NOTICE;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 */
public interface INoticeManageService {
    NOTICE selectByPrimaryKey(String noticeId); // 查询公告信息
    Integer getNoticeCount(); // 获取禁品总数
    List<NOTICE> selectAllNotice(String pageSize, String currentPage); // 查询所有公告信息
    int updateNoticeInfoByNoticeId(NOTICE notice); // 修改公告信息
}
