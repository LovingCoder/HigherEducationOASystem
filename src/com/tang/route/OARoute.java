package com.tang.route;

import com.jfinal.config.Routes;
import com.tang.controller.*;

/**
 * Created by Tang on 2016/3/28.
 */
public class OARoute extends Routes {
    @Override
    public void config() {
        add("/", IndexController.class);
        add("/user", UserController.class);
        add("/taskbook", TaskBookController.class);
        add("/higherEducation", HigherEducationController.class);
        add("/school", SchoolController.class);
        add("/teacher",TeacherController.class);
        add("/ui",UIController.class);
        add("/class",ClassController.class);
    }
}
