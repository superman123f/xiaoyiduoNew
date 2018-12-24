package com.xh.xiaoyiduo.admin.spgl.pojo;

import java.util.List;

public class B_GOOD_FATHER {
    private String fatherId;

    private String fatherName;

    private List<B_GOOD_SON> goodSons = null;

    public String getFatherId() {
        return fatherId;
    }

    public void setFatherId(String fatherId) {
        this.fatherId = fatherId == null ? null : fatherId.trim();
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName == null ? null : fatherName.trim();
    }

    public List<B_GOOD_SON> getGoodSons() {
        return goodSons;
    }

    public void setGoodSons(List<B_GOOD_SON> goodSons) {
        this.goodSons = goodSons;
    }
}