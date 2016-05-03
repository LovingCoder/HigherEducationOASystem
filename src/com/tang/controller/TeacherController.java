

package com.tang.controller;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.tang.bean.RequestBean;
import com.tang.interceptor.LoginInterceptor;
import com.tang.model.Teacher;
import com.tang.util.RequestBeanKit;

/**
 * Created by Tang on 2016/4/21.
 */
@Before(LoginInterceptor.class)
public class TeacherController extends Controller {

    /**
     * 添加教师界面，跳转到添加教师界面
     */
    @ActionKey("/teacher/addTeacherUI")
    public void addTeacherUI() {
        render("addTeacher.jsp");
    }


    /**
     * 添加教师
     * @throws Exception
     */
    @ActionKey("/teacher/addTeacher")
    @Before(Tx.class)
    public void addTeacher() throws Exception{
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Boolean result = Teacher.dao.addTeacherInfo(requestBean);
        //返回结果 成功返回0 失败返回1
        if (result){
            renderJson(new JSONObject().put("result",0));
        }else {
            renderJson(new JSONObject().put("result",1));
        }
    }

    /**
     * 查看教师列表
     */
    @ActionKey("/teacher/queryTeacher")
    public void queryTeacher(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Page<Record> recordPage = Teacher.dao.queryTeacher(requestBean);
        renderJson(recordPage);
    }
}
