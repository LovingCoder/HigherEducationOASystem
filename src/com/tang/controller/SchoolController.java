package com.tang.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.plugin.activerecord.Record;
import com.tang.bean.PageInfo;
import com.tang.bean.RequestBean;
import com.tang.interceptor.LoginInterceptor;
import com.tang.model.School;
import com.tang.util.RecordKit;
import com.tang.util.RequestBeanKit;
import com.tang.util.ResponseBeanKit;
import com.tang.util.SysConstant;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
        HttpKit.setCharSet("utf-8");
        List<Record> schoolList = School.dao.querySchoolInfo();
        setAttr("schoolList",schoolList);
        renderJson(ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,null,RecordKit.listRecordToMap(schoolList),null));
    }

}
