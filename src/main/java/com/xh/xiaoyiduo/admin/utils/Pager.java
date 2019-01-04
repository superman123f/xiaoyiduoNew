package com.xh.xiaoyiduo.admin.utils;

import java.util.List;

/**
 * 封装分页类
 * @Param <T>
 */
public class Pager<T> {
    //当前页
    private Integer currentPage;
    //每页条数
    private Integer pageSize;
    //总记录数
    private Integer total;
    //分页数据
    List<T> data = null;

    public Pager(){}

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
