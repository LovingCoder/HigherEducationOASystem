package com.tang.util;

import java.util.UUID;

/**
 * Created by Tang on 2016/3/28.
 */
public class IDKit {
    public static String uuid() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString().replaceAll("-", "");
    }
}
