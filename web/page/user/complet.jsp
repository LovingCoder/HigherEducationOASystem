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

        /**
         * 获取session
         * */
        var session =<%=session.getAttribute("user")%>;

        $(document).ready(function () {
            $("#dtBox").DateTimePicker({
                isPopup: false
            });
            querySchool();
            //学校下拉框改变时获取学院信息
            $("#selectSchool").change(function(){
                queryCollege();
            });
            //学院下拉框改变时获取班级信息
            $("#selectCollege").change(function(){
                queryClass();
            });
        });

        /**
         * 获取学校列表
         */
        function querySchool(){
            $.ajax({
                url:"/school/querySchool",
                type: "post",
                dataType: "json",
                cache: false,
                async: false,
                success:function(data){
                    //给学校下拉框赋值
                    var schoolList = data.responseContent;
                    for (var i in schoolList){
                        var str = "<option value='" + schoolList[i].id + "'>" + schoolList[i].schoolName + "</option>";
                        $("#selectSchool").append(str);
                    }
                },
                error:function(data){
                    alert(data.message);
                }
            });
        }
        /**
         * 获取学院列表
         */
        function queryCollege(){
            var paras = {
                "requestContent": {
                    "schoolId": $("#selectSchool").val()
                },
                "pageInfo": {
                    "pageSize": 10,
                    "currentPage": 1
                }
            };
            $.ajax({
                url:"/college/queryCollege",
                type: "post",
                data: paras,
                dataType: "json",
                cache: false,
                async: true,
                success:function(data){
                    //先移除之前的信息
                    $("#selectCollege").find("option").remove();
                    //给学院下拉框赋值
                    var collegeList = data.responseContent;
                    for (var i in collegeList){
                        var str = "<option value='" + collegeList[i].id + "'>" + collegeList[i].collegeName + "</option>";
                        $("#selectCollege").append(str);
                    }
                },
                error:function(data){
                    alert(data.message);
                }
            });
        }

        /**
         * 获取班级列表
         */
        function queryClass(){
            var paras = {
                "requestContent": {
                    "schoolId": $("#selectSchool").val(),
                    "collegeId":$("#selectCollege").val()
                },
                "pageInfo": {
                    "pageSize": 10,
                    "currentPage": 1
                }
            };
            $.ajax({
                url:"/class/queryClass",
                type:"post",
                data: paras,
                dataType: "json",
                cache: false,
                async: true,
                success:function(data){
                    //先移除之前的信息
                    $("#selectClass").find("option").remove();
                    //给学院下拉框赋值
                    var classList = data.responseContent;
                    for (var i in classList){
                        var str = "<option value='" + classList[i].id + "'>" + classList[i].className + "</option>";
                        $("#selectClass").append(str);
                    }
                },
                error:function(data){
                    alert(data.message);
                }
            });
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
            <select class="form-control" id="selectSchool">
            </select>
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
        <button type="submit" class="btn btn-info" onclick="addTeacher()">添加</button>
    </div>
</div>
</body>
</html>