package com.tang.controller;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.log.Log;
import com.jfinal.log.Log4jLog;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.tang.bean.RequestBean;
import com.tang.interceptor.LoginInterceptor;
import com.tang.model.College;
import com.tang.util.RequestBeanKit;
import com.tang.util.ResponseBeanKit;
import com.tang.util.SysConstant;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;

/**
 * 学院相关Controller
 *
 * Created by Tang on 2016/4/25.
 */
@Before(LoginInterceptor.class)
public class CollegeController extends Controller{

    /**
     * 日志输出
     */
    private Log log = Log4jLog.getLog(getClass());

    /**
     * 新增学院
     */
    @ActionKey("/college/addCollege")
    @Before(Tx.class)
    public void addCollege() throws Exception{
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        String schoolId = getSession().getAttribute("schoolId").toString();
        Boolean result = College.dao.saveCollegeInfo(requestBean, schoolId);
        JSONObject responseObject;
        if (result){
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,SysConstant.COLLEGE.ADDSUCCESS,null,null);
        }else {
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.COLLEGE.ADDFAIL,null,null);
        }
        System.out.println("/college/addCollege---"+responseObject);
        renderJson(responseObject);
    }

    /**
     * 获取当前登录教师所在的学院详情
     */
    @ActionKey("/college/getCollegeByTeacherId")
    public void getCollegeByTeacherId(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Record record = College.dao.detailCollegeInfo(requestBean);
        JSONObject responseObject;
        if (null != record){
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,SysConstant.COLLEGE.DETAILSUCCESS,record.getColumns(),null);
        }else{
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.COLLEGE.DETAILFAIL,null,null);
        }
        log.debug(JSONObject.toJSONString(responseObject));
        System.out.println("/college/getCollegeByTeacherId---" +responseObject);
        renderJson(responseObject);
    }

}
