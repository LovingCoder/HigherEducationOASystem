package com.tang.util;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.tang.model.User;

/**
 * Created by Tang on 2016/3/28.
 */
public class _MappingKit {
    public static void mapping(ActiveRecordPlugin arp){
        arp.addMapping("user","id", User.class);
    }
}
