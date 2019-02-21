package com.xh.xiaoyiduo.admin.ddgl.pojo;

import java.math.BigDecimal;

public class B_GOOD_ORDER_DETAIL {
    private String detailId;

    private String orderId;

    private String goodId;

    private Double singlePrice;

    private BigDecimal goodNumber;

    private Double kindTotalPrice;

    public String getDetailId() {
        return detailId;
    }

    public void setDetailId(String detailId) {
        this.detailId = detailId == null ? null : detailId.trim();
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getGoodId() {
        return goodId;
    }

    public void setGoodId(String goodId) {
        this.goodId = goodId == null ? null : goodId.trim();
    }

    public Double getSinglePrice() {
        return singlePrice;
    }

    public void setSinglePrice(Double singlePrice) {
        this.singlePrice = singlePrice;
    }

    public BigDecimal getGoodNumber() {
        return goodNumber;
    }

    public void setGoodNumber(BigDecimal goodNumber) {
        this.goodNumber = goodNumber;
    }

    public Double getKindTotalPrice() {
        return kindTotalPrice;
    }

    public void setKindTotalPrice(Double kindTotalPrice) {
        this.kindTotalPrice = kindTotalPrice;
    }
}