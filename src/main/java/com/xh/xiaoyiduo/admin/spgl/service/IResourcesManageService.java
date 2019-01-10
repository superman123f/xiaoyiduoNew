package com.xh.xiaoyiduo.admin.spgl.service;

import com.xh.xiaoyiduo.admin.spgl.pojo.RESOURCES;

/**
 */
public interface IResourcesManageService {

    int deleteByPrimaryKey(String userId); // 删除资源文件, type为0,表示头像资源文件

    int insert(RESOURCES resources); // 保存资源文件

}
