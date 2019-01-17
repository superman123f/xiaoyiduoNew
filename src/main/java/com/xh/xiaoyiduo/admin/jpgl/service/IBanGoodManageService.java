package com.xh.xiaoyiduo.admin.jpgl.service;

import com.xh.xiaoyiduo.admin.jpgl.pojo.B_GOOD_BAN;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 */
public interface IBanGoodManageService {
    int deleteByPrimaryKey(String banId); // 删除禁品

    int insert(B_GOOD_BAN record); // 添加禁品

    B_GOOD_BAN selectByPrimaryKey(String banId); // 查看禁品信息

    B_GOOD_BAN selectByBanLabel(String banLabel); // 根据标签查询禁品信息

    Integer getBanGoodCount(@Param("banName")String banName); // 获取禁品总数

    List<B_GOOD_BAN> getAllBanGoods( String pageSize, String currentPage, String banName); //获取所有禁品信息

    int updateBanGoodInfoByBanId(String banId, String banLabel, String banName); // 更新禁品信息
}
