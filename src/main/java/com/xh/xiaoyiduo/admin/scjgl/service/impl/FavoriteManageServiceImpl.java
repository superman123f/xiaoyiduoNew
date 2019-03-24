package com.xh.xiaoyiduo.admin.scjgl.service.impl;

import com.xh.xiaoyiduo.admin.scjgl.dao.B_GOOD_FAVORITE_FolderMapper;
import com.xh.xiaoyiduo.admin.scjgl.pojo.B_GOOD_FAVORITE_FOLDER;
import com.xh.xiaoyiduo.admin.scjgl.service.IFavoriteManageService;
import com.xh.xiaoyiduo.admin.spgl.dao.B_GOODMapper;
import com.xh.xiaoyiduo.admin.spgl.pojo.B_GOOD;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.security.auth.Subject;
import java.math.BigDecimal;
import java.util.List;

/**
 */
@Service("favoriteManageService")
public class FavoriteManageServiceImpl implements IFavoriteManageService {

    @Autowired
    B_GOOD_FAVORITE_FolderMapper folderMapper;
    @Autowired
    B_GOODMapper B_GOODMapper;

    @Override
    public int deleteByPrimaryKey(String goodId, String userId) {
        return folderMapper.deleteByPrimaryKey(goodId, userId);
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

    @Override
    public int deleteFolderItemByFolderId(String goodId, String userId) {
//        S_USER currentUser = (S_USER)SecurityUtils.getSubject();
        int i = 0;
//        if(currentUser != null) {
//            B_GOOD_FAVORITE_FOLDER folder =folderMapper.selectByGoodId(goodId);
//            String goodId = folder.getGoodId();
            B_GOOD good = B_GOODMapper.selectByPrimaryKey(goodId);
            BigDecimal num = new BigDecimal(1);
            good.setCollectNumber(good.getCollectNumber().subtract(num)); //减去收藏量
            B_GOODMapper.updateByPrimaryKeySelective(good);
            i = folderMapper.deleteByPrimaryKey(goodId, userId);
//        }
        return i;
    }
}
