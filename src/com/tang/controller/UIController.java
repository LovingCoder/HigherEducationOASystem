package com.tang.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.tang.interceptor.LoginInterceptor;

/**
 * Created by Tang on 2016/5/3.
 * 页面跳转控制器
 */
@Before(LoginInterceptor.class)
public class UIController extends CollegeController {

    /**
     * 上传任务书页面
     */
    @ActionKey("/UI/uploadTaskbookUI")
    public void uploadTaskbookUI(){
        render("/page/taskbook/upload.jsp");
    }

    /**
     * 任务书列表页面
     */
    @ActionKey("/UI/queryTaskbookUI")
    public void queryTaskbookUI(){
        render("/page/taskbook/query.jsp");
    }

    /**
     * 添加教师页面
     */
    @ActionKey("/UI/addTeacherUI")
    public void addTeacherUI(){
        render("/page/teacher/add.jsp");
    }

    /**
     * 教师列表页面
     */
    @ActionKey("/UI/queryTeacherUI")
    public void queryTeacherUI(){
        render("/page/teacher/query.jsp");
    }

    /**
     * 教师详情页面
     */
    @ActionKey("/UI/detailTeacherUI")
    public void detailTeacherUI(){
        setAttr("teacherId",getPara("teacherId"));
        render("/page/teacher/detail.jsp");
    }

    /**
     * 选课页面
     */
    @ActionKey("/UI/chooseTaskbookUI")
    public void chooseTaskbookUI(){
        render("/page/mytaskbook/chooseTaskbook.jsp");
    }

    /**
     * 我的选课列表页面
     */
    @ActionKey("/UI/queryMyTaskbookUI")
    public void queryMyTaskbookUI(){
        render("/page/mytaskbook/query.jsp");
    }

    /**
     * 课程被选情况列表
     */
    @ActionKey("/UI/taskbookStatusUI")
    public void taskbookStatusUI(){
        render("/page/teacherTaskbookStatus/taskbookStatus.jsp");
    }

    /**
     * 教师选课情况列表
     */
    @ActionKey("/UI/teacherStatusUI")
    public void teacherStatusUI(){
        render("/page/teacherTaskbookStatus/teacherStatus.jsp");
    }

    /**
     * 新建事务页面
     */
    @ActionKey("/UI/addDailyWorkUI")
    public void addDailyWorkUI(){
        render("/page/dailyWork/add.jsp");
    }

    /**
     * 事务列表页面
     */
    @ActionKey("/UI/queryDailyWorkUI")
    public void queryDailyWorkUI(){
        render("/page/dailyWork/query.jsp");
    }

    /**
     * 完善用户信息
     */
    @ActionKey("/UI/completUserUI")
    public void completUserUI(){
        render("/page/user/complet.jsp");
    }
}
