package com.tang.controller;

import com.jfinal.core.Controller;
import com.tang.model.College;

/**
 * 学院相关Controller
 *
 * Created by Tang on 2016/4/25.
 */
public class CollegeController extends Controller{

    /**
     * 新增学院
     */
    public void addCollegeController(){
        String collegeName = getPara("collegeName");
        String collegeDes = getPara("collegeDes");
        String schoolId = getSession().getAttribute("schoolId").toString();
        Boolean result = College.dao.saveCollegeInfo(collegeName,collegeDes,schoolId);
        if (result){
            render("");
        }else {
            render("");
        }
    }

}
