package com.tang.handler;

import com.jfinal.handler.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Tang on 2016/4/21.
 */
public class LoginHandler extends Handler {

    public LoginHandler() {
        super();
    }

    @Override
    public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
        //如果路径中不包含register 或者 login (该路径下所有资源),那么验证身份,通过验证才能进入后台管理模块
        if (!target.contains("register") || !target.contains("login") || !target.contains("index")) {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                //验证不成功，跳转到用户登陆页面
                target = "/index";
            }
        }
        nextHandler.handle(target, request, response, isHandled);
    }
}
