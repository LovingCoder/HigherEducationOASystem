<%--
  Created by IntelliJ IDEA.
  User: Tang
  Date: 2016/4/6
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>系统主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="/css/font-awesome.min.css" rel="stylesheet">

    <!-- ionicons -->
    <link href="/css/ionicons.min.css" rel="stylesheet">

    <!-- Morris -->
    <link href="/css/morris.css" rel="stylesheet"/>

    <!-- Datepicker -->
    <link href="/css/datepicker.css" rel="stylesheet"/>

    <!-- Animate -->
    <link href="/css/animate.min.css" rel="stylesheet">

    <!-- Owl Carousel -->
    <link href="/css/owl.carousel.min.css" rel="stylesheet">
    <link href="/css/owl.theme.default.min.css" rel="stylesheet">

    <!-- Simplify -->
    <link href="/css/simplify.min.css" rel="stylesheet">

</head>
<body class="overflow-hidden">
    <div class="padding-md" id="main">
        <div class="row">
            <div class="col-sm-6">
                <div class="page-title">
                    <%--Dashboard--%>
                    Welcome to use!
                </div>
                <br>
                <div class="page-sub-header">
                    Welcome Back, ${sessionScope.user.userName} , <i class="fa fa-map-marker text-danger"></i>
                    Henan University of Technology
                </div>
            </div>
        </div>
    </div>
<a href="#" class="scroll-to-top hidden-print"><i class="fa fa-chevron-up fa-lg"></i></a>

</body>
</html>
