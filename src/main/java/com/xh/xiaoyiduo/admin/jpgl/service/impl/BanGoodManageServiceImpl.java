package com.xh.xiaoyiduo.admin.jpgl.service.impl;

import com.xh.xiaoyiduo.admin.jpgl.dao.B_GOOD_BanMapper;
import com.xh.xiaoyiduo.admin.jpgl.pojo.B_GOOD_BAN;
import com.xh.xiaoyiduo.admin.jpgl.service.IBanGoodManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("banGoodManageService")
public class BanGoodManageServiceImpl implements IBanGoodManageService {

    @Autowired
    B_GOOD_BanMapper banMapper;

    @Override
    public int deleteByPrimaryKey(String banName) {
        return banMapper.deleteByPrimaryKey(banName);
    }

    @Override
    public int insert(B_GOOD_BAN banGood) {
        return banMapper.insert(banGood);
    }

    @Override
    public B_GOOD_BAN selectByPrimaryKey(String banId) {
        return banMapper.selectByPrimaryKey(banId);
    }

    @Override
    public Integer getBanGoodCount(String banName) {
        return banMapper.getBanGoodCount(banName);
    }

    @Override
    public List<B_GOOD_BAN> getAllBanGoods(String pageSize, String currentPage, String banName) {
        return banMapper.getAllBanGoods(pageSize, currentPage, banName);
    }

    @Override
    public int updateBanGoodInfoByBanId(String banId, String banName) {
        return banMapper.updateBanGoodInfoByBanId(banId, banName);
    }
}
