package com.tang.util;

import com.tang.entity.TaskBookExcel;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ImportParams;

import java.io.File;
import java.util.List;

/**
 * Created by Tang on 2016/4/15.
 *
 * 读取任务书Excel工具类
 *
 */
public class TaskExcelKit {

    public static List<TaskBookExcel> readTaskExcel(File file){
        ImportParams params = new ImportParams();
        params.setTitleRows(2);
        return ExcelImportUtil.importExcel(file, TaskBookExcel.class, params);
    }
}
