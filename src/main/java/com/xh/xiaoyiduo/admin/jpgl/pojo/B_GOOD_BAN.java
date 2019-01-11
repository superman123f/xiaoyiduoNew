package com.xh.xiaoyiduo.admin.jpgl.pojo;

public class B_GOOD_BAN {
    private String banId;

    private String banName;

    public String getBanId() {
        return banId;
    }

    public void setBanId(String banId) {
        this.banId = banId == null ? null : banId.trim();
    }

    public String getBanName() {
        return banName;
    }

    public void setBanName(String banName) {
        this.banName = banName == null ? null : banName.trim();
    }
}