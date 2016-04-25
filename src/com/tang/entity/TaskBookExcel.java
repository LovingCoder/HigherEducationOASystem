package com.tang.entity;

import org.jeecgframework.poi.excel.annotation.Excel;

import java.util.Date;

public class TaskBookExcel {

    @Excel(name = "序号")
    private String serialNumber;
    @Excel(name = "课程代码")
    private String courseCode;
    @Excel(name = "课程名称")
    private String courseName;
    @Excel(name = "教学计划号")
    private String teachingNumber;
    @Excel(name = "专业")
    private String major;
    @Excel(name = "校区")
    private String schoolZone;
    @Excel(name = "班级及人数")
    private String classAndStudent;
    @Excel(name = "年级")
    private String grade;
    @Excel(name = "总人数")
    private int totalStudent;
    @Excel(name = "考核方式")
    private String testType;
    @Excel(name = "周学时")
    private String weekTime;
    @Excel(name = "总学时")
    private int totalTime;
    @Excel(name = "上课起止周次")
    private String startAndEndWeek;
    @Excel(name = "时数")
    private int classHour;
    @Excel(name = "教师签名")
    private String teacherSign;
    @Excel(name = "职称")
    private String title;
    @Excel(name = "课程性质")
    private String courseProperty;
    @Excel(name = "合班意见")
    private String mergeClassOpinion;
    @Excel(name = "教室类型")
    private String classRoomType;

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getTeachingNumber() {
        return teachingNumber;
    }

    public void setTeachingNumber(String teachingNumber) {
        this.teachingNumber = teachingNumber;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getSchoolZone() {
        return schoolZone;
    }

    public void setSchoolZone(String schoolZone) {
        this.schoolZone = schoolZone;
    }

    public String getClassAndStudent() {
        return classAndStudent;
    }

    public void setClassAndStudent(String classAndStudent) {
        this.classAndStudent = classAndStudent;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public int getTotalStudent() {
        return totalStudent;
    }

    public void setTotalStudent(int totalStudent) {
        this.totalStudent = totalStudent;
    }

    public String getTestType() {
        return testType;
    }

    public void setTestType(String testType) {
        this.testType = testType;
    }

    public String getWeekTime() {
        return weekTime;
    }

    public void setWeekTime(String weekTime) {
        this.weekTime = weekTime;
    }

    public int getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(int totalTime) {
        this.totalTime = totalTime;
    }

    public String getStartAndEndWeek() {
        return startAndEndWeek;
    }

    public void setStartAndEndWeek(String startAndEndWeek) {
        this.startAndEndWeek = startAndEndWeek;
    }

    public int getClassHour() {
        return classHour;
    }

    public void setClassHour(int classHour) {
        this.classHour = classHour;
    }

    public String getTeacherSign() {
        return teacherSign;
    }

    public void setTeacherSign(String teacherSign) {
        this.teacherSign = teacherSign;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCourseProperty() {
        return courseProperty;
    }

    public void setCourseProperty(String courseProperty) {
        this.courseProperty = courseProperty;
    }

    public String getMergeClassOpinion() {
        return mergeClassOpinion;
    }

    public void setMergeClassOpinion(String mergeClassOpinion) {
        this.mergeClassOpinion = mergeClassOpinion;
    }

    public String getClassRoomType() {
        return classRoomType;
    }

    public void setClassRoomType(String classRoomType) {
        this.classRoomType = classRoomType;
    }
}
