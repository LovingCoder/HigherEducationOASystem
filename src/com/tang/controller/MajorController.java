package com.tang.controller;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.plugin.activerecord.Record;
import com.tang.bean.RequestBean;
import com.tang.model.Major;
import com.tang.util.RecordKit;
import com.tang.util.RequestBeanKit;
import com.tang.util.ResponseBeanKit;
import com.tang.util.SysConstant;

import java.util.List;

/**
 * Created by Tang on 2016/5/4.
 */
public class MajorController extends Controller{

    /**
     * 获取该学校 该学院下的所有专业
     */
    @ActionKey("/major/queryMajor")
    public void queryMajor(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        List<Record> recordList = Major.dao.queryMajor(requestBean);
        JSONObject responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS, null, RecordKit.listRecordToMap(recordList), null);
        System.out.println("/major/queryMajor---"+responseObject);
        renderJson(responseObject);
    }

}
