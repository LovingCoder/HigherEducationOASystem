package com.tang.bean;

/**
 * Created by Administrator on 2015/12/25.
 */
public class PageInfo {
    private int currentPage = 1;
    private int pageSize = 10;
    private int count = 0;
    private int totalPage = 0;
    public PageInfo() {

    }
    public int getCurrentPage() {
        return currentPage;
    }
    public PageInfo setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
        return this;
    }
    public int getPageSize() {
        return pageSize;
    }
    public PageInfo setPageSize(int pageSize) {
        this.pageSize = pageSize;
        return this;
    }

    public int getCount() {
        return count;
    }

    public PageInfo setCount(int count) {
        this.count = count;
        return this;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int ggetStart() {
        return (currentPage - 1) * pageSize - 1;
    }

    public int ggetLenght() {
        return pageSize;
    }
}
