package com.tang.bean;

import java.util.LinkedHashMap;

/**
 * Created by Administrator on 2015/12/25.
 */
public class RequestBean {
    private PageInfo pageInfo = new PageInfo();
    private LinkedHashMap requestContent = new LinkedHashMap();

    public LinkedHashMap getRequestContent() {
        return requestContent;
    }

    public RequestBean setRequestContent(LinkedHashMap requestContent) {
        this.requestContent = requestContent;
        return this;
    }
    public PageInfo getPageInfo() {
        return pageInfo;
    }

    public RequestBean setPageInfo(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
        return this;
    }
}
