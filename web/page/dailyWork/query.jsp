<%--
  Created by IntelliJ IDEA.
  User: Tang
  Date: 2016/5/11
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>事务列表</title>
    <!-- Bootstrap core CSS -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="/css/font-awesome.min.css" rel="stylesheet">

    <!-- ionicons -->
    <link href="/css/ionicons.min.css" rel="stylesheet">

    <!-- Simplify -->
    <link href="/css/simplify.min.css" rel="stylesheet">

    <link rel="stylesheet" href="/css/ui-dialog.css">
    <link href="/css/DateTimePicker.css" rel="stylesheet">

    <script src="/jquery/jquery.min.js"></script>
    <script src="/js/dialog-min.js"></script>

    <script src="/js/validation.js"></script>
    <script src="/js/DatetimePicker-i18n-zh-CN.js"></script>
    <script src="/js/DateTimePicker.js"></script>

    <script type="application/javascript">

        /**
         * 获取session
         * */
        var session =<%=session.getAttribute("user")%>;

        /**
         * 页面加载的时候判断该用户是否有学校和学院
         * */
        $(document).ready(function(){
            var collegeId = session.teacher.collegeId;
            var schoolId = session.teacher.schoolId;
            if(null == collegeId || '' == collegeId || null == schoolId || '' == schoolId){
                var d = dialog({
                    title: '提示',
                    content: '您好，欢迎使用本教学办公事务管理系统，您当前没有所在学校和班级，为了保证您体验更多完善的功能，请完善您的个人信息',
                    okValue: '好的，完善个人信息',
                    ok: function () {
                        window.location.href = '/UI/completUserUI';
                    },
                    cancelValue: '暂时不用，我先看看',
                    cancel: function () {
                    }
                });
                d.show();
            }else{
                loadDate();
                queryTeacher();
                queryDailyWork();
            }
        });

        /**
         * 加载日期插件
         * */
        function loadDate() {
            $("#dtBox").DateTimePicker();
        }

        /**
         * 获取教师列表，给下拉框赋值
         */
        function queryTeacher() {
            var para = {
                "requestContent": {
                    "collegeId": session.teacher.collegeId,
                    "schoolId": session.teacher.schoolId
                },
                "pageInfo": {
                    "pageSize": 999999,
                    "currentPage": 1
                }
            };
            $.ajax({
                data: para,
                type: "post",
                url: "/teacher/queryTeacher",
                dataType: "json",
                cache: false,
                async: false,
                success: function (data) {
                    //给表格填充值
                    teacherList = data.responseContent;
                    for (var i in teacherList) {
                        var str = "<option value='" + teacherList[i].id + "'>" + teacherList[i].teacherName + "</option>";
                        $("#commanderId").append(str);
                        $("#executorId").append(str);
                    }
                },
                error: function () {
                    alert("请求失败");
                }
            })
        }

        /**
         * 获取事务列表
         */
        function queryDailyWork() {
            var para = {
                "requestContent": {
                    "collegeId": session.teacher.collegeId,
                    "schoolId": session.teacher.schoolId,
                    "title": $("#title").val(),
                    "type": $("#workType").val(),
                    "beginTime": $("#beginTime").val(),
                    "endTime": $("#endTime").val(),
                    "commanderId": $("#commanderId").val(),
                    "executorId": $("#executorId").val()

                },
                "pageInfo": {
                    "pageSize": 10,
                    "currentPage": 1
                }
            };
            $.ajax({
                data: para,
                type: "post",
                url: "/dailyWork/queryDailyWork",
                dataType: "json",
                cache: false,
                async: false,
                success: function (data) {
                    //给表格填充值
                    $("#tbody").empty();
                    var dailyWorkList = data.responseContent;
                    for (var i in dailyWorkList) {
                        var str = "<tr> " +
                                "<td> " + checkTdNUllOrEmpty(dailyWorkList[i].commanderTeacher.teacherName) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(dailyWorkList[i].title) + " </td>" +
                                "<td> " + checkDailyWorkType(dailyWorkList[i].workType) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(dailyWorkList[i].beginTime) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(dailyWorkList[i].endTime) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(dailyWorkList[i].executorTeacher.teacherName) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(dailyWorkList[i].desText) + " </td>" +
                                "<td><button type='button' class='btn btn-danger marginTB-xs detailClick'>删除</button></td>" +
                                "</tr>";
                        $("#tbody").append(str);
                    }

                    //给详情按钮添加点击事件
                    $(".detailClick").click(function () {
                        var inx = $(".detailClick").index(this);
                        for (var i = 0; i < dailyWorkList.length; i++) {
                            if (i == inx) {
                                var id = dailyWorkList[i].id;
                                var d = dialog({
                                    title: '警告',
                                    content: '确定要删除该事务？',
                                    cancelValue: '取消',
                                    cancel: function () {
                                        window.location.reload();
                                    },
                                    okValue: '确定',
                                    ok: function () {
                                        $.post("/dailyWork/deleteDailyWork", {
                                            "requestContent": {
                                                "id": id
                                            },
                                            "pageInfo": {
                                                "pageSize": 10,
                                                "currentPage": 1
                                            }
                                        }, function (result) {
                                            var a = dialog({
                                                title: '删除提示',
                                                content: result.message,
                                                cancel: false,
                                                okValue: '我知道了',
                                                ok: function () {
                                                    window.location.reload();
                                                }
                                            });
                                            a.showModal();
                                        }, "json");
                                    }
                                });
                                d.showModal();
                            }
                        }
                    });
                },
                error: function () {
                    alert("请求失败");
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
        <li>教师列表</li>
    </ul>
</div>
<div class="form-inline no-margin">
    <div class="form-group col-sm-1">
        <select class="form-control" id="commanderId">
            <option value="">发布老师</option>
        </select>
    </div>
    <div class="form-group col-sm-1">
        <select class="form-control" id="executorId">
            <option value="">执行老师</option>
        </select>
    </div>
    <!-- /form-group -->
    <div class="form-group col-sm-2">
        <input type="text" class="form-control" placeholder="标题" id="title" name="title">
    </div>
    <!-- /form-group -->
    <div class="form-group col-sm-2">
        <select class="form-control" id="workType">
            <option value="">事务类型
            </option>
            <option value=1>打扫卫生
            </option>
            <option value=2>公派值日
            </option>
            <option value=3>日常事务安排
            </option>
        </select>
    </div>
    <!-- /form-group -->
    <div class="form-group col-sm-2">
        <input type="text" class="form-control" placeholder="开始时间" id="beginTime" name="beginTime" data-field="datetime"
               readonly="readonly" data-format="yyyy-MM-dd HH:mm">
    </div>
    <div class="form-group col-sm-2">
        <input type="text" class="form-control" placeholder="结束时间" id="endTime" name="endTime" data-field="datetime"
               readonly="readonly" data-format="yyyy-MM-dd HH:mm">
    </div>
    <!-- /form-group -->
    <button type="button" class="btn btn-sm btn-success" id="search" onclick="queryDailyWork()">Search</button>
    <div id="dtBox"></div>
</div>
<%--事务列表--%>
<table class="table table-striped" id="dataTable" style="table-layout:fixed;height: 70%">
    <thead>
    <tr>
        <th>发布老师</th>
        <th>标题</th>
        <th>类型</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <th>执行老师</th>
        <th>详细信息</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="tbody">
    </tbody>
</table>

</body>
</html>
