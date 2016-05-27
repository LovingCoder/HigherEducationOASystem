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
    <link href="/css/ui-dialog.css" rel="stylesheet">

    <script src="/jquery/jquery.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/jquery/jquerysession.js"></script>
    <script src="/js/DatetimePicker-i18n-zh-CN.js"></script>
    <script src="/js/DateTimePicker.js"></script>
    <script src="/js/dialog-min.js"></script>

    <script src="/js/validation.js"></script>
    <script type="application/javascript">

        /**
         * 获取session
         * */
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
                loadDate();
                detailCollege();
                queryMajor();
            }
        });

        function loadDate() {
            $("#dtBox").DateTimePicker({
                isPopup: false
            });
        }
        /**
         * 获取当前登录教师所在的学院信息详情
         */
        function detailCollege() {
            var collegeId = session.teacher.collegeId;
            var para = {
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
        }

        /**
         * 获取当前学院下的所有专业
         */
       function queryMajor() {
            var collegeId = session.teacher.collegeId;
            var schoolId = session.teacher.schoolId;
            var para = {
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
                url: "/major/queryMajor",
                dataType: "json",
                cache: false,
                async: false,
                success: function (data) {
                    //给专业下拉框填充值
                    majorList = data.responseContent;
                    for (var i in majorList) {
                        var str = "<option value='" + majorList[i].id + "'>" + majorList[i].majorName + "</option>";
                        $("#selectMajor").append(str);
                    }
                },
                error: function () {
                    alert("请求失败");
                }
            })
        }
        function addTeacher() {
            var majorId = $("#selectMajor").val();
            var sex = $("input[name='sex']:checked").val();
            var para = {
                "requestContent": {
                    "teacherName": $("#teacherName").val(),
                    "sex": sex,
                    "bornDate": $("#bornDate").val(),
                    "majorId": majorId,
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
    <ol class="breadcrumb">
        <li><span class="primary-font"><i class="icon-home"></i></span><a href="/higherEducation/main">Home</a></li>
        <li>教师信息管理</li>
        <li class="active">添加教师</li>
    </ol>
</div>

<%--添加教师信息表单--%>
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
                   data-parsley-type="电子邮件" id="email">
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
                   data-parsley-type="学校" id="school">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-1 control-label">学院：</label>

        <div class="col-sm-3">
            <input type="hidden" id="collegeId">
            <input type="text" placeholder="学院" class="form-control input-sm" data-parsley-required="true"
                   readonly="readonly"
                   data-parsley-type="学院" id="college">
        </div>
    </div>

    <%--专业--%>
    <div class="form-group">
        <label class="col-sm-1 control-label">专业：</label>

        <div class="col-sm-3">
            <select class="form-control" id="selectMajor">
            </select>
        </div>
    </div>


    <div style="margin-left: 70px">
        <button type="submit" class="btn btn-info" onclick="addTeacher()">添加</button>
    </div>
</div>
</body>
</html>