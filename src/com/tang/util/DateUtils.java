package com.tang.util;

import com.jfinal.kit.StrKit;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * </p>
 * Function List:<br>
 * 常用的时间操作
 *
 * @author
 * @version Revision:1.0 Date: 2010-9-15 下午05:44:00
 */
public class DateUtils {
    private static int weeks = 0;
    public static final String yearMonthDayAndDateTime = "yyyy-MM-dd HH:mm:ss";
    public static final String yearMonthDay = "yyyy-MM-dd";
    public static final String yearMonthDay_BEGIN = "yyyy-MM-dd 00:00:00";
    public static final String yearMonthDay_END = "yyyy-MM-dd 23:59:59";
    public static final String yearMonthDay_NoMiddleLine = "yyyyMMdd";

    /**
     * 计算两个日期之间的差距天数
     *
     * @param a
     * @param b
     *
     * @return
     */
    public static int cutTwoDateToDay(Date a, Date b) {
        SimpleDateFormat format = new SimpleDateFormat(yearMonthDay);
        Calendar calendar = Calendar.getInstance();
        int theday = 0;
        try {
            Date beginDate = format.parse(format.format(a));
            Date endDate = format.parse(format.format(b));

            calendar.setTime(beginDate);
            long begin = calendar.getTimeInMillis();
            calendar.setTime(endDate);
            long end = calendar.getTimeInMillis();

            theday = (int) ((end - begin) / (86400000));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return theday;
    }

    /**
     * 将数字型的时间转为字符串（80 -> 01:20）
     *
     * @param time
     *
     * @return
     */
    public static String intToTimeString(int time) {
        String hour = String.valueOf(time / 60);
        String minute = String.valueOf(time - time / 60 * 60);

        if (hour.length() < 2) {
            hour = "0" + hour;
        }
        if (minute.length() < 2) {
            minute = "0" + minute;
        }
        return hour + ":" + minute;
    }

    /**
     * 取出两个时间出较大的时间
     *
     * @param a
     * @param b
     *
     * @return
     */
    public static Date MaxDate(Date a, Date b) {
        if (a.before(b)) {
            return b;
        } else {
            return a;
        }
    }

    /**
     * 取出两个时间出较小的时间
     *
     * @param a
     * @param b
     *
     * @return
     */
    public static Date MinDate(Date a, Date b) {
        if (a.before(b)) {
            return a;
        } else {
            return b;
        }
    }

    /**
     * 计算给定日期是星期几
     *
     * @param date
     *
     * @return
     */
    public static int getWeekOfDate(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w == 0)
            w = 7;
        return w;
    }

    /**
     * 格式化时间,默认是按照yyyy-MM-dd方式
     *
     * @param date
     *
     * @return
     */
    public static String formatDate(Date date) {
        SimpleDateFormat format = new SimpleDateFormat(DateUtils.yearMonthDay);
        return format.format(date);
    }

    /**
     * 格式化日期
     *
     * @param date
     * @param pattern
     *
     * @return
     */
    public static String formatDate(Date date, String pattern) {
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        return format.format(date);
    }

    public static java.sql.Timestamp getTimestamp(String dateTimeFormater, String format) {
        Date date = parseDate(dateTimeFormater, format);
        return new java.sql.Timestamp(date.getTime());
    }

    public static Date parseDate(String dateTime, String format) {
        Date result = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            result = sdf.parse(dateTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 根据给定日期字符串和日期格式 创建日期
     *
     * @param dateString
     * @param pattern
     *
     * @return
     *
     * @throws ParseException
     */
    public static Date createDate(String dateString, String pattern) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        return format.parse(dateString);
    }

    /**
     * 返回指定年数位移后的日期
     */
    public static Date yearOffset(Date date, int offset) {
        return offsetDate(date, Calendar.YEAR, offset);
    }

    /**
     * 返回指定月数位移后的日期
     */
    public static Date monthOffset(Date date, int offset) {
        return offsetDate(date, Calendar.MONTH, offset);
    }

    /**
     * 返回指定天数位移后的日期
     */
    public static Date dayOffset(Date date, int offset) {
        return offsetDate(date, Calendar.DATE, offset);
    }

    /**
     * 返回指定日期相应位移后的日期
     *
     * @param date   参考日期
     * @param field  位移单位，见 {@link Calendar}
     * @param offset 位移数量，正数表示之后的时间，负数表示之前的时间
     *
     * @return 位移后的日期
     */
    public static Date offsetDate(Date date, int field, int offset) {
        Calendar calendar = convert(date);
        calendar.add(field, offset);
        return calendar.getTime();
    }

    private static Calendar convert(Date date) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        return calendar;
    }

    /**
     * 生成随机时间
     *
     * @param beginDate
     * @param endDate
     * @param type
     *
     * @return
     */
    public static String getRandomDate(String beginDate, String endDate, String type) {
        try {
            SimpleDateFormat format = new SimpleDateFormat(type);
            Date start = format.parse(beginDate);
            Date end = format.parse(endDate);
            if (start.getTime() > end.getTime()) {
                return null;
            } else if (start.getTime() == end.getTime()) {
                return beginDate;
            }
            long longdate = random(start.getTime(), end.getTime());
            Date resultdate = new Date(longdate);
            String date = DateUtils.formatDate(resultdate, type);
            return date;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private static long random(long begin, long end) {
        long rtnn = begin + (long) (Math.random() * (end - begin));
        if (rtnn == begin || rtnn == end) {
            return random(begin, end);
        }
        return rtnn;
    }

    public static String getCurrentDate(String format) {
        SimpleDateFormat df = new SimpleDateFormat(format);
        return df.format(new Date());
    }

    public static String getCurrentDate() {
        SimpleDateFormat df = new SimpleDateFormat(yearMonthDayAndDateTime);
        return df.format(new Date());
    }

    /**
     * 根据格式串获取昨天时间
     */
    public static String getYestorDay(String format) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -1);
        Date d = cal.getTime();

        SimpleDateFormat sp = new SimpleDateFormat(format);
        return sp.format(d);//获取昨天日期
    }

    // 获得当前日期与本周日相差的天数
    private static int getMondayPlus() {
        Calendar cd = Calendar.getInstance();
        // 获得今天是一周的第几天，星期日是第一天，星期二是第二天......
        int dayOfWeek = cd.get(Calendar.DAY_OF_WEEK) - 1; // 因为按中国礼拜一作为第一天所以这里减1
        if (dayOfWeek == 1) {
            return 0;
        } else {
            return 1 - dayOfWeek;
        }
    }

    // 获得指定日期所在周的周一日期
    public static String getFirstDayOFWeek(String strDate) {
        weeks = 0;
        int mondayPlus = DateUtils.getMondayByDate(strDate);
        GregorianCalendar currentDate = new GregorianCalendar();
        currentDate.add(GregorianCalendar.DATE, mondayPlus);
        Date monday = currentDate.getTime();
        DateFormat df = DateFormat.getDateInstance();
        String preMonday = df.format(monday);
        return preMonday;
    }

    // 获得指定日期所在周的周末日期
    public static String getLastDayOfWeek(String strDate) {
        int mondayPlus = DateUtils.getMondayByDate(strDate);
        GregorianCalendar currentDate = new GregorianCalendar();
        currentDate.setTime(DateUtils.strToDate(strDate));
        currentDate.add(GregorianCalendar.DATE, mondayPlus + 7 * weeks + 6);
        Date monday = currentDate.getTime();
        DateFormat df = DateFormat.getDateInstance();
        String preMonday = df.format(monday);
        return preMonday;
    }

    public static int getMondayByDate(String strDate) {
        Date date = DateUtils.strToDate(strDate);
        Calendar cl = Calendar.getInstance();
        cl.setTime(date);
        int dayOfWeek = cl.get(Calendar.DAY_OF_WEEK) - 1; // 因为按中国礼拜一作为第一天所以这里减1
        if (dayOfWeek == 1) {
            return 0;
        } else {
            return 1 - dayOfWeek;
        }
    }

    public static Date strToDate(String strDate) {
        SimpleDateFormat formatter = new SimpleDateFormat(yearMonthDay);
        ParsePosition pos = new ParsePosition(0);
        Date strtodate = formatter.parse(strDate, pos);
        return strtodate;
    }

    // 获取当月第一天
    public static String getFirstDayOfMonth() {
        String str = "";
        SimpleDateFormat sdf = new SimpleDateFormat(yearMonthDay);
        Calendar lastDate = Calendar.getInstance();
        lastDate.set(Calendar.DATE, 1);// 设为当前月的1号
        str = sdf.format(lastDate.getTime());
        return str;
    }

    // 计算当月最后一天,返回字符串
    public static String getLastDayOfMonth() {
        String str = "";
        SimpleDateFormat sdf = new SimpleDateFormat(yearMonthDay);

        Calendar lastDate = Calendar.getInstance();
        lastDate.set(Calendar.DATE, 1);// 设为当前月的1号
        lastDate.add(Calendar.MONTH, 1);// 加一个月，变为下月的1号
        lastDate.add(Calendar.DATE, -1);// 减去一天，变为当月最后一天

        str = sdf.format(lastDate.getTime());
        return str;
    }

    public static String getTwoDateJg(String sj1, String sj2) {
        SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        long mm = 0;
        try {
            Date date = myFormatter.parse(sj1);
            Date mydate = myFormatter.parse(sj2);
            mm = (date.getTime() - mydate.getTime()) / (60 * 1000);
        } catch (Exception e) {
            return "";
        }
        return mm + "";
    }

    public static String getTwoDateJg(String sj1, String sj2, String formatter) {
        SimpleDateFormat myFormatter = new SimpleDateFormat(formatter);
        long mm = 0;
        try {
            Date date = myFormatter.parse(sj1);
            Date mydate = myFormatter.parse(sj2);
            mm = (date.getTime() - mydate.getTime()) / (60 * 1000);
        } catch (Exception e) {
            return "";
        }
        return mm + "";
    }

    /**
     * *
     * 获取两个时间的间隔
     *
     * @param begin     开始时间
     * @param end       结束时间
     * @param formatter 格式化参数,无法不填写,默认为yyyy-MM-dd
     *
     * @return
     */
    public static int getTwoDateJG(Date begin, Date end, String formatter) {
        SimpleDateFormat myFormatter = null;
        if (StrKit.isBlank(formatter)) {
            myFormatter = new SimpleDateFormat(DateUtils.yearMonthDay);
        } else {
            myFormatter = new SimpleDateFormat(formatter);
        }

        int result = 0;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            cal.setTime(begin);
            long time1 = cal.getTimeInMillis();
            cal.setTime(end);
            long time2 = cal.getTimeInMillis();
            long between_days = (time2 - time1) / (1000 * 3600 * 24);

            result = Integer.parseInt(String.valueOf(between_days));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * *
     * 获取两个时间的间隔,默认返回的是天数
     *
     * @param begin     开始时间
     * @param end       结束时间
     * @param formatter 格式化参数,无法不填写,默认为yyyy-MM-dd
     *
     * @return
     */
    public static int getTwoDateJG(String begin, String end, String formatter) {
        SimpleDateFormat myFormatter = null;
        if (StrKit.isBlank(formatter)) {
            myFormatter = new SimpleDateFormat(DateUtils.yearMonthDay);
        } else {
            myFormatter = new SimpleDateFormat(formatter);
        }

        int result = 0;
        try {
            Date beginDate = myFormatter.parse(begin);
            Date endDate = myFormatter.parse(end);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            cal.setTime(beginDate);
            long time1 = cal.getTimeInMillis();
            cal.setTime(endDate);
            long time2 = cal.getTimeInMillis();
            long between_days = (time2 - time1) / (1000 * 3600 * 24);

            result = Integer.parseInt(String.valueOf(between_days));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * *
     * 获取两个时间的间隔,默认返回的是天数
     *
     * @param begin     开始时间
     * @param end       结束时间
     * @param formatter 格式化参数,无法不填写,默认为yyyy-MM-dd
     *
     * @return
     */
    public static int getTwoDateJGHour(String begin, String end, String formatter) {
        SimpleDateFormat myFormatter = null;
        if (StrKit.isBlank(formatter)) {
            myFormatter = new SimpleDateFormat(DateUtils.yearMonthDay);
        } else {
            myFormatter = new SimpleDateFormat(formatter);
        }

        int result = 0;
        try {
            Date beginDate = myFormatter.parse(begin);
            Date endDate = myFormatter.parse(end);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            cal.setTime(beginDate);
            long time1 = cal.getTimeInMillis();
            cal.setTime(endDate);
            long time2 = cal.getTimeInMillis();
            long between_days = (time2 - time1) / (1000 * 3600);

            result = Integer.parseInt(String.valueOf(between_days));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    /**
     * @param sqjzksrq 时间字符串
     * @param mm       字符串格式
     *
     * @return
     */
    public static Object getDateByFormart(String sqjzksrq, String mm) {
        Date date = DateUtils.parseDate(sqjzksrq, "yyyy-MM-dd");
        SimpleDateFormat myFormatter = new SimpleDateFormat(mm);
        return myFormatter.format(date);
    }

    /**
     * 获取当前星期
     *
     * @return
     */
    public static String getCurrentWeek(String interFlag) {
        return getCurrentWeekBegin() + interFlag + getCurrentWeekEnd();
    }


    /**
     * 获取当前周开始
     *
     * @return
     */
    public static String getCurrentWeekBegin() {
        Calendar currentDate = new GregorianCalendar();
        currentDate.setFirstDayOfWeek(Calendar.MONDAY);
        currentDate.set(Calendar.HOUR_OF_DAY, 0);
        currentDate.set(Calendar.MINUTE, 0);
        currentDate.set(Calendar.SECOND, 0);
        currentDate.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        Date dateCursor = (Date) currentDate.getTime().clone();
        SimpleDateFormat myFormatter = new SimpleDateFormat(DateUtils.yearMonthDay);
        return myFormatter.format(dateCursor);
    }

    /**
     * 获取当前周结束
     *
     * @return
     */
    public static String getCurrentWeekEnd() {
        Calendar currentDate = new GregorianCalendar();
        currentDate.setFirstDayOfWeek(Calendar.MONDAY);
        currentDate.set(Calendar.HOUR_OF_DAY, 23);
        currentDate.set(Calendar.MINUTE, 59);
        currentDate.set(Calendar.SECOND, 59);
        currentDate.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
        Date dateCursor = (Date) currentDate.getTime().clone();
        SimpleDateFormat myFormatter = new SimpleDateFormat(DateUtils.yearMonthDay);
        return myFormatter.format(dateCursor);
    }


    /**
     * 获取指定时间是当年的第几周
     *
     * @return
     */
    public static int getWeekNumberInYear() {
        SimpleDateFormat format = new SimpleDateFormat(DateUtils.yearMonthDay);
        Date date = null;
        try {
            date = format.parse(getCurrentWeekBegin());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setFirstDayOfWeek(Calendar.MONDAY);
        calendar.setTime(date);
        return calendar.get(Calendar.WEEK_OF_YEAR);
    }

    /**
     * 根据日期获得所在周的日期
     *
     * @param date 给定时间
     *
     * @return
     */
    @SuppressWarnings("deprecation")
    public static List<Date> getWeekdays(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);

        Calendar calendar = Calendar.getInstance();
        while (calendar.get(Calendar.DAY_OF_WEEK) != Calendar.MONDAY) {
            calendar.add(Calendar.DATE, -1);
        }
        List<Date> weekList = new ArrayList<Date>();
        for (int i = 0; i < 7; i++) {
            weekList.add(calendar.getTime());
            calendar.add(Calendar.DATE, 1);
        }
        return weekList;
    }


    /**
     * 根据日期获得所在周的日期
     *
     * @param date      给定的时间
     * @param formatter 格式化参数
     *
     * @return
     */
    public static List<String> getWeekdays(Date date, String formatter) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);

        SimpleDateFormat dateFormat = new SimpleDateFormat(formatter);
        Calendar calendar = Calendar.getInstance();
        while (calendar.get(Calendar.DAY_OF_WEEK) != Calendar.MONDAY) {
            calendar.add(Calendar.DATE, -1);
        }
        List<String> weekList = new ArrayList<String>();
        for (int i = 0; i < 7; i++) {
            weekList.add(dateFormat.format(calendar.getTime()));
            calendar.add(Calendar.DATE, 1);
        }
        return weekList;
    }

    /**
     * *
     * 获取当前日期前几天,或者后几天
     *
     * @param day day 位负数就是往前推几天,为正数就是往后推几天
     *
     * @return
     */
    public static Date getDate(int day) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, day);
        return cal.getTime();
    }


    /**
     * *
     * 获取指定开始时间,结束时间中间所有的时间列表
     *
     * @param dBegin
     * @param dEnd
     *
     * @return
     */
    public static List<Date> findDates(Date dBegin, Date dEnd) {
        List lDate = new ArrayList();
        lDate.add(dBegin);
        Calendar calBegin = Calendar.getInstance();
        // 使用给定的 Date 设置此 Calendar 的时间
        calBegin.setTime(dBegin);
        Calendar calEnd = Calendar.getInstance();
        // 使用给定的 Date 设置此 Calendar 的时间
        calEnd.setTime(dEnd);
        // 测试此日期是否在指定日期之后
        while (dEnd.after(calBegin.getTime())) {
            // 根据日历的规则，为给定的日历字段添加或减去指定的时间量
            calBegin.add(Calendar.DAY_OF_MONTH, 1);
            lDate.add(calBegin.getTime());
        }
        return lDate;
    }

    /**
     * *
     * 获取指定开始时间,结束时间中间所有的时间列表
     *
     * @param begin
     * @param end
     *
     * @return
     */
    public static List<String> findDates(String begin, String end, String formatter) {
        List<String> lDate = new ArrayList();
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(formatter);
            Date dBegin = dateFormat.parse(begin);
            Date dEnd = dateFormat.parse(end);

            lDate.add(begin);
            Calendar calBegin = Calendar.getInstance();
            // 使用给定的 Date 设置此 Calendar 的时间
            calBegin.setTime(dBegin);
            Calendar calEnd = Calendar.getInstance();
            // 使用给定的 Date 设置此 Calendar 的时间
            calEnd.setTime(dEnd);
            // 测试此日期是否在指定日期之后
            while (dEnd.after(calBegin.getTime())) {
                // 根据日历的规则，为给定的日历字段添加或减去指定的时间量
                calBegin.add(Calendar.DAY_OF_MONTH, 1);
                lDate.add(dateFormat.format(calBegin.getTime()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lDate;
    }

    /**
     * 获取指定日期的前一天
     *
     * @param end
     *
     * @return
     */
    public static Date getDateBeforeDay(Date end) {
        Calendar calEnd = Calendar.getInstance();
        // 使用给定的 Date 设置此 Calendar 的时间
        calEnd.setTime(end);
        int day = calEnd.get(Calendar.DATE);
        calEnd.set(Calendar.DATE, day - 1);
        return calEnd.getTime();
    }

    /**
     * @param date
     * @param formatterIn
     * @param formatterOut
     *
     * @return
     */
    public static String formatDate(String date, String formatterIn, String formatterOut) {
        String temp = formatDate(parseDate(date, formatterIn), formatterOut);
        return temp;
    }

    /**
     * @param date
     * @param formatter
     *
     * @return
     */
    public static Date formateDate(String date, String formatter) {
        Date temp = parseDate(date, formatter);
        return temp;
    }

    /** * 获取指定日期是星期几
     * 参数为null时表示获取当前日期是星期几
     * @param date
     * @return
     */
    public static String getWeekCnNameOfDate(Date date) {
        String[] weekOfDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar calendar = Calendar.getInstance();
        if(date != null){
            calendar.setTime(date);
        }
        int w = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0){
            w = 0;
        }
        return weekOfDays[w];
    }
}

