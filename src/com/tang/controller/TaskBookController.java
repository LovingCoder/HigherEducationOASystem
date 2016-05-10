package com.tang.controller;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.upload.UploadFile;
import com.tang.bean.PageInfo;
import com.tang.bean.RequestBean;
import com.tang.entity.TaskBookExcel;
import com.tang.interceptor.LoginInterceptor;
import com.tang.model.Taskbook;
import com.tang.util.*;
import org.apache.log4j.Logger;
import org.eclipse.jetty.util.thread.Timeout;

import java.util.List;
import java.util.Map;

/**
 * Created by Tang on 2016/4/7.
 */
@Before(LoginInterceptor.class)
public class TaskBookController extends Controller {

    public static final Logger log = Logger.getLogger(TaskBookController.class);

    @ActionKey("/taskbook/index")
    public void index(){
        render("/page/taskbook/query.jsp");
    }

    /**
     * 任务书列表
     */
    @ActionKey("/taskbook/list")
    public void taskBookList(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Page<Record> recordPage = Taskbook.dao.taskbookList(requestBean);
        PageInfo pageInfo = requestBean.getPageInfo();
        JSONObject responseObject;
        if (null != recordPage){
            pageInfo.setCount(recordPage.getTotalRow());
            pageInfo.setTotalPage(recordPage.getTotalPage());
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,SysConstant.TASKBOOK.QUERYSUCCESS,RecordKit.listRecordToMap(recordPage.getList()),pageInfo);
        }else {
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.TASKBOOK.UPLOADFAIL,null,pageInfo);
        }
        System.out.println("/taskbook/list---"+responseObject);
        renderJson(responseObject);
    }

    /**
     * 导入任务书信息
     * @throws Exception
     */
    @Before(Tx.class)
    @ActionKey("/taskbook/uploadTaskbook")
    public void uploadTaskbook() throws Exception{
        UploadFile uploadFile = getFile("file","uploadFiles");
        String term = getPara("term");
        List<TaskBookExcel> list = TaskExcelKit.readTaskExcel(uploadFile.getFile());
        Boolean result = Taskbook.dao.importTaskbook(list, term);
        JSONObject responseObejct;
        if (result){
            responseObejct = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,SysConstant.TASKBOOK.UPLOADSUCCESS, null,null);
        }else {
            responseObejct = ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.TASKBOOK.UPLOADFAIL,null,null);
        }
        System.out.println("/taskbook/uploadTaskbook---"+responseObejct);
        renderJson(responseObejct);
    }

    /**
     * 获取没有被教师选择的任务书 课程
     */
    @ActionKey("/taskbook/getNotChoosenTaskbook")
    public void getNotChoosenTaskbook(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Page<Record> recordPage = Taskbook.dao.getNotChoosenTaskbook(requestBean);
        JSONObject responseObject;
        if (null != recordPage){
            requestBean.getPageInfo().setTotalPage(recordPage.getTotalPage());
            requestBean.getPageInfo().setCount(recordPage.getTotalRow());
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,null,RecordKit.listRecordToMap(recordPage.getList()),requestBean.getPageInfo());
        }else {
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.TASKBOOK.ALLCHOOSEN,null,requestBean.getPageInfo());
        }
        System.out.println("/taskbook/getNotChoosenTaskbook---"+responseObject);
        renderJson(responseObject);
    }

    /**
     * 检查该课程任务书是否已被其他教师选中
     */
    @ActionKey("/taskbook/checkTaskbookIsChoosen")
    public void checkTaskbookIsChoosen(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Record record = Taskbook.dao.checkTaskbookIsChoosen(requestBean);
        JSONObject responseObject;
        //为空说明该课程没有被选中 返回该课程的信息返回0 如果不为空 则返回选择这门课程的教师 返回1
        if (null == record){
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,null,Taskbook.dao.getTaskbookById(requestBean).getColumns(),null);
        }else{
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.TASKBOOK.TASKBOOKISCHOOSEN,record.getColumns(),null);
        }
        System.out.println("/taskbook/checkTaskbookIsChoosen---"+responseObject);
        renderJson(responseObject);
    }

    /**
     * 教师勾选课程时 调用的controller
     */
    @Before(Tx.class)
    @ActionKey("/taskbook/chooseTaskbook")
    public void chooseTasbook(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Boolean result = Taskbook.dao.chooseTaskbook(requestBean);
        JSONObject responseObject;
        if (result){
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,null,null,null);
        }else {
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.TASKBOOK.TASKBOOKISCHOOSEN,null,null);
        }
        System.out.println("/taskbook/chooseTaskbook---"+responseObject);
        renderJson(responseObject);
    }

    /**
     * 选定值取消
     */
    @Before(Tx.class)
    @ActionKey("/taskbook/chooseTasbookCancel")
    public void chooseTasbookCancel(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Boolean result = Taskbook.dao.chooseTaskbookCancel(requestBean);
        JSONObject responseObject;
        if (result){
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,SysConstant.TASKBOOK.TASKBOOKISCHOOSENCANCEL,null,null);
        }else {
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.TASKBOOK.TASKBOOKISCHOOSENCANCELFAIL,null,null);
        }
        System.out.println("/taskbook/chooseTasbookCancel---"+responseObject);
        renderJson(responseObject);
    }

    /**
     * 新的教师选课（教师选完课再进行提交，不再进行异步校验，统一提交到后端再进行校验）
     */
    @Before(Tx.class)
    @ActionKey("/taskbook/newChooseTaskbook")
    public void  newChooseTaskbook(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Map<String,List<Map<String,Object>>> listMap = Taskbook.dao.newChooseTaskBook(requestBean);
        JSONObject responseObject;
        responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,null,listMap,null);
        System.out.println("/taskbook/newChooseTaskbook---"+responseObject);
        renderJson(responseObject);
    }

    /**
     * 我的选课列表
     */
    @ActionKey("/taskbook/queryMyTaskbook")
    public void queryMyTaskbook(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Page<Record> recordPage = Taskbook.dao.queryMyTaskbook(requestBean);
        PageInfo pageInfo = requestBean.getPageInfo();
        JSONObject responseObject;
        if (null != recordPage){
            pageInfo.setCount(recordPage.getTotalRow());
            pageInfo.setTotalPage(recordPage.getTotalPage());
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,SysConstant.TASKBOOK.QUERYSUCCESS,RecordKit.listRecordToMap(recordPage.getList()),pageInfo);
        }else {
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.TASKBOOK.QUERYFAIL,null,pageInfo);
        }
        System.out.println("/taskbook/queryMyTaskbook---"+responseObject);
        renderJson(responseObject);
    }
}
