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

    <!-- datatable -->
    <link href="/css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- Simplify -->
    <link href="/css/simplify.min.css" rel="stylesheet">

    <script src="/jquery/jquery.min.js"></script>
</head>
<body >

<%--顶部导航栏--%>
<div class="padding-md">
    <ul class="breadcrumb">
        <li>教师信息管理</li>
        <li>添加教师</li>
    </ul>
</div>

<%--添加教师信息表单--%>
<div style="width: 500px;height: 1000px;margin-left: 20px">
    <div>
        <input class="form-control " placeholder="请输入教师姓名">
    </div>

    <div class="col-lg-10">
        <div class="radio inline-block">
            <div class="custom-radio m-right-xs">
                <input type="radio" id="sexMan" name="sexMan">
            </div>
            <div class="inline-block vertical-top">男</div>
        </div>
        <div class="radio inline-block">
            <div class="custom-radio m-right-xs">
                <input type="radio" id="sexWomen" name="sexWomen">
            </div>
            <div class="inline-block vertical-top">女</div>
        </div>
    </div>

</div>


</body>
</html>
