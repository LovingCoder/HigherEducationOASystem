package com.tang.bean;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by 木槿花 on 2016/5/2.
 */
public class ResponseBean {

    public int status;
    public String message;
    public Map<String,Object> responseContent = new LinkedHashMap<>();
    public PageInfo page = new PageInfo();

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getResponseContent() {
        return responseContent;
    }

    public void setResponseContent(Map<String, Object> responseContent) {
        this.responseContent = responseContent;
    }

    public PageInfo getPage() {
        return page;
    }

    public void setPage(PageInfo page) {
        this.page = page;
    }
}
