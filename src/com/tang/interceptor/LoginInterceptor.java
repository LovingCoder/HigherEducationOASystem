package com.tang.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.plugin.activerecord.Record;

/**
 * Created by Tang on 2016/4/21.
 */
public class LoginInterceptor implements Interceptor {
    @Override
    public void intercept(Invocation inv) {
        Record user = inv.getController().getSessionAttr("user");
        if (null == user) {
            inv.getController().redirect("/index");
        } else {
            inv.invoke();
        }
    }
}
