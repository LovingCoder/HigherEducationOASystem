package com.tang.controller;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Record;
import com.tang.bean.RequestBean;
import com.tang.model.User;
import com.tang.util.RequestBeanKit;


/**
 * Created by Tang on 2016/3/28.
 * 用户相关的操作
 */
public class UserController extends Controller {

    /**
     * 用户注册
     */
    @ActionKey("/user/register")
    public void userRegister(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Record record = User.me.userRegister(requestBean);
        if (null != record){
            setSessionAttr("user", record);
            record.remove("password");
            setAttr("data",JsonKit.toJson(record.getColumns()));
            renderJson();
        }else {
            redirect("/index");
        }
    }

    /**
     * 用户登录
     */
    @ActionKey("/user/login")
    public void userLogin(){
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        Record record = User.me.userLogin(requestBean);
        if (null != record){
            setSessionAttr("user", record);
            record.remove("password");
            setAttr("data", JsonKit.toJson(record.getColumns()));
            renderJson();
        }else {
            redirect("/index");
        }
    }
}
