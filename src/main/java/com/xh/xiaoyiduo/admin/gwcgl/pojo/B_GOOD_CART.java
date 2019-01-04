package com.xh.xiaoyiduo.admin.gwcgl.pojo;

import com.xh.xiaoyiduo.admin.spgl.pojo.RESOURCES;

import java.math.BigDecimal;
import java.util.List;

public class B_GOOD_CART {
    private String cartId;

    private String goodId;

    private String userId;

    private String goodName;

    private Double singlePrice;

    private Integer goodNumber;

    public String getCartId() {
        return cartId;
    }

    public List<RESOURCES> resources = null;

    public void setCartId(String cartId) {
        this.cartId = cartId == null ? null : cartId.trim();
    }

    public String getGoodId() {
        return goodId;
    }

    public void setGoodId(String goodId) {
        this.goodId = goodId == null ? null : goodId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName == null ? null : goodName.trim();
    }

    public Double getSinglePrice() {
        return singlePrice;
    }

    public void setSinglePrice(Double singlePrice) {
        this.singlePrice = singlePrice;
    }

    public Integer getGoodNumber() {
        return goodNumber;
    }

    public void setGoodNumber(Integer goodNumber) {
        this.goodNumber = goodNumber;
    }

    public List<RESOURCES> getResources() {
        return resources;
    }

    public void setResources(List<RESOURCES> resources) {
        this.resources = resources;
    }
}