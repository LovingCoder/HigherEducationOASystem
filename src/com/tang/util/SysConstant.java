package com.tang.util;

import org.omg.CORBA.PUBLIC_MEMBER;

/**
 * Created by Tang on 2016/4/20.
 * 系统常量配置
 */
public class SysConstant {

    /**
     * 删除状态
     */
    public static class ISDELETE{
        // 0是未删除
        public static final int NO = 0;
        // 1是已删除
        public static final int YES = 1;
    }

    /**
     * 用户角色
     */
    public static class USERROLE{
        //0 是系主任
        public static final int ADMINTEACHER = 0;
        //1 是普通教师
        public static final int COMMONTEACHER = 1;

        //权限不足提示
        public static final String PERMISSIONDENIED = "权限不足，无法进行该操作！";
    }

    /**
     * 响应状态
     */
    public static class CODE{
        // 0 是成功
        public static final int SUCCESS = 0;
        //1 是失败
        public static final int FAIL = 1;
    }

    /**
     * 用户登录返回提示
     */
    public static class LOGIN{
        public static final String ERROR = "用户名或密码错误！";
    }

    /**
     * 注册失败提示
     */
    public static class REGISTER{
        public static final String ERROR = "注册用户失败！";
    }

    /**
     * 学院相关的常量
     */
    public static class COLLEGE{
        public static final String ADDSUCCESS = "新增学院信息成功！";
        public static final String ADDFAIL = "新增学院信息失败！";
        public static final String DETAILSUCCESS = "获取学院信息详情成功！";
        public static final String DETAILFAIL = "获取学院信息详情失败！";
    }

    /**
     * 任务书返回提示
     */
    public static class TASKBOOK{
        public static final String UPLOADSUCCESS = "上传任务书成功！";
        public static final String UPLOADFAIL = "上传任务书失败！";
        public static final String QUERYSUCCESS = "获取任务书列表成功！";
        public static final String QUERYFAIL = "获取任务书列表失败！";
        public static final String ALLCHOOSEN = "没有可选课程！";
        public static final String TASKBOOKISCHOOSEN = "该课程已被其他教师选定！";
        public static final String TASKBOOKISCHOOSENCANCEL = "您取消了选择该课程！";
        public static final String TASKBOOKISCHOOSENCANCELFAIL = "取消课程失败！";
    }

    /**
     * 学校返回提示
     */
    public static class SCHOOL{
        public static final String NOTFINDTHISSCHOOL = "没有找到该学校！";
    }

    /**
     * 日期格式
     */
    public static class TIMEFORMAT{
        public static final String yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss";
        public static final String yyyyMMddHHmm = "yyyy-MM-dd HH:mm";
        public static final String yyyyMMdd = "yyyy-MM-dd";
    }

    /**
     * 教师返回提示
     */
    public static class TEACHER{
        public static final String ADDSUCCESS = "添加教师成功！";
        public static final String ADDFAIL = "添加教师失败！";
        public static final String QUERYTEACHERNULL = "没有教师！";
        public static final String TEACHERNOTEXIST = "教师不存在！";
        public static final String DELETESUCCESS = "删除教师成功！";
        public static final String DELETEFAIL = "删除教师失败！";
        public static final String COMPLETSUCCESS = "完善用户成功！";
        public static final String COMPLETFAIL = "完善用户信息失败！";
        public static final String UPDATESUCCESS = "更新教师信息成功！";
        public static final String UPDATEFAIL = "更新教师信息失败！";
    }

    /**
     * 办公事务提示
     */
    public static class DAILYWORK{
        public static final String ADDSUCCESS = "新建事务成功！";
        public static final String QUERYFAIL = "没有事务！";
        public static final String DELETESUCCESS = "已删除！";
        public static final String DELETEFAIL = "删除失败！";
    }

    /**
     * 选课提示
     */
    public static class CHOOSETASKBOOK{
        public static final String TASKBOOKISNULL = "您没有选择任何课程！";
    }

    /**
     * 用户相关信息
     */
    public static class USER{
        public static final String DEFAULTPWD = "123456";
    }
}
