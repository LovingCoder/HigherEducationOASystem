package com.tang.util;

import com.google.common.base.Preconditions;
import com.tang.bean.RequestBean;

/**
 * 参数工具类
 * Created by Tang on 2016/4/27.
 */
public class ParamKit {

    /***
     * 检测传递的参数是否存在
     *
     * @param requestBean
     * @param parm
     * @return
     */
    public static String checkObjectNotNull(RequestBean requestBean, String parm) {
        String parmNotNull = null;
        try {
            Object object = Preconditions.checkNotNull(requestBean.getRequestContent().get(parm));
            parmNotNull = object.toString();
        } catch (Exception e) {

        }
        return parmNotNull;
    }
}
