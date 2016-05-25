<%--
  Created by IntelliJ IDEA.
  User: Tang
  Date: 2016/5/5
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师状态详情页面</title>
    <!-- Bootstrap core CSS -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="/css/font-awesome.min.css" rel="stylesheet">

    <!-- ionicons -->
    <link href="/css/ionicons.min.css" rel="stylesheet">

    <!-- Simplify -->
    <link href="/css/simplify.min.css" rel="stylesheet">

    <link href="/css/DateTimePicker.css" rel="stylesheet">

    <script src="/jquery/jquery.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/jquery/jquerysession.js"></script>
    <script src="/js/DateTimePicker.js"></script>

    <script src="/js/validation.js"></script>
    <script type="application/javascript">

        var session =<%=session.getAttribute("user")%>;

        /**
         * 页面加载的时候判断该用户是否有学校和学院
         * */
        $(document).ready(function () {
            var collegeId = session.teacher.collegeId;
            var schoolId = session.teacher.schoolId;
            if (null == collegeId || '' == collegeId || null == schoolId || '' == schoolId) {
                var d = dialog({
                    title: '提示',
                    content: '您好，欢迎使用本教学办公事务管理系统，您当前没有所在学校和专业，为了保证您体验更多完善的功能，请完善您的个人信息',
                    okValue: '好的，完善个人信息',
                    ok: function () {
                        window.location.href = '/UI/completUserUI';
                    },
                    cancelValue: '暂时不用，我先看看',
                    cancel: function () {
                    }
                });
                d.show();
            } else {
                detailTeacherStatus();
            }
        });

        /**
         * 获取教师选课状态详情
         */
        function detailTeacherStatus() {
            var teacherId = $("#teacherId").val();
            var para = {
                "requestContent": {
                    "teacherId": teacherId
                },
                "pageInfo": {
                    "pageSize": 10,
                    "currentPage": 1
                }
            };
            $.ajax({
                data: para,
                type: "post",
                url: "/teacher/detailTeacher",
                dataType: "json",
                cache: false,
                async: false,
                success: function (data) {
                    //姓名
                    $("#teacherName").val(data.responseContent.teacherName);
                    //性别
                    if (1 == data.responseContent.sex) {
                        $("#sex").attr("value", "男");
                    } else if (0 == data.responseContent.sex) {
                        $("#sex").attr("value", "女");
                    }
                    //邮件
                    $("#email").attr("value", data.responseContent.email);
                    //给学校输入框赋值
                    $("#schoolId").attr("value", data.responseContent.schoolId);
                    $("#school").attr("value", data.responseContent.schoolName);
                    //给学院输入框赋值
                    $("#collegeId").attr("value", data.responseContent.id);
                    $("#college").attr("value", data.responseContent.collegeName);
                    //专业
                    $("#major").attr("value", data.responseContent.majorName);
                    var taskbookList = data.responseContent.taskbookList;
                    for (var i in taskbookList) {
                        var str = "<tr> " +
                                "<td> " + checkTdNUllOrEmpty(taskbookList[i].courseCode) + " </td> " +
                                "<td> " + checkTdNUllOrEmpty(taskbookList[i].courseName) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(taskbookList[i].teachingNumber) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(taskbookList[i].major) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(taskbookList[i].schoolZone) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(taskbookList[i].classAndStudent) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(taskbookList[i].testType) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(taskbookList[i].startAndEndWeek) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(taskbookList[i].courseProperty) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(taskbookList[i].term) + " </td>" +
                                "</tr>";
                        $("#tbody").append(str);
                    }
                },
                error: function () {
                    alert("请求失败");
                }
            })
        }

    </script>
</head>
<body>
<input type="hidden" id="teacherId" value=${teacherId}>
<%--顶部导航栏--%>
<div class="padding-md">
    <ol class="breadcrumb">
        <li>选课管理</li>
        <li>教师选课情况查看</li>
        <li><a href="/UI/teacherStatusUI">教师状态查看</a></li>
        <li class="active">教师选课状态详情</li>
        <ol/>
</div>

<%--教师信息--%>
<div>
    <div class="form-horizontal no-margin" id="type-constraint" data-validate="parsley" novalidate="">
        <table class="table table-striped table-hover">
            <caption>教师基本信息</caption>
            <tr>
                <td class="col-sm-1" style="text-align: center">姓名：</td>
                <td class="col-sm-2">
                    <input type="text" class="form-control input-sm" data-parsley-type="userName" id="teacherName"
                           readonly="readonly">
                </td>
                <td class="col-sm-1" style="text-align: center">学校：</td>
                <td class="col-sm-2">
                    <input type="text" placeholder="学校" class="form-control input-sm" data-parsley-required="true"
                           readonly="readonly" id="school">
                </td>
            </tr>
            <tr>
                <td class="col-sm-1" style="text-align: center">性别：</td>
                <td><input type="text" class="form-control input-sm" data-parsley-type="sex" id="sex"
                           readonly="readonly"></td>
                <td class="col-sm-1" style="text-align: center">学院：</td>
                <td><input type="text" placeholder="学院" class="form-control input-sm" data-parsley-required="true"
                           readonly="readonly" id="college"></td>
            </tr>
            <tr>
                <td class="col-sm-1" style="text-align: center">Email：</td>
                <td><input type="text" placeholder="电子邮件" class="form-control input-sm" data-parsley-required="true"
                           data-parsley-type="email" id="email" readonly="readonly"></td>
                <td class="col-sm-1" style="text-align: center">专业：</td>
                <td><input type="text" placeholder="专业" class="form-control input-sm" data-parsley-required="true"
                           readonly="readonly" id="major"></td>
            </tr>
        </table>
        <%--课程列表--%>
        <table class="table table-striped table-hover">
            <caption>已选定的课程</caption>
            <thead>
            <tr>
                <th>课程代码</th>
                <th>课程名称</th>
                <th>教学计划号</th>
                <th>专业</th>
                <th>校区</th>
                <th>班级及人数</th>
                <th>考核方式</th>
                <th>上课起止周次</th>
                <th>课程性质</th>
                <th>学期</th>
            </tr>
            </thead>
            <tbody id="tbody">
            </tbody>
        </table>

        <div style="margin-left: 70px">
            <button type="submit" class="btn btn-info form-group" onclick="addTeacher()">保存更改</button>
        </div>
    </div>

</div>
</body>
</html>
