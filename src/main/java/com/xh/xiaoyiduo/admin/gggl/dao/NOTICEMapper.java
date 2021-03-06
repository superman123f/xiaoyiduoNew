package com.xh.xiaoyiduo.admin.gggl.dao;

import com.xh.xiaoyiduo.admin.gggl.pojo.NOTICE;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("noticeMapper")
public interface NOTICEMapper {
    int deleteByPrimaryKey(String noticeId);

    int insert(NOTICE notice);

    int insertSelective(NOTICE record);

    NOTICE selectByPrimaryKey(String noticeId); // 查询公告信息

    List<NOTICE> displayAllNotices(); // 前端显示所有公告信息

    Integer getNoticeCount(@Param("title") String title); // 获取禁品总数

    List<NOTICE> selectAllNotices(@Param("pageSize")String pageSize, @Param("currentPage")String currentPage); // 查询所有公告信息

    int updateNoticeInfoByNoticeId(NOTICE notice); // 修改公告信息

    int updateByPrimaryKeySelective(NOTICE record);

    int updateByPrimaryKey(NOTICE record);

    int deleteByNoticeIds(String[] noticeId); //批量删除公告

    List<NOTICE> fuzzyQueryNotices(@Param("pageSize")String pageSize, @Param("currentPage")String currentPage, @Param("title")String title); //模糊查询

}