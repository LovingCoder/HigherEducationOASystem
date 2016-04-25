package com.tang.bean;
import java.util.Date;
import java.util.LinkedHashMap;

/**
 * Created by Administrator on 2015/12/25.
 */
public class RequestBean {
    private String        sessionId      = "";
    private String        requestId      = "";
    private Date          requestTime    = new Date();
    private PageInfo pageInfo = new PageInfo();
    private LinkedHashMap requestContent = new LinkedHashMap();

    public LinkedHashMap getRequestContent() {
        return requestContent;
    }

    public RequestBean setRequestContent(LinkedHashMap requestContent) {
        this.requestContent = requestContent;
        return this;
    }

    public Date getRequestTime() {
        return requestTime;
    }

    public RequestBean setRequestTime(Date requestTime) {
        this.requestTime = requestTime;
        return this;
    }

    public String getSessionId() {
        return sessionId;
    }

    public RequestBean setSessionId(String sessionId) {
        this.sessionId = sessionId;
        return this;
    }

    public String getRequestId() {
        return requestId;
    }

    public RequestBean setRequestId(String requestId) {
        this.requestId = requestId;
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
