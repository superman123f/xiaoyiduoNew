package com.xh.xiaoyiduo.admin.scjgl.dao;

import com.xh.xiaoyiduo.admin.scjgl.pojo.B_GOOD_FAVORITE_FOLDER;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("favoriteFolderMapper")
public interface B_GOOD_FAVORITE_FolderMapper {
    int deleteByPrimaryKey(String goodId); //取消收藏

    int insert(B_GOOD_FAVORITE_FOLDER folder); //收藏商品

    int insertSelective(B_GOOD_FAVORITE_FOLDER record);

    B_GOOD_FAVORITE_FOLDER selectByPrimaryKey(String folderId);

    List<B_GOOD_FAVORITE_FOLDER> getFavoriteFolderByUserId(String userId);//获取收藏夹内容


    boolean queryGoodInFolder(@Param("userId") String currentUserId, @Param("goodId") String goodId); // 查询该商品是否在收藏夹中,交给mapper判断，要确保数据的唯一性，否则count>1时，为false

    int updateByPrimaryKeySelective(B_GOOD_FAVORITE_FOLDER record);

    int updateByPrimaryKey(B_GOOD_FAVORITE_FOLDER record);
}