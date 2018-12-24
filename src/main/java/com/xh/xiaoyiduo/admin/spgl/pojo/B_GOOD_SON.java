package com.xh.xiaoyiduo.admin.spgl.pojo;

public class B_GOOD_SON {
    private String sonId;

    private String sonName;

    private String fatherId;

    public String getSonId() {
        return sonId;
    }

    public void setSonId(String sonId) {
        this.sonId = sonId == null ? null : sonId.trim();
    }

    public String getSonName() {
        return sonName;
    }

    public void setSonName(String sonName) {
        this.sonName = sonName == null ? null : sonName.trim();
    }

    public String getFatherId() {
        return fatherId;
    }

    public void setFatherId(String fatherId) {
        this.fatherId = fatherId == null ? null : fatherId.trim();
    }
}