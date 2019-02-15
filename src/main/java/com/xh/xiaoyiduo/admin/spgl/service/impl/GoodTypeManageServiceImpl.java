package com.xh.xiaoyiduo.admin.spgl.service.impl;

import com.alibaba.fastjson.JSON;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOOD_FatherMapper;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOOD_SonMapper;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_FATHER;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD_SON;
import com.xh.xiaoyiduo.admin.spgl.service.IGoodTypeManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 */
@Service("goodTypeManageService")
public class GoodTypeManageServiceImpl implements IGoodTypeManageService {

    @Autowired
    B_GOOD_FatherMapper fatherMapper;

    @Autowired
    B_GOOD_SonMapper sonMapper;

    /**
     * 获取父类类目信息
     * @return
     */
    @Override
    public String getGoodFatherList(Model model) {

        int count = fatherMapper.getGoodFatherCount(); // 商品父类类目总数
        List<B_GOOD_FATHER> goodFatherList = fatherMapper.getGoodFatherList();// 获取商品父类类目
        model.addAttribute("father", goodFatherList);

        String fatherListJson = JSON.toJSONString(goodFatherList);
        String json = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + fatherListJson + "}";

        return json;
    }

    /**
     * 获取子类类目信息
     * @return
     */
    @Override
    public String getGoodSonList(String fatherId) {

        int count = sonMapper.getGoodSonCount(fatherId); // 商品子类类目总数
        List<B_GOOD_SON> goodSonList = sonMapper.selectGoodSonsByFatherId(fatherId);// 获取商品子类类目
        String sonListJson = JSON.toJSONString(goodSonList);
        String json = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + sonListJson + "}";

        return json;
    }

    @Override
    public B_GOOD_FATHER selectGoodFatherById(String fatherId) {
        return fatherMapper.selectByPrimaryKey(fatherId);
    }

    @Override
    public B_GOOD_SON selectGoodSonById(String sonId) {
        return sonMapper.selectByPrimaryKey(sonId);
    }

    /**
     * 新增父类
     * @param father
     * @return
     */
    @Override
    public Map<String, Object> insertGoodFatherType(B_GOOD_FATHER father) {
        Map<String, Object> data = new HashMap<>();

        String uuid = UUID.randomUUID().toString().replaceAll("\\-", "");
        father.setFatherId(uuid);  //插入主键
        int i = fatherMapper.insert(father);

        if(i > 0) {
            data.put("success", true);
            data.put("msg", "新增成功");
        } else {
            data.put("success", false);
            data.put("msg", "新增失败");
        }
        return data;
    }

    /**
     * 编辑父类
     * @param father
     * @return
     */
    @Override
    public Map<String, Object> updateGoodFatherType(B_GOOD_FATHER father) {
        Map<String, Object> data = new HashMap<>();

        int i = fatherMapper.updateByPrimaryKey(father);
        if(i > 0) {
            data.put("success", true);
            data.put("msg", "保存成功");
        } else {
            data.put("success", false);
            data.put("msg", "保存失败");
        }
        return data;
    }

    /**
     * 新增子类
     * @param son
     * @return
     */
    @Override
    public Map<String, Object> insertGoodSonType(B_GOOD_SON son) {
        Map<String, Object> data = new HashMap<>();

        String uuid = UUID.randomUUID().toString().replaceAll("\\-", "");
        son.setSonId(uuid); //插入主键
        int i = sonMapper.insert(son);

        if(i > 0) {
            data.put("success", true);
            data.put("msg", "新增成功 ");
        } else {
            data.put("success", false);
            data.put("msg", "新增失败 ");
        }
        return data;
    }

    /**
     * 编辑子类
     * @param son
     * @return
     */
    @Override
    public Map<String, Object> updateGoodSonType(B_GOOD_SON son) {
        Map<String, Object> data = new HashMap<>();

        int i = sonMapper.updateByPrimaryKey(son);
        if(i > 0) {
            data.put("success", true);
            data.put("msg", "保存成功 ");
        } else {
            data.put("success", false);
            data.put("msg", "保存失败");
        }
        return data;
    }

    /**
     * 单个删除父类
     * @param fatherId
     * @return
     */
    @Override
    public Map<String, Object> deleteGoodFatherById(String fatherId) {
        Map<String, Object> data = new HashMap<>();

        int i = fatherMapper.deleteByPrimaryKey(fatherId);
        if(i > 0) {
            data.put("success", true);
            data.put("msg", "删除成功 ");
        } else {
            data.put("success", false);
            data.put("msg", "删除失败");
        }
        return data;
    }

    @Override
    public Map<String, Object> deleteGoodSonById(String sonId) {
        Map<String, Object> data = new HashMap<>();

        int i = sonMapper.deleteByPrimaryKey(sonId);
        if(i > 0) {
            data.put("success", true);
            data.put("msg", "删除成功");
        } else {
            data.put("success", false);
            data.put("msg", "删除失败 ");
        }
        return data;
    }

    /**
     * 批量删除父类
     * @param fatherIds
     * @return
     */
    @Override
    public Map<String, Object> deleteGoodFatherTypeByIds(String fatherIds) {
        Map<String,Object> data = new HashMap<>();

        String[] fatherId = fatherIds.split("，");
        int count = 0;
        for(int i = 0; i < fatherId.length; i++){
            fatherMapper.deleteByPrimaryKey(fatherId[i]);
            count++;
        }
        if(count > 0) {
            data.put("success", true);
            data.put("msg", "批量删除商品父类类目 成功");
        } else {
            data.put("success", false);
            data.put("msg", "批量删除商品父类类目 失败");
        }
        return data;
    }

    /**
     * 批量删除子类
     * @param sonIds
     * @return
     */
    @Override
    public Map<String, Object> deleteGoodSonTypeByIds(String sonIds) {
        Map<String,Object> data = new HashMap<>();

        String[] sonId = sonIds.split("，");
        int count = 0;
        for(int i = 0; i < sonId.length; i++){
            sonMapper.deleteByPrimaryKey(sonId[i]);
            count++;
        }
        if(count > 0) {
            data.put("success", true);
            data.put("msg", "批量删除商品子类类目 成功 ");
        } else {
            data.put("success", false);
            data.put("msg", "批量删除商品子类类目 失败");
        }
        return data;
    }
}
