package com.xh.xiaoyiduo.admin.spgl.service.impl;

import com.xh.xiaoyiduo.admin.spgl.dao.B_GOOD_FatherMapper;
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

    @Override
    public List<B_GOOD_FATHER> getGoodTypeList() {
        return fatherMapper.getGoodTypeList();
    }
}