package com.tang.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import com.tang.interceptor.LoginInterceptor;
import com.tang.model.School;

import java.util.List;

/**
 * Created by Tang on 2016/4/22.
 */
public class SchoolController extends Controller {

    /**
     * 获取所有的学校列表
     */
    @Before(LoginInterceptor.class)
    @ActionKey("/school/querySchool")
    public void querySchool(){
        List<Record> schoolList = School.dao.querySchoolInfo();
        setAttr("schoolList",schoolList);
        redirect("");
    }

}
