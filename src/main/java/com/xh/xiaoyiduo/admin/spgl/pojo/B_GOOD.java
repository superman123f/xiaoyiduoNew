package com.xh.xiaoyiduo.admin.spgl.pojo;

import java.math.BigDecimal;

public class B_GOOD {
    private String goodId;

    private String sonId;

    private String goodName;

    private String information;

    private Double originPrice;

    private Double secondPrice;

    private String degree;

    private BigDecimal collectNumber;

    private BigDecimal goodNumber;

    private String status;

    private String sellerName;

    public String getGoodId() {
        return goodId;
    }

    public void setGoodId(String goodId) {
        this.goodId = goodId == null ? null : goodId.trim();
    }

    public String getSonId() {
        return sonId;
    }

    public void setSonId(String sonId) {
        this.sonId = sonId == null ? null : sonId.trim();
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName == null ? null : goodName.trim();
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information == null ? null : information.trim();
    }

    public Double getOriginPrice() {
        return originPrice;
    }

    public void setOriginPrice(Double originPrice) {
        this.originPrice = originPrice;
    }

    public Double getSecondPrice() {
        return secondPrice;
    }

    public void setSecondPrice(Double secondPrice) {
        this.secondPrice = secondPrice;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree == null ? null : degree.trim();
    }

    public BigDecimal getCollectNumber() {
        return collectNumber;
    }

    public void setCollectNumber(BigDecimal collectNumber) {
        this.collectNumber = collectNumber;
    }

    public BigDecimal getGoodNumber() {
        return goodNumber;
    }

    public void setGoodNumber(BigDecimal goodNumber) {
        this.goodNumber = goodNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName == null ? null : sellerName.trim();
    }
}