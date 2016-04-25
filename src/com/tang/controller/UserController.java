package com.tang.controller;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.plugin.activerecord.Record;
import com.tang.model.User;


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
        String username = getPara("username");
        String password = getPara("password");
        Record record = User.me.userRegister(username,password);
        if (null != record){
            redirect("/index");
        }else {
            renderText("注册失败");
        }
    }

    /**
     * 用户登录
     */
    @ActionKey("/user/login")
    public void userLogin(){
        HttpKit.setCharSet("utf-8");
//        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
//        String username = requestBean.getRequestContent().get("username").toString();
//        String password = requestBean.getRequestContent().get("password").toString();
        String username = getPara("username");
        String password = getPara("password");
        Record record = User.me.userLogin(username,password);
        if (null != record){
            setSessionAttr("user",record);
            redirect("/page/main/main.jsp");
        }else {
            redirect("/index");
        }
    }
}
