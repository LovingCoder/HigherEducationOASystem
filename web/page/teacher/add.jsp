<%--
  Created by IntelliJ IDEA.
  User: Tang
  Date: 2016/4/27
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
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
    <script src="/js/DatetimePicker-i18n-zh-CN.js"></script>
    <script src="/js/DateTimePicker.js"></script>

    <script src="/js/validation.js"></script>
    <script type="application/javascript">


        $(document).ready(function () {
            $("#dtBox").DateTimePicker({

                isPopup: false

            });
        });

        /**
         * 获取当前登录教师所在的学院信息详情
         */
        $(function () {
            //获取session 得到当前登录教师所在学院id
            var session =<%=session.getAttribute("user")%>;
            var collegeId = session.teacher.collegeId;
            if (null == collegeId || '' == collegeId) {
                alert("对不起！您没有在任何学院任职！无法执行操作！");
                window.location.reload();
                return false;
            }
            var para = {
                "requestTime": "2016-03-15 15:38:09.009",
                "requestMethod": "",
                "sessionId": "2c88449748214631ac43e6b370bd1034",
                "requestId": "1a30fa8c-362d-4634-86f6-6f1e600e40db",
                "requestContent": {
                    "collegeId": collegeId
                },
                "pageInfo": {
                    "pageSize": 10,
                    "currentPage": 1
                }
            };
            $.ajax({
                data: para,
                type: "post",
                url: "/college/getCollegeByTeacherId",
                dataType: "json",
                cache: false,
                async: false,
                success: function (data) {
                    //给学校输入框赋值
                    $("#schoolId").attr("value", data.responseContent.schoolId);
//                    alert($("#schoolId").val());
                    $("#school").attr("value", data.responseContent.schoolName);
                    //给学院输入框赋值
                    $("#collegeId").attr("value", data.responseContent.id);
//                    alert($("#collegeId").val());
                    $("#college").attr("value", data.responseContent.collegeName);
                },
                error: function () {
                    alert("请求失败");
                }
            })
        });

        /**
         * 获取当前学院下的所有班级
         */
        $(function () {
            var session =<%=session.getAttribute("user")%>;
            var collegeId = session.teacher.collegeId;
            var schoolId = session.teacher.schoolId;
            if (null == collegeId || '' == collegeId || null == schoolId || '' == schoolId) {
                alert("对不起！您没有在该学校或者学院任职！无法执行操作！");
                return false;
            }
            var para = {
                "requestTime": "2016-03-15 15:38:09.009",
                "requestMethod": "",
                "sessionId": "2c88449748214631ac43e6b370bd1034",
                "requestId": "1a30fa8c-362d-4634-86f6-6f1e600e40db",
                "requestContent": {
                    "collegeId": collegeId,
                    "schoolId": schoolId
                },
                "pageInfo": {
                    "pageSize": 10,
                    "currentPage": 1
                }
            };
            $.ajax({
                data: para,
                type: "post",
                url: "/class/queryClass",
                dataType: "json",
                cache: false,
                async: false,
                success: function (data) {
                    //给班级下拉框填充值
                    classList = data.responseContent;
                    for (var i in classList) {
                        var str = "<option value='" + classList[i].id + "'>" + classList[i].className + "</option>";
                        $("#selectClass").append(str);
                    }
                },
                error: function () {
                    alert("请求失败");
                }
            })
        });

        function addTeacher() {
            var classId = $("#selectClass").val();
            var sex = $("input[name='sex']:checked").val();
            var para = {
                "requestTime": "2016-03-15 15:38:09.009",
                "requestMethod": "",
                "sessionId": "2c88449748214631ac43e6b370bd1034",
                "requestId": "1a30fa8c-362d-4634-86f6-6f1e600e40db",
                "requestContent": {
                    "teacherName": $("#teacherName").val(),
                    "sex": sex,
                    "bornDate": $("#bornDate").val(),
                    "classId": classId,
                    "collegeId": $("#collegeId").val(),
                    "schoolId": $("#schoolId").val(),
                    "email": $("#email").val()
                },
                "pageInfo": {
                    "pageSize": 10,
                    "currentPage": 1
                }
            };
            $.ajax({
                type: "post",
                data: para,
                cache: false,
                type: "POST",
                dataType: "json",		  //json格式，重要
                url: "/teacher/addTeacher",
                async: true,
                success: function (data) {
                    if (0 == data.status) {
                        alert(data.message);
                        window.location.href = "/UI/queryTeacherUI";
                    } else {
                        alert(data.message);
                    }
                },
                error: function () {
                    alert("发生异常！");
                }
            })
        }
    </script>
</head>
<body>

<%--顶部导航栏--%>
<div class="padding-md">
    <ul class="breadcrumb">
        <li>教师信息管理</li>
        <li>添加教师</li>
    </ul>
</div>

<%--添加教师信息表单--%>
<div>
    <div class="form-horizontal no-margin" id="type-constraint" data-validate="parsley" novalidate="">
        <%--教师名--%>
        <div class="form-group">
            <label class="control-label col-sm-1">姓名：</label>

            <div class="col-sm-3">
                <input type="text" class="form-control input-sm" data-parsley-type="userName" id="teacherName">
            </div>
        </div>

        <%--性别--%>
        <div class="form-group">
            <label class="col-sm-1 control-label">性别：</label>

            <div class="col-sm-3">
                <div class="radio inline-block">
                    <div class="custom-radio m-right-xs">
                        <input type="radio" id="sexMan" name="sex" value="1">
                        <label for="sexMan"></label>
                    </div>
                    <div class="inline-block vertical-top">男</div>
                </div>
                <div class="radio inline-block">
                    <div class="custom-radio m-right-xs">
                        <input type="radio" id="sexWomen" name="sex" value="0">
                        <label for="sexWomen"></label>
                    </div>
                    <div class="inline-block vertical-top">女</div>
                </div>
            </div>
        </div>
        <%--出生日期--%>
        <div class="form-group">
            <label class="control-label col-sm-1">出生日期：</label>

            <div class="col-sm-3">
                <input type="text" size="16" data-field="date" readonly="readonly" id="bornDate" class="form-control"
                       value="选择日期" data-format="yyyy-MM-dd">
            </div>
            <div id="dtBox"></div>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label">Email</label>

            <div class="col-sm-3">
                <input type="text" placeholder="电子邮件" class="form-control input-sm" data-parsley-required="true"
                       data-parsley-type="email" id="email">
            </div>
        </div>
        <!-- /form-group -->
        <%--学校--%>
        <div class="form-group">
            <label class="col-sm-1 control-label">学校：</label>

            <div class="col-sm-3">
                <input type="hidden" id="schoolId">
                <input type="text" placeholder="学校" class="form-control input-sm" data-parsley-required="true"
                       readonly="readonly"
                       data-parsley-type="email" id="school">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label">学院：</label>

            <div class="col-sm-3">
                <input type="hidden" id="collegeId">
                <input type="text" placeholder="学院" class="form-control input-sm" data-parsley-required="true"
                       readonly="readonly"
                       data-parsley-type="email" id="college">
            </div>
        </div>

        <%--班级--%>
        <div class="form-group">
            <label class="col-sm-1 control-label">班级：</label>

            <div class="col-sm-3">
                <select class="form-control" id="selectClass">
                </select>
            </div>
        </div>


        <div style="margin-left: 70px">
            <button type="submit" class="btn btn-info" onclick="addTeacher()">添加</button>
        </div>
    </div>


    <div>
        <label class="label-danger">${userName}</label>

    </div>


</div>
</body>
</html>