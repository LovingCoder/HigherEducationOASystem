package com.tang.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * Created by Tang on 2016/4/21.
 */
public class LoginInterceptor implements Interceptor {
    @Override
    public void intercept(Invocation inv) {
        JSONObject user = inv.getController().getSessionAttr("user");
        if (null == user) {
            inv.getController().redirect("/index");
        } else {
            inv.invoke();
        }
    }
}
