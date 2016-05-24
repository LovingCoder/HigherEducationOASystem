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
                queryMajor();
                detailTeacher();
            }
        });

        function loadDate() {
            $("#dtBox").DateTimePicker({

                isPopup: false

            });
        }

        /**
         * 获取当前学院下的所有专业
         */
        function queryMajor() {
            var collegeId = session.teacher.collegeId;
            var schoolId = session.teacher.schoolId;
            if (null == collegeId || '' == collegeId || null == schoolId || '' == schoolId) {
                alert("对不起！您没有在该学校或者学院任职！无法执行操作！");
                return false;
            }
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
                    //给班级下拉框填充值
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

        /**
         * 获取教师详情
         */
        function detailTeacher() {
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
//          $("#teacherName").attr("value",data.responseContent.teacherName);
                    //性别
                    if (1 == data.responseContent.sex) {
                        $("#sexMan").attr("checked", "true");
                    } else if (0 == data.responseContent.sex) {
                        $("#sexWomen").attr("checked", "true");
                    }
                    //出生日期
                    $("#bornDate").attr("value", data.responseContent.bornDate);
                    //邮件
                    $("#email").attr("value", data.responseContent.email);
                    //给学校输入框赋值
                    $("#schoolId").attr("value", data.responseContent.schoolId);
//                    alert($("#schoolId").val());
                    $("#school").attr("value", data.responseContent.schoolName);
                    //给学院输入框赋值
                    $("#collegeId").attr("value", data.responseContent.id);
//                    alert($("#collegeId").val());
                    $("#college").attr("value", data.responseContent.collegeName);
                    //班级
                    $("select option[value='" + data.responseContent.majorId + "']").attr("selected", "selected");
                    var taskbookList = data.responseContent.teskbookList;
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
                                "</tr>"
                    }
                    $("#taskbookList").append();
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
    <ul class="breadcrumb">
        <li>教师信息管理</li>
        <li>教师详情</li>
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

        <%--电子邮件--%>
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
                       readonly="readonly" id="school">
            </div>
        </div>

        <%--学院--%>
        <div class="form-group">
            <label class="col-sm-1 control-label">学院：</label>

            <div class="col-sm-3">
                <input type="hidden" id="collegeId">
                <input type="text" placeholder="学院" class="form-control input-sm" data-parsley-required="true"
                       readonly="readonly" id="college">
            </div>
        </div>

        <%--班级--%>
        <div class="form-group">
            <label class="col-sm-1 control-label">专业：</label>

            <div class="col-sm-3">
                <select class="form-control" id="selectMajor">
                </select>
            </div>
        </div>

        <%--课程列表--%>
        <div class="form-group">
            <label class="col-sm-1 control-label">已选课程：</label>

            <div class="col-sm-9 padding-md" id="taskbookList">
                <table class="table table-striped" id="dataTable">
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
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>

        <div style="margin-left: 70px">
            <button type="submit" class="btn btn-info" onclick="addTeacher()">保存更改</button>
        </div>
    </div>

</div>
</body>
</html>
