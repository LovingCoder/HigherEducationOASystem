package com.tang.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.tang.interceptor.LoginInterceptor;

/**
 * Created by Tang on 2016/4/21.
 */
@Before(LoginInterceptor.class)
public class TeacherController extends Controller {


}
