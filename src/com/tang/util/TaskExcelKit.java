package com.tang.util;

import com.tang.entity.TaskBookExcel;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ImportParams;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tang on 2016/4/15.
 *
 * 读取任务书Excel工具类
 *
 */
public class TaskExcelKit {

    public static List<TaskBookExcel> readTaskExcel(File file) throws Exception{
        ImportParams params = new ImportParams();
        params.setTitleRows(2);
        List<TaskBookExcel> taskBookExcelList = new ArrayList<TaskBookExcel>();
        try {
            taskBookExcelList = ExcelImportUtil.importExcel(file, TaskBookExcel.class, params);
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
        return taskBookExcelList;
    }
}
