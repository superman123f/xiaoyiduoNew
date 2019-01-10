package com.xh.xiaoyiduo.admin.spgl.service.impl;

import com.xh.xiaoyiduo.admin.spgl.dao.ResourcesMapper;
import com.xh.xiaoyiduo.admin.spgl.pojo.RESOURCES;
import com.xh.xiaoyiduo.admin.spgl.service.IResourcesManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("resourcesManageService")
public class ResourcesManagerServiceImpl implements IResourcesManageService{

    @Autowired
    ResourcesMapper resourcesMapper;

    @Override
    public int deleteByPrimaryKey(String userId) {
        return resourcesMapper.deleteByPrimaryKey(userId);
    }

    @Override
    public int insert(RESOURCES resources) {
        return resourcesMapper.insert(resources);
    }
}
