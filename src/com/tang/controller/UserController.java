package com.tang.controller;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.JsonKit;
import com.jfinal.log.Log;
import com.jfinal.log.Log4jLog;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.tang.bean.PageInfo;
import com.tang.bean.RequestBean;
import com.tang.model.User;
import com.tang.util.RequestBeanKit;
import com.tang.util.ResponseBeanKit;
import com.tang.util.SysConstant;
import org.apache.log4j.Logger;


/**
 * Created by Tang on 2016/3/28.
 * 用户相关的操作
 */
public class UserController extends Controller {

    /**
     * 用户注册,默认权限是普通教师
     */
    @ActionKey("/user/register")
    @Before(Tx.class)
    public void userRegister() throws Exception{
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Record record = User.me.userRegister(requestBean);
        JSONObject responseObject;
        if (null != record){
            getSession().setAttribute("user", record.getColumns());
            record.remove("password");
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,null,record.getColumns(),null);
        }else {
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.REGISTER.ERROR,null,null);
        }
        System.out.println("/user/register---"+responseObject);
        renderJson(responseObject);
    }

    /**
     * 用户登录
     */
    @ActionKey("/user/login")
    public void userLogin(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Record record = User.me.userLogin(requestBean);
        JSONObject responseObject;
        if (null != record){
            JSONObject jsonObject = JSONObject.parseObject(JsonKit.toJson(record.getColumns()));
            getSession().setAttribute("user", jsonObject);
            getSession().setMaxInactiveInterval(60*30);
            record.remove("password");
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,null,record.getColumns(),new PageInfo());
        }else {
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.LOGIN.ERROR,null,null);
        }
        System.out.println("/user/login---"+responseObject);
        renderJson(responseObject);
    }

    /**
     * 完善用户信息
     * @throws Exception
     */
    @ActionKey("/user/complet")
    @Before(Tx.class)
    public void userComplet() throws Exception{
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        JSONObject session = JSON.parseObject(getSession().getAttribute("user").toString());
        String userId = session.getString("id");
        Boolean result = User.me.completUserInfo(requestBean, userId);
        JSONObject responseObject;
        //返回结果 成功返回0 失败返回1
        if (result){
            session.put("teacher", Db.findFirst("SELECT * FROM teacher WHERE userId = ? AND isDelete = ?", userId, SysConstant.ISDELETE.NO).getColumns());
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,SysConstant.TEACHER.COMPLETSUCCESS,null,null);
        }else {
            responseObject = ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.TEACHER.COMPLETFAIL,null,null);
        }
        System.out.println("/user/complet---"+responseObject);
        renderJson(responseObject);
    }

    /**
     * 用户注销登录
     */
    @ActionKey("/user/userLogout")
    public void userLogout(){
        getRequest().getSession().invalidate();
        redirect("/index/frame");
    }
}
