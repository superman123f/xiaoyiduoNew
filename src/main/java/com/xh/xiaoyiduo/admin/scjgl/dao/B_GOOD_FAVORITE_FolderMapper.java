package com.xh.xiaoyiduo.admin.scjgl.dao;

import com.xh.xiaoyiduo.admin.scjgl.pojo.B_GOOD_FAVORITE_FOLDER;
import org.springframework.stereotype.Repository;

@Repository("favoriteFolderMapper")
public interface B_GOOD_FAVORITE_FolderMapper {
    int deleteByPrimaryKey(String folderId);

    int insert(B_GOOD_FAVORITE_FOLDER record);

    int insertSelective(B_GOOD_FAVORITE_FOLDER record);

    B_GOOD_FAVORITE_FOLDER selectByPrimaryKey(String folderId);

    int updateByPrimaryKeySelective(B_GOOD_FAVORITE_FOLDER record);

    int updateByPrimaryKey(B_GOOD_FAVORITE_FOLDER record);
}