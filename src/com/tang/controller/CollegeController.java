package com.tang.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.tang.bean.RequestBean;
import com.tang.model.College;
import com.tang.util.RequestBeanKit;
import com.tang.util.ResponseBeanKit;
import com.tang.util.SysConstant;

/**
 * 学院相关Controller
 *
 * Created by Tang on 2016/4/25.
 */
public class CollegeController extends Controller{

    /**
     * 新增学院
     */
    @ActionKey("/college/addCollege")
    @Before(Tx.class)
    public void addCollege() throws Exception{
        HttpKit.setCharSet("utf-8");
        RequestBean requestBean = RequestBeanKit.getRequestBean(getRequest());
        String schoolId = getSession().getAttribute("schoolId").toString();
        Boolean result = College.dao.saveCollegeInfo(requestBean,schoolId);
        if (result){
            renderJson(ResponseBeanKit.responseBean(SysConstant.CODE.SUCCESS,SysConstant.COLLEGE.ADDSUCCESS,null,null));
        }else {
            renderJson(ResponseBeanKit.responseBean(SysConstant.CODE.FAIL,SysConstant.COLLEGE.ADDFAIL,null,null));
        }
    }

}
