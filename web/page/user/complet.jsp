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
            completTeacherInfoFromSession();
            querySchool();

            //设置学校选项禁用 如果有学校了 禁用
            if(null != session.teacher.schoolId){
                $("#selectSchool").attr("disabled",true);
                queryCollege();
                //设置学院选项禁用 如果有学院了 禁用
                if(null != session.teacher.collegeId){
                    $("#selectCollege").attr("disabled",true);
                    queryMajor();
                }
            }else{
                //学校下拉框改变时获取学院信息
                $("#selectSchool").change(function(){
                    queryCollege();
                });
                //学院下拉框改变时获取班级信息
                $("#selectCollege").change(function(){
                    queryMajor();
                });
            }
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
                        var str = selectSchool(schoolList[i]);
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
                        var str = selectCollege(collegeList[i]);
                        $("#selectCollege").append(str);
                    }
                },
                error:function(data){
                    alert(data.message);
                }
            });
        }

        /**
         * 获取专业列表
         */
        function queryMajor(){
            alert($("#selectCollege").val());
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
                url:"/major/queryMajor",
                type:"post",
                data: paras,
                dataType: "json",
                cache: false,
                async: true,
                success:function(data){
                    //先移除之前的信息
                    $("#selectMajor").find("option").remove();
                    //给专业下拉框赋值
                    var majorList = data.responseContent;
                    for (var i in majorList){
                        var str = selectMajor(majorList[i]);
                        $("#selectMajor").append(str);
                    }
                },
                error:function(data){
                    alert(data.message);
                }
            });
        }

        /**
        * 保存信息
         */
        function saveInfo(){
            var paras = {
                "requestContent": {
                    "teacherName":$("#teacherName").val(),
                    "sex":$("input[name='sex']:checked").val(),
                    "bornDate":$("#bornDate").val(),
                    "schoolId": $("#selectSchool").val(),
                    "collegeId":$("#selectCollege").val(),
                    "majorId":$("#selectMajor").val()
                },
                "pageInfo": {
                    "pageSize": 10,
                    "currentPage": 1
                }
            };
            $.ajax({
                url:"/user/complet",
                type:"post",
                data: paras,
                dataType: "json",
                cache: false,
                async: true,
                success:function(data){
                    alert(data.message);
                },
                error:function(data){
                    alert(data.message);
                }
            });
        }

        function completTeacherInfoFromSession(){
            $("#teacherName").attr("value",session.teacher.teacherName);
            if(1 == session.teacher.sex){
                $("#sexMan").attr("checked",true);
            }else{
                $("#sexWomen").attr("checked",true);
            }
            $("#bornDate").attr("value",session.teacher.bornDate);
            $("#email").attr("value",session.teacher.email);
        }

        /**
         * 学校选中
         * */
        function selectSchool(data){
            if(data.id == session.teacher.schoolId){
                return "<option value='" + data.id + "' selected='selected'>" + data.schoolName + "</option>";
            }else{
                return "<option value='" + data.id + "'>" + data.schoolName + "</option>";
            }
        }

        /**
         * 学院选中
         * */
        function selectCollege(data){
            if(data.id == session.teacher.collegeId){
                return "<option value='" + data.id + "' selected='selected'>" + data.collegeName + "</option>";
            }else{
                return "<option value='" + data.id + "'>" + data.collegeName + "</option>";
            }
        }

        /**
         * 专业选中
         * */
        function selectMajor(data){
            if(data.id == session.teacher.majorId){
                return "<option value='" + data.id + "' selected='selected'>" + data.majorName + "</option>";
            }else{
                return "<option value='" + data.id + "'>" + data.majorName + "</option>";
            }
        }
    </script>
</head>
<body>

<%--顶部导航栏--%>
<div class="padding-md">
    <ol class="breadcrumb">
        <li><span class="primary-font"><i class="icon-home"></i></span><a href="/higherEducation/main">Home</a></li>
        <li class="active">完善个人信息</li>
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
                   data-parsley-type="电子邮件" id="email" readonly="readonly">
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

    <%--专业--%>
    <div class="form-group">
        <label class="col-sm-1 control-label">专业：</label>

        <div class="col-sm-3">
            <select class="form-control" id="selectMajor">
            </select>
        </div>
    </div>


    <div style="margin-left: 70px">
        <button type="submit" class="btn btn-info" onclick="saveInfo()">保存</button>
    </div>
</div>
</body>
</html>