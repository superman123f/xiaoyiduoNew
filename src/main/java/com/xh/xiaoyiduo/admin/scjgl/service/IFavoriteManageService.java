package com.xh.xiaoyiduo.admin.scjgl.service;

import com.xh.xiaoyiduo.admin.scjgl.pojo.B_GOOD_FAVORITE_FOLDER;

import java.util.List;

/**
 */
public interface IFavoriteManageService {
    int insert(B_GOOD_FAVORITE_FOLDER folder); //收藏商品
    int deleteByPrimaryKey(String goodId, String userId); //取消收藏
    boolean queryGoodInFolder(String currentUserId, String goodId); // 查询该商品是否在收藏夹中,交给mapper判断，要确保数据的唯一性，否则count>1时，为false
    List<B_GOOD_FAVORITE_FOLDER> getFavoriteFolderByUserId(String userId);//获取收藏夹内容
    int deleteFolderItemByFolderId(String goodId, String userId);
}
