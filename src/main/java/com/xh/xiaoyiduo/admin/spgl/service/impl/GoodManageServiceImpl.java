package com.xh.xiaoyiduo.admin.spgl.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOODMapper;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOOD_FatherMapper;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOOD_SonMapper;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_SON;
import com.xh.xiaoyiduo.admin.spgl.service.IGoodManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
    public List<B_GOOD> getSonGoodList(String sonId, String goodName, String time,String price,String degree, String collect, String currentPage, String pageSize) {
        return goodMapper.getSonGoodList(sonId, goodName, time, price, degree, collect, currentPage, pageSize);
    }

    @Override
    public Integer getSonGoodCount(String sonId, String goodName, String time,String price,String degree, String collect) {
        return goodMapper.getSonGoodCount(sonId, goodName, time, price, degree, collect);
    }

    @Override
    public B_GOOD getGoodDetailByGoodId(String goodId, Model model) {
        B_GOOD good = goodMapper.getGoodDetailByGoodId(goodId);

        String sonId = good.getSonId();
        B_GOOD_SON son = SonMapper.selectByPrimaryKey(sonId);

        String fatherId = son.getFatherId();
        B_GOOD_FATHER father = fatherMapper.selectByPrimaryKey(fatherId);
        List<B_GOOD_SON> goodSonList = SonMapper.getGoodSonList1(fatherId);

        model.addAttribute("son", son);
        model.addAttribute("father", father);
        model.addAttribute("goodSonList", goodSonList);
        return good;
    }

    @Override
    public List<B_GOOD> getUserReleaseAllGood(String userId) {
        return goodMapper.getUserReleaseAllGood(userId);
    }

    @Override
    public int saveGoodImageUrls(String resourceId, String type, String imgUrl, String sonId) {
        return goodMapper.saveGoodImageUrls(resourceId, type, imgUrl, sonId);
    }

    /**
     * 获取种类商品统计报表
     * @return
     */
    @Override
    public void getGoodTypeReport(Model model) {
        List<Map<String, String>> goodTypeReportList = goodMapper.getGoodTypeReport();
        List<String> goodFatherNameList1 = new ArrayList<>();
        List<String> goodFatherCountList1 = new ArrayList<>();
        for(Map<String, String> map : goodTypeReportList) {
            goodFatherNameList1.add(map.get("FATHER_NAME"));
            goodFatherCountList1.add(map.get("GOOD_NUM"));
        }
//        String goodFatherNameList = JSON.toJSONString(goodFatherNameList1);
//        String goodFatherCountList = JSON.toJSONString(goodFatherCountList1);
        JSONArray fatherNameArray = JSONArray.parseArray(JSONArray.toJSONString(goodFatherNameList1));
        JSONArray fatherCountArray = JSONArray.parseArray(JSONArray.toJSONString(goodFatherCountList1));
        model.addAttribute("goodFatherNameList", fatherNameArray);
        model.addAttribute("goodFatherCountList", fatherCountArray);
    }

    @Override
    public int getGoodCount(String goodName, String nickname, String realName) {
        return goodMapper.getGoodCount(goodName, nickname, realName);
    }

    @Override
    public List<B_GOOD> getAllGoods(String pageSize, String currentPage, String goodName, String nickname, String realName) {
        return goodMapper.getAllGoods(pageSize, currentPage, goodName, nickname, realName);
    }
}
