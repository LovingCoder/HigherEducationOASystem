/**
 * Copyright (c) 2011-2013, kidzhou ���� (zhouleib1412@gmail.com)
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
import java.io.BufferedReader;
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
     * contentType 为 application/x-www-form-urlencoded
     * 读取请求中的参数
     *
     * @param request
     * @return
     */
    public static JSONObject buildJSONFromParm(HttpServletRequest request) {
        Map<String, String[]> parmMap = request.getParameterMap();
        //��ԭ��json
        JSONObject parmObject = new JSONObject();
        String objectKey = "";
        for (Map.Entry<String, String[]> entry : parmMap.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue()[0];
            if (key.contains("[")) {
                objectKey = key.substring(0, key.indexOf("["));
                JSONObject targetObject = new JSONObject();
                if (parmObject.containsKey(objectKey)) {
                    targetObject = parmObject.getJSONObject(objectKey);
                }
                String targetObjectKey = key.substring(key.indexOf("[") + 1, key.indexOf("]"));
                targetObject.put(targetObjectKey, value);
                parmObject.put(objectKey, targetObject);
            } else {
                parmObject.put(key, value);
            }
        }
        return parmObject;
    }

    /**
     * 将请求中的参数封装成bean
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

    /**
     * 获取ajax传过来的数据，转换成对应的bean
     * @param request
     * @param valueType
     * @param <T>
     * @return
     */
    public static  <T> T getRequestObject(HttpServletRequest request,Class<T> valueType)  {
        StringBuilder json = new StringBuilder();
        try{
            BufferedReader reader = request.getReader();
            String line = null;
            while((line = reader.readLine()) != null){
                json.append(line);
            }
            reader.close();
        }catch (Exception e){

        }
        System.out.println(json.toString());
        return JSONObject.parseObject(json.toString(), valueType);
    }
}
