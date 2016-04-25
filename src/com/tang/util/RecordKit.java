package com.tang.util;

import com.jfinal.plugin.activerecord.Record;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by User on 2016/3/19.
 */
public class RecordKit {

    /**
     * 重命名Record指定列
     *
     * @param record
     * @param oldName 现有名字
     * @param newName 新名字
     */
    public static void renameColumn(Record record, String oldName, String newName) {
        Object val = record.get(oldName);
        record.set(newName, val);
        record.remove(oldName);
    }


    /**
     * 删除Record中的isDelete列
     *
     * @param record
     */
    public static void removeIsDeleteColumn(Record record) {
        record.remove("isDelete");
    }


    /**
     * 重命名Record指定列
     *
     * @param record
     * @param oldName 现有名字
     * @param newName 新名字
     */
    public static Record renameColumnByName(Record record, String oldName, String newName) {
        Object oldValue = record.get(oldName);
        record.set(newName, oldValue).getColumns().remove(oldName);
        return record;
    }

    /****
     * 删除指定的列
     *
     * @param record
     * @param columnName
     * @return
     */
    public static Record removeColumn(Record record, String columnName) {
        record.getColumns().remove(columnName);
        return record;
    }


    /****
     * 将Record对象拆分,只返回Record里面的columns对象
     *
     * @param records
     * @return
     */
    public static List<Map<String, Object>> listRecordToMap(List<Record> records) {
        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
        if (records != null || records.size() > 0) {
            for (int i = 0; i < records.size(); i++) {
                Map<String, Object> columns = records.get(i).getColumns();
                Map<String, Object> newMap = new HashMap<String, Object>();
                for (Map.Entry<String, Object> entry : columns.entrySet()) {
                    Object o = entry.getValue();
                    if (o instanceof Record) {
                        Record innerRecord = (Record) o;
                        newMap.put(entry.getKey(), innerRecord.getColumns());
                    } else {
                        newMap.put(entry.getKey(), entry.getValue());
                    }
                }
                result.add(newMap);
            }
        }
        return result;
    }

    /**
     * 将Record的column列的日期格式化为yyyyMMdd格式存储，
     * 适用于以'yyyy-MM-dd'开头的日期时间型字符串
     *
     * @param record
     * @param column
     * @return
     */
    public static Record resetDateTimeToyyyyMMdd(Record record, String column){
        Object val = record.get(column);
        if(val != null){
            String str = val.toString();
            try {
                record.set(column, str.substring(0, 10).replace("-", ""));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return  record;
    }
}
