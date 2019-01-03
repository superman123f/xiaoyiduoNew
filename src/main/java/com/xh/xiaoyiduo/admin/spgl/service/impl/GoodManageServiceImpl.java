package com.xh.xiaoyiduo.admin.spgl.service.impl;

import com.xh.xiaoyiduo.admin.spgl.dao.B_GOODMapper;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOOD_FatherMapper;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
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
    B_GOODMapper goodMapper;

    @Override
    public int insert(B_GOOD good) {
        return goodMapper.insert(good);
    }

    @Override
    public List<B_GOOD_FATHER> getGoodTypeList() {
        return fatherMapper.getGoodTypeList();
    }

    @Override
    public List<B_GOOD> getSonGoodList(String sonId) {
        return goodMapper.getSonGoodList(sonId);
    }

    @Override
    public B_GOOD getGoodDetailByGoodId(String goodId) {
        return goodMapper.getGoodDetailByGoodId(goodId);
    }

    @Override
    public int saveGoodImageUrls(String resourceId, String type, String imgUrl, String sonId) {
        return goodMapper.saveGoodImageUrls(resourceId, type, imgUrl, sonId);
    }
}
