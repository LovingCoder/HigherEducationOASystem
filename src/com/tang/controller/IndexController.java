package com.tang.controller;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

/**
 * Created by Tang on 2016/3/28.
 *  系统首页的控制器
 */
public class IndexController extends Controller{

    @ActionKey("/index")
    public void index(){
        render("/page/index.jsp");
    }
}
