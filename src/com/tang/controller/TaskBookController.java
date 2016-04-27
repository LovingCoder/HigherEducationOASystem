package com.tang.controller;

import com.google.common.base.Strings;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.upload.UploadFile;
import com.tang.entity.TaskBookExcel;
import com.tang.interceptor.LoginInterceptor;
import com.tang.model.Taskbook;
import com.tang.util.RecordKit;
import com.tang.util.TaskExcelKit;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Tang on 2016/4/7.
 */
@Before(LoginInterceptor.class)
public class TaskBookController extends Controller {

    @ActionKey("/taskbook/index")
    public void index(){
        render("/page/taskbook/list.jsp");
    }

    /**
     * 任务书列表
     */
    @ActionKey("/taskbook/list")
    public void taskBookList(){
        String term = getPara("term");
        String courseName = getPara("courseName");
        String major = getPara("major");
        String courseProperty = getPara("courseProperty");
        int pageNumber = Strings.isNullOrEmpty(getPara("pageNumber")) ? 1 : getParaToInt("pageNumber");
        int pageSize = Strings.isNullOrEmpty(getPara("pageSize")) ? 10 : getParaToInt("pageSize");
        Page<Record> recordPage = Taskbook.dao.taskbookList(pageNumber,pageSize,courseName,courseProperty,term,major);
        System.out.println("总条数："+recordPage.getTotalRow()+"\t总页数："+recordPage.getTotalPage());
        setAttr("recordPage", recordPage);
        renderJsp("/page/taskbook/list.jsp");
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
        System.out.println(list.size());
        setAttr("taskbookList",Taskbook.dao.importTaskbook(list,term));
        redirect("/taskbook/list");
    }
}
