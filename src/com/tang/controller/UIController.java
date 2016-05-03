package com.tang.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.tang.interceptor.LoginInterceptor;

/**
 * Created by Tang on 2016/5/3.
 * 页面跳转控制器
 */
@Before(LoginInterceptor.class)
public class UIController extends CollegeController {

    /**
     * 上传任务书页面
     */
    @ActionKey("/UI/uploadTaskbookUI")
    public void uploadTaskbookUI(){
        render("/page/taskbook/uploadTaskBook.jsp");
    }

    /**
     * 任务书列表页面
     */
    @ActionKey("/UI/queryTaskbookUI")
    public void queryTaskbookUI(){
        render("/page/taskbook/list.jsp");
    }

    public void addTeacherUI(){
        render("/page/tacher/addTeacher.jsp");
    }

}
