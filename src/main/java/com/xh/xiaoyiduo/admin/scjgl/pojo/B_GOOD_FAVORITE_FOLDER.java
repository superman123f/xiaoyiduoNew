package com.xh.xiaoyiduo.admin.scjgl.pojo;

public class B_GOOD_FAVORITE_FOLDER {
    private String folderId;

    private String userId;

    private String goodId;

    public String getFolderId() {
        return folderId;
    }

    public void setFolderId(String folderId) {
        this.folderId = folderId == null ? null : folderId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getGoodId() {
        return goodId;
    }

    public void setGoodId(String goodId) {
        this.goodId = goodId == null ? null : goodId.trim();
    }
}