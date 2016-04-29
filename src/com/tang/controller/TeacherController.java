

package com.tang.controller;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.tang.interceptor.LoginInterceptor;

/**
 * Created by Tang on 2016/4/21.
 */
@Before(LoginInterceptor.class)
public class TeacherController extends Controller {
    // 添加教师界面，跳转到添加教师界面
    @ActionKey("/teacher/addTeacherUI")
    public void addTeacherUI() {
        render("addTeacher.jsp");
    }


    // 添加教师
    public void addTeacher() {
        // 添加教师

        if(true){ // 如果添加教师成功，重定向到查看教师列表界面

        }

        // 添加教师失败进行其他业务处理
    }

    // 查看教师列表
    @ActionKey("/teacher/queryTeacher")
    public void queryTeacher(){
        render("queryTeacher.jsp");
    }
}
