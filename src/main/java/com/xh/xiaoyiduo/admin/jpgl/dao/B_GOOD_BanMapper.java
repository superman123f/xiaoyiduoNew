package com.xh.xiaoyiduo.admin.jpgl.dao;

import com.xh.xiaoyiduo.admin.jpgl.pojo.B_GOOD_BAN;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("banMapper")
public interface B_GOOD_BanMapper {
    int deleteByPrimaryKey(String banId); // 删除禁品

    int insert(B_GOOD_BAN record); // 添加禁品

    int insertSelective(B_GOOD_BAN record);

    B_GOOD_BAN selectByPrimaryKey(String banId); // 查看禁品信息

    B_GOOD_BAN selectByBanLabel(String banLabel); // 根据英文标签查询禁品信息

    Integer getBanGoodCount(@Param("banName")String banName); // 获取禁品总数

    List<B_GOOD_BAN> getAllBanGoods(@Param("pageSize") String pageSize, @Param("currentPage")String currentPage, @Param("banName")String banName); //获取所有禁品信息

    int updateBanGoodInfoByBanId(@Param("banId")String banId, @Param("banLabel")String banLabel, @Param("banName") String banName); // 更新禁品信息

    int updateByPrimaryKeySelective(B_GOOD_BAN record);

    int updateByPrimaryKey(B_GOOD_BAN record);
}