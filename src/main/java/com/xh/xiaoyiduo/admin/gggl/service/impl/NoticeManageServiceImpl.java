package com.xh.xiaoyiduo.admin.gggl.service.impl;

import com.xh.xiaoyiduo.admin.gggl.dao.NOTICEMapper;
import com.xh.xiaoyiduo.admin.gggl.pojo.NOTICE;
import com.xh.xiaoyiduo.admin.gggl.service.INoticeManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 */
@Service("noticeManageService")
public class NoticeManageServiceImpl implements INoticeManageService {

    @Autowired
    NOTICEMapper noticeMapper;

    @Override
    public int deleteByPrimaryKey(String noticeId) {
        return noticeMapper.deleteByPrimaryKey(noticeId);
    }

    @Override
    public int insert(NOTICE notice) {
        return noticeMapper.insert(notice);
    }

    @Override
    public NOTICE selectByPrimaryKey(String noticeId) {
        return noticeMapper.selectByPrimaryKey(noticeId);
    }

    @Override
    public List<NOTICE> displayAllNotices() {
        return noticeMapper.displayAllNotices();
    }

    @Override
    public Integer getNoticeCount(String title) {
        return noticeMapper.getNoticeCount(title);
    }

    @Override
    public List<NOTICE> selectAllNotice(String pageSize, String currentPage) {
        return noticeMapper.selectAllNotices(pageSize, currentPage);
    }

    @Override
    public int updateNoticeInfoByNoticeId(NOTICE notice) {
        return noticeMapper.updateNoticeInfoByNoticeId(notice);
    }

    @Override
    public List<NOTICE> fuzzyQueryNotices(String pageSize, String currentPage, String title) {
        return noticeMapper.fuzzyQueryNotices(pageSize, currentPage, title);
    }
}
