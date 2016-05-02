package com.tang.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.tang.bean.PageInfo;
import com.tang.bean.ResponseBean;
import java.util.Map;

/**
 * Created by 木槿花 on 2016/5/2.
 */
public class ResponseBeanKit {

    /**
     * 返回封装成responseBean的数据
     * @param code
     * @param message
     * @param responseContent
     * @return
     */
    public static Object responseBean(int code, String message, Map<String,Object> responseContent){
        ResponseBean responseBean = new ResponseBean();
        responseBean.setStatus(code);
        responseBean.setMessage(message);
        responseBean.setResponseContent(responseContent);
        return JSON.toJSON(responseBean);
    }

    /**
     * 返回json格式的数据
     * @param code
     * @param message
     * @param responseContent
     * @param pageInfo
     * @return
     */
    public static JSONObject responseBean(int code, String message, Object responseContent, PageInfo pageInfo){
        JSONObject response = new JSONObject();
        response.put("status",code);
        response.put("message",message);
        response.put("responseContent",responseContent);
        response.put("page",pageInfo);
        return response;
    }

}
