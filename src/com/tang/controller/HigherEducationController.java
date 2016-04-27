package com.tang.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.tang.interceptor.LoginInterceptor;

/**
 * Created by Tang on 2016/4/19.
 */
@Before(LoginInterceptor.class)
public class HigherEducationController extends Controller {

    @ActionKey("/higherEducation/main")
    public void mainPage(){
        renderJsp("/page/main/main.jsp");
    }
}
