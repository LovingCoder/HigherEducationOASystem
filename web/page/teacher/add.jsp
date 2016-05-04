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

    <link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

    <script src="/jquery/jquery.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="/js/bootstrap-datetimepicker.js"></script>
    <script src="/jquery/jquerysession.js"></script>
    <script type="application/javascript">

        /**
        * 获取学校信息
         */
        $(function(){
            var schoolId = $("#session").val();
            if(null == schoolId || '' == schoolId){
                alert("对不起！您没有在学校任职！无法执行操作！");
                return false;
            }
            var para = {
                "requestTime": "2016-03-15 15:38:09.009",
                "requestMethod": "",
                "sessionId": "2c88449748214631ac43e6b370bd1034",
                "requestId": "1a30fa8c-362d-4634-86f6-6f1e600e40db",
                "requestContent": {
                    "schoolId":schoolId
                },
                "pageInfo": {
                    "pageSize": 10,
                    "currentPage": 1
                }
            };
            $.ajax({
                data:para,
                type:"post",
                url:"/school/getSchoolById",
                dataType:"json",
                cache:false,
                async:false,
                success:function(data){
                    alert("请求成功"+data.responseContent.schoolName);
                    $("#school").attr("value",data.responseContent.schoolName);;
                },
                error:function(){
                    alert("请求失败");
                }
            })
        });

        function addTeacher() {
            var para = {
                "requestTime": "2016-03-15 15:38:09.009",
                "requestMethod": "",
                "sessionId": "2c88449748214631ac43e6b370bd1034",
                "requestId": "1a30fa8c-362d-4634-86f6-6f1e600e40db",
                "requestContent": {
                    "courseName": $("#courseName").val(),
                    "major": $("#major").val(),
                    "courseProperty": $("#courseProperty").val(),
                    "term": $("#term").val()
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
                url: "/taskbook/list",
                async: false,
                success: function (data) {
                    if (0 == data.status) {
                        //将请求成功的数据显示出来
                        var responseContent = data.responseContent;
                        var tbody = $("#tbody");
                    } else {
                        alert(data["message"]);
                    }
                },
                error: function () {
                    alert("调用失败");
                }
            })
        }
    </script>
</head>
<body>

<input hidden="hidden" id="session" value="${sessionScope.user.teacher.schoolId}">

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

            <div class="input-group date form_date col-sm-3" data-date="" data-date-format="dd MM yyyy"
                 data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                <input class="form-control" size="16" type="text" value="选择日期" readonly="readonly" id="bornDate">
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
        </div>
        <script type="application/javascript">
            $('.form_date').datetimepicker({
                language: 'zh-CN',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                minView: 2,
                forceParse: 0
            });
        </script>
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
                <input type="text" placeholder="学校" class="form-control input-sm" data-parsley-required="true" readonly="readonly"
                       data-parsley-type="email" id="school">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label">学院：</label>

            <div class="col-sm-3">
                <select class="form-control" id="selectCollege">

                </select>
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
            <button type="submit" class="btn btn-info">添加</button>
        </div>
    </div>


    <div>
        <label class="label-danger">${userName}</label>

    </div>


</div>
</body>
</html>