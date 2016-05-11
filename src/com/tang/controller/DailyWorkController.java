package com.tang.controller;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.tang.bean.PageInfo;
import com.tang.bean.RequestBean;
import com.tang.model.DailyWork;
import com.tang.util.RecordKit;
import com.tang.util.RequestBeanKit;
import com.tang.util.ResponseBeanKit;
import com.tang.util.SysConstant;

/**
 * Created by Tang on 2016/5/11.
 */
public class DailyWorkController extends Controller{

    /**
     * 新建事务
     */
    @Before(Tx.class)
    @ActionKey("/dailyWork/addDailyWork")
    public void addDailyWork(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Record record = DailyWork.dao.addDaiyWork(requestBean);
        JSONObject responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,null,record.getColumns(),null);
        System.out.println("/dailyWork/addDailyWork---"+responseObject);
        renderJson(responseObject);
    }

    /**
     * 事务列表
     */
    @ActionKey("/dailyWork/queryDailyWork")
    public void queryDailyWork(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Page<Record> recordPage = DailyWork.dao.queryDailyWork(requestBean);
        JSONObject responseObject;
        if (null != recordPage){
            requestBean.getPageInfo().setCount(recordPage.getTotalRow());
            requestBean.getPageInfo().setTotalPage(recordPage.getTotalPage());
            requestBean.getPageInfo().setCurrentPage(recordPage.getPageNumber());
            requestBean.getPageInfo().setPageSize(recordPage.getPageSize());
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,null, RecordKit.listRecordToMap(recordPage.getList()),requestBean.getPageInfo());
        }else {
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,null, null,requestBean.getPageInfo());
        }
        System.out.println("/dailyWork/queryDailyWork---"+responseObject);
        renderJson(responseObject);
    }

}
