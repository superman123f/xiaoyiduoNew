package com.xh.xiaoyiduo.admin.gggl.dao;

import com.xh.xiaoyiduo.admin.gggl.pojo.NOTICE;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("noticeMapper")
public interface NOTICEMapper {
    int deleteByPrimaryKey(String noticeId);

    int insert(NOTICE record);

    int insertSelective(NOTICE record);

    NOTICE selectByPrimaryKey(String noticeId); // 查询公告信息
    Integer getNoticeCount(); // 获取禁品总数
    List<NOTICE> selectAllNotices(@Param("pageSize")String pageSize, @Param("currentPage")String currentPage); // 查询所有公告信息
    int updateNoticeInfoByNoticeId(NOTICE notice); // 修改公告信息

    int updateByPrimaryKeySelective(NOTICE record);

    int updateByPrimaryKey(NOTICE record);
}