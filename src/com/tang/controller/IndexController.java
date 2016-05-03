package com.tang.controller;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.tang.interceptor.LoginInterceptor;

import javax.xml.ws.Action;

/**
 * Created by Tang on 2016/3/28.
 * 系统控制器首页
 */
@Before(LoginInterceptor.class)
public class IndexController extends Controller {

    @ActionKey("/index")
    @Clear
    public void index() {
        render("/page/index.jsp");
    }

    @ActionKey("/index/frame")
    public void frame() {
        render("/page/common/frame.jsp");
    }

    @ActionKey("/index/top")
    public void top() {
        render("/page/common/top.jsp");
    }

    @ActionKey("/index/left")
    public void left() {
        render("/page/common/left.jsp");
    }
}
