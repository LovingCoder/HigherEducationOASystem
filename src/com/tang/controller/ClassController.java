package com.tang.controller;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.plugin.activerecord.Record;
import com.tang.bean.RequestBean;
import com.tang.model.Class;
import com.tang.util.RecordKit;
import com.tang.util.RequestBeanKit;
import com.tang.util.ResponseBeanKit;
import com.tang.util.SysConstant;

import java.util.List;

/**
 * Created by Tang on 2016/5/4.
 */
public class ClassController extends Controller{

    /**
     * 获取该学校 该学院下的所有班级
     */
    @ActionKey("/class/queryClass")
    public void queryClass(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        List<Record> recordList = Class.dao.queryClass(requestBean);
        JSONObject responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS, null, RecordKit.listRecordToMap(recordList), null);
        System.out.println("/class/queryClass---"+responseObject);
        renderJson(responseObject);
    }

}
