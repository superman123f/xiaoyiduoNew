package com.xh.xiaoyiduo.shirotest.dao;

import com.xh.xiaoyiduo.shirotest.pojo.Module;
import org.springframework.stereotype.Repository;


@Repository
public interface ModuleMapper {
    int insert(String mid, String mname);
    int insertSelective(String mid, String mname);
    int updateByPrimaryKeySelective(String mid, String mname);
    int updateByPrimaryKeyupdateByPrimaryKey(String mid, String mname);
    int deleteByPrimaryKey(Integer mid);
    Module selectByPrimaryKey(Integer mid);
}
