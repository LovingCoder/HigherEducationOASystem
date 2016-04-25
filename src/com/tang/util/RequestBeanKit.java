/**
 * Copyright (c) 2011-2013, kidzhou 周磊 (zhouleib1412@gmail.com)
 * <p/>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p/>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p/>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.tang.util;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.Feature;
import com.google.common.base.Strings;
import com.jfinal.kit.StrKit;
import com.tang.bean.RequestBean;
import org.apache.commons.io.IOUtils;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

public class RequestBeanKit<T> {
    Class<T> c;

    public static String getIp(HttpServletRequest request) {
        String remoteAddr = request.getHeader("X-Real-IP");
        if (remoteAddr == null) {
            remoteAddr = request.getHeader("X-Forwarded-For");
        }
        if (remoteAddr == null) {
            remoteAddr = request.getRemoteAddr();
        }
        return remoteAddr;
    }

    public static String getUrl(HttpServletRequest request) {
        String url = request.getRequestURL().toString();
        String parmas = request.getQueryString();
        if (StrKit.notBlank(parmas)) {
            url = url + "?" + parmas;
        }
        return url;
    }


    /****
     * 客户端通过 application/x-www-form-urlencoded
     * 将传递过来的参数转换成json对象
     *
     * @param request
     * @return
     */
    public static JSONObject buildJSONFromParm(HttpServletRequest request) {
        Map<String, String[]> parmMap = request.getParameterMap(); // 所有请求参数
        //还原成json
        JSONObject parmObject = new JSONObject();
        String objectKey = "";
        for (Map.Entry<String, String[]> entry : parmMap.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue()[0];
            if (key.contains("[")) {
                objectKey = key.substring(0, key.indexOf("["));
                //判定是否存在该对象
                JSONObject targetObject = new JSONObject();
                if (parmObject.containsKey(objectKey)) {
                    targetObject = parmObject.getJSONObject(objectKey);
                }
                String targetObjectKey = key.substring(key.indexOf("[") + 1, key.indexOf("]"));//里面的属性值
                targetObject.put(targetObjectKey, value);
                parmObject.put(objectKey, targetObject);
            } else {
                parmObject.put(key, value);
            }
        }
        return parmObject;
    }

    /**
     * 将请求数据转换为requestBean对象
     * @param request
     * @return
     */
    public static RequestBean getRequestBean(HttpServletRequest request){
        RequestBean requestBean;
        try{
            JSONObject jsonObject = RequestBeanKit.buildJSONFromParm(request);
            requestBean = JSONObject.parseObject(jsonObject.toJSONString(), RequestBean.class, new Feature[]{Feature.IgnoreNotMatch});
        }catch (NullPointerException e){
            return null;
        }
        return requestBean;
    }
}
