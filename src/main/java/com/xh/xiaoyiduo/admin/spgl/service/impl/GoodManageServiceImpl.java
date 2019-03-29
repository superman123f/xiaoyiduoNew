package com.xh.xiaoyiduo.admin.spgl.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOODMapper;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOOD_FatherMapper;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOOD_SonMapper;
import com.xh.xiaoyiduo.admin.spgl.dao.ResourcesMapper;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_SON;
import com.xh.xiaoyiduo.admin.spgl.service.IGoodManageService;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;

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
    @Autowired
    ResourcesMapper resourcesMapper;

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

        B_GOOD_SON son = null;
        B_GOOD_FATHER father = null;
        List<B_GOOD_SON> goodSonList = null;

        if(!ObjectUtils.isEmpty(good)){
            String sonId = good.getSonId();

            son = SonMapper.selectByPrimaryKey(sonId);
            String fatherId = son.getFatherId();
            father = fatherMapper.selectByPrimaryKey(fatherId);
            goodSonList = SonMapper.getGoodSonList1(fatherId);
        }

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
        Subject subject = SecurityUtils.getSubject();
        if(subject != null) {
            boolean isAdmin = subject.hasRole("admin");
            String userId = "";
            if(!isAdmin) {
                S_USER currentUser = (S_USER)subject.getPrincipal();
                userId = currentUser.getUserId();
            }
            List<Map<String, String>> goodTypeReportList = goodMapper.getGoodTypeReport(isAdmin, userId); //商品种类统计数量
            List<B_GOOD_FATHER> fatherTypeList = fatherMapper.getGoodFatherList(); //所有商品种类名称
            List<String> goodFatherNameList1 = new ArrayList<>();
            List<String> goodFatherCountList1 = new ArrayList<>();

            boolean exist = false;
            for(B_GOOD_FATHER father: fatherTypeList) {
                for(Map<String, String> map : goodTypeReportList) {
                    if(map.get("FATHER_NAME").equals(father.getFatherName())) {
                        goodFatherNameList1.add(father.getFatherName());
                        goodFatherCountList1.add(map.get("GOOD_NUM"));
                        exist = true;
                        break;
                    } else {
                        exist = false;
                    }
                }
                if(!exist) {
                    goodFatherNameList1.add(father.getFatherName());
                    goodFatherCountList1.add("0");
                }
            }


            JSONArray fatherNameArray = JSONArray.parseArray(JSONArray.toJSONString(goodFatherNameList1));
            JSONArray fatherCountArray = JSONArray.parseArray(JSONArray.toJSONString(goodFatherCountList1));
            model.addAttribute("goodFatherNameList", fatherNameArray);
            model.addAttribute("goodFatherCountList", fatherCountArray);
        }
    }

    @Override
    public int getGoodCount(String goodName, String nickname, String realName, String userId) {
        return goodMapper.getGoodCount(goodName, nickname, realName, userId);
    }

    @Override
    public List<B_GOOD> getAllGoods(String pageSize, String currentPage, String goodName, String nickname, String realName, String userId) {
        return goodMapper.getAllGoods(pageSize, currentPage, goodName, nickname, realName, userId);
    }

    @Override
    public int deleteGoodByGoodId(String goodId) {

        int j = resourcesMapper.deleteGoodPicture(goodId);
        if(j > 0) {
            System.out.println("资源图片删除成功");
        } else {
            System.out.println("资源图片删除失败");
        }
        return goodMapper.deleteGoodByGoodId(goodId);
    }

    @Override
    public B_GOOD selectByPrimaryKey(String goodId) {
        return goodMapper.selectByPrimaryKey(goodId);
    }

    @Override
    public int updateByPrimaryKeySelective(B_GOOD good) {
        return goodMapper.updateByPrimaryKeySelective(good);
    }
}
