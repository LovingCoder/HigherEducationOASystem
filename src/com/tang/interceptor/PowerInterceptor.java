package com.tang.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.tang.util.ResponseBeanKit;
import com.tang.util.SysConstant;

/**
 * Created by Tang on 2016/5/16.
 */
public class PowerInterceptor implements Interceptor {
    @Override
    public void intercept(Invocation inv) {
        JSONObject user = inv.getController().getSessionAttr("user");
        if (null == user) {
            inv.getController().redirect("/index");
        } else if (SysConstant.USERROLE.ADMINTEACHER != user.getInteger("userRole")){
            inv.getController().renderJson(ResponseBeanKit.responseBean(SysConstant.CODE.FAIL, SysConstant.USERROLE.PERMISSIONDENIED, null, null));
            inv.invoke();
        }
    }
}
