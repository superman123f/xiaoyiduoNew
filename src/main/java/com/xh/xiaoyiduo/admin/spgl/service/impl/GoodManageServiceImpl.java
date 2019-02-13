package com.xh.xiaoyiduo.admin.spgl.service.impl;

import com.xh.xiaoyiduo.admin.spgl.dao.B_GOODMapper;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOOD_FatherMapper;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOOD_SonMapper;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_SON;
import com.xh.xiaoyiduo.admin.spgl.service.IGoodManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

/**
 * 商品管理Service
 */
@Service("goodManageService")
public class GoodManageServiceImpl implements IGoodManageService {

    @Autowired
    B_GOOD_FatherMapper fatherMapper;
    @Autowired
    B_GOOD_SonMapper SonMapper;
    @Autowired
    B_GOODMapper goodMapper;

    @Override
    public int insert(B_GOOD good) {
        return goodMapper.insert(good);
    }

    @Override
    public List<B_GOOD_FATHER> getGoodTypeList() {
        return fatherMapper.getGoodTypeList();
    }

    /**
     * 获取商品父类列表
     * @return
     */
    @Override
    public List<B_GOOD_FATHER> getGoodFatherList() {
        return fatherMapper.getGoodFatherList();
    }

    /**
     * 通过父类ID查询子类目
     * @param fatherId
     * @return
     */
    @Override
    public List<B_GOOD_SON> selectGoodSonsByFatherId(String fatherId) {
        return SonMapper.selectGoodSonsByFatherId(fatherId);
    }

    @Override
    public List<B_GOOD> getSonGoodList(String sonId, String goodName, String currentPage, String pageSize) {
        return goodMapper.getSonGoodList(sonId, goodName, currentPage, pageSize);
    }

    @Override
    public Integer getSonGoodCount(String sonId, String goodName) {
        return goodMapper.getSonGoodCount(sonId, goodName);
    }

    @Override
    public B_GOOD getGoodDetailByGoodId(String goodId) {
        return goodMapper.getGoodDetailByGoodId(goodId);
    }

    @Override
    public List<B_GOOD> getUserReleaseAllGood(String userId) {
        return goodMapper.getUserReleaseAllGood(userId);
    }

    @Override
    public int saveGoodImageUrls(String resourceId, String type, String imgUrl, String sonId) {
        return goodMapper.saveGoodImageUrls(resourceId, type, imgUrl, sonId);
    }
}
