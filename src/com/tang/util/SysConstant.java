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
    }

    /**
     * 任务书返回提示
     */
    public static class TASKBOOK{
        public static final String UPLOADSUCCESS = "上传任务书成功！";
        public static final String UPLOADFAIL = "上传任务书失败！";
        public static final String QUERYSUCCESS = "获取任务书列表成功！";
        public static final String QUERYFAIL = "获取任务书列表失败！";
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
        public static final String DATE = "yyyy-MM-dd HH:mm:ss";
    }
}
