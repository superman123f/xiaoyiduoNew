package com.xh.xiaoyiduo.admin.scjgl.service.impl;

import com.xh.xiaoyiduo.admin.scjgl.dao.B_GOOD_FAVORITE_FolderMapper;
import com.xh.xiaoyiduo.admin.scjgl.pojo.B_GOOD_FAVORITE_FOLDER;
import com.xh.xiaoyiduo.admin.scjgl.service.IFavoriteManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 */
@Service("favoriteManageService")
public class FavoriteManageServiceImpl implements IFavoriteManageService {

    @Autowired
    B_GOOD_FAVORITE_FolderMapper folderMapper;

    @Override
    public int deleteByPrimaryKey(String goodId) {
        return folderMapper.deleteByPrimaryKey(goodId);
    }

    @Override
    public int insert(B_GOOD_FAVORITE_FOLDER folder) {
        return folderMapper.insert(folder);
    }

    @Override
    public boolean queryGoodInFolder(String currentUserId, String goodId) {
        return folderMapper.queryGoodInFolder(currentUserId, goodId);
    }

    @Override
    public List<B_GOOD_FAVORITE_FOLDER> getFavoriteFolderByUserId(String userId) {
        return folderMapper.getFavoriteFolderByUserId(userId);
    }
}
