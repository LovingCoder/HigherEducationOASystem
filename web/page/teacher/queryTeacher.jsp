<%--
  Created by IntelliJ IDEA.
  User: Tang
  Date: 2016/4/27
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师列表</title>
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
<body>

<%--顶部导航栏--%>
<div class="padding-md">
    <ul class="breadcrumb">
        <li>教师信息管理</li>
        <li>教师列表</li>
    </ul>
</div>

<%--教师信息列表--%>
<table class="table table-striped" id="dataTable">
    <thead>
         <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>所在校区</th>
        <th>班级</th>
        <th>生日</th>
        <th>是否可用</th>
    </tr>
    </thead>
    <tbody>
        <!-- 此处开始迭代 -->
        <tr>
            <td>#1001</td>
            <td>张小三</td>
            <td>男</td>
            <td>莲花街校区</td>
            <td>软件工程</td>
            <td>Oct 08,2013</td>
            <td><span class="label label-success">可用</span></td>
        </tr>
        <tr>
        <td>#1002</td>
        <td>李小四</td>
        <td>女</td>
        <td>嵩山路校区</td>
        <td>机械工程</td>
        <td>Oct 07,2013</td>
        <td><span class="label label-danger">不可用</span></td>
    </tr>
    </tbody>
</table>

</body>
</html>
