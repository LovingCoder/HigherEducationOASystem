package com.tang.controller;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.tang.bean.PageInfo;
import com.tang.bean.RequestBean;
import com.tang.model.User;
import com.tang.util.RequestBeanKit;
import com.tang.util.ResponseBeanKit;
import com.tang.util.SysConstant;


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
        if (null != record){
            getSession().setAttribute("user", record);
            record.remove("password");
            renderJson(ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,null,record.getColumns(),null));
        }else {
            renderJson(ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.REGISTER.ERROR,null,null));
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
            JSONObject jsonObject = JSONObject.parseObject(JsonKit.toJson(record.getColumns()));
            System.out.println(jsonObject);
            getSession().setAttribute("user", jsonObject);
            getSession().setMaxInactiveInterval(300);
            record.remove("password");
            renderJson(ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,null,record.getColumns(),new PageInfo()));
        }else {
            renderJson(ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.LOGIN.ERROR,null,null));
        }
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
        String userId = getSession().getAttribute("id").toString();
        Boolean result = User.me.completUserInfo(requestBean,userId);
        //返回结果 成功返回0 失败返回1
        if (result){
            renderJson(ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,null,null,null));
        }else {
            renderJson(ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,null,null,null));
        }
    }
}
