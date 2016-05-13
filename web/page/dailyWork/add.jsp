<%--
  Created by IntelliJ IDEA.
  User: Tang
  Date: 2016/5/11
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>

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
    <script src="/js/DatetimePicker-i18n-zh-CN.js"></script>
    <script src="/js/DateTimePicker.js"></script>

    <link rel="stylesheet" href="/css/ui-dialog.css">
    <script src="/js/dialog-min.js"></script>
    <script type="application/javascript">

        /**
         * 获取session
         * */
        var session =<%=session.getAttribute("user")%>;

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
                        return false;
                    }
                });
                d.show();
            }else{
                queryTeacher();
            }
        });

        /**
         * 加载日期插件
         * */
        $(document).ready(function () {
            $("#dtBox").DateTimePicker();
        });

        /**
        * 获取教师列表
         */
        function queryTeacher(){
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
                url: "/teacher/queryTeacher",
                dataType: "json",
                cache: false,
                async: false,
                success: function (data) {
                    //给下拉框填充值
                    teacherList = data.responseContent;
                    for (var i in teacherList) {
                        var str = "<option value='" + teacherList[i].id + "'>" + teacherList[i].teacherName + "</option>";
                        $("#executorId").append(str);
                    }
                },
                error: function (data) {
                    alert("请求错误！");
                }
            });
        }
//        $(document).ready(function () {
//            var collegeId = session.teacher.collegeId;
//            var schoolId = session.teacher.schoolId;
//            if (null == collegeId || '' == collegeId || null == schoolId || '' == schoolId) {
//                alert("对不起！您没有在该学校或者学院任职！无法执行操作！");
//                return false;
//            }
//            var para = {
//                "requestContent": {
//                    "collegeId": collegeId,
//                    "schoolId": schoolId
//                },
//                "pageInfo": {
//                    "pageSize": 10,
//                    "currentPage": 1
//                }
//            };
//            $.ajax({
//                data: para,
//                type: "post",
//                url: "/teacher/queryTeacher",
//                dataType: "json",
//                cache: false,
//                async: false,
//                success: function (data) {
//                    //给下拉框填充值
//                    teacherList = data.responseContent;
//                    for (var i in teacherList) {
//                        var str = "<option value='" + teacherList[i].id + "'>" + teacherList[i].teacherName + "</option>";
//                        $("#executorId").append(str);
//                    }
//                },
//                error: function (data) {
//                    alert("请求错误！");
//                }
//            });
//        });

        /**
        * 添加事务
         */
        function addDailyWork() {
            var para = {
                "requestContent": {
                    "commanderId": session.teacher.id,
                    "executorId": $("#executorId").val(),
                    "title": $("#title").val(),
                    "type": $("#type").val(),
                    "beginTime": $("#beginTime").val(),
                    "endTime": $("#endTime").val(),
                    "desText": $("#desText").val()
                },
                "pageInfo": {
                    "pageSize": 10,
                    "currentPage": $("#pageNumber").val()
                }
            };
            $.ajax({
                cache: false,
                type: "POST",
                dataType: "json",
                url: "/dailyWork/addDailyWork",
                data: para,
                async: false,
                error: function (data) {
                    alert("数据错误！");
                },
                success: function (data) {
                    var d = dialog({
                        title: '提示',
                        content: data.message,
                        okValue: '前往事务列表页面查看',
                        ok: function () {
                            //添加成功后跳转到列表页面
                            window.location.href = "/UI/queryDailyWorkUI";
                        },
                        cancelValue: '继续新建事务',
                        cancel: function () {
                            window.location.reload();
                        }
                    });
                    d.show();
                }
            });
        }
    </script>
</head>
<body>
<%--顶部导航栏--%>
<div class="padding-md">
    <ul class="breadcrumb">
        <li>日常办公管理</li>
        <li>新建事务</li>
    </ul>
</div>

<div class="form-horizontal no-margin" id="type-constraint" data-validate="parsley" novalidate="">
    <div class="form-group">
        <label class="control-label col-sm-1">标题：</label>

        <div class="col-sm-3">
            <input type="text" class="form-control input-sm" id="title">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-1 control-label">事务类型</label>

        <div class="col-sm-3">
            <select class="form-control" id="type">
                <option value="1">打扫卫生</option>
                <option value="2">公派值日</option>
                <option value="3">日常事务安排</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-1">开始时间：</label>

        <div class="col-sm-3">
            <input type="text" size="16" data-field="datetime" readonly="readonly" id="beginTime" class="form-control"
                   value="选择日期" data-format="yyyy-MM-dd HH:mm">
        </div>
        <label class="control-label col-sm-1">结束时间：</label>

        <div class="col-sm-3">
            <input type="text" size="16" data-field="datetime" readonly="readonly" id="endTime" class="form-control"
                   value="选择日期" data-format="yyyy-MM-dd HH:mm">
        </div>
        <div id="dtBox"></div>
    </div>
    <div class="form-group">
        <label class="col-sm-1 control-label">执行老师：</label>

        <div class="col-sm-3">
            <select class="form-control" id="executorId">
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-1 control-label">详细信息：</label>

        <div class="col-sm-3">
            <textarea class="form-control" rows="3" id="desText"></textarea>
        </div>
    </div>
    <div style="margin-left: 70px">
        <button type="button" class="btn btn-info" onclick="addDailyWork()">发布</button>
    </div>
</div>
</body>
</html>
