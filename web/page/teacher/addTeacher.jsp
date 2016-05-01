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
<div>
<div class="smart-widget-body">
    <form class="form-horizontal no-margin" id="type-constraint" data-validate="parsley" novalidate="">
        <%--教师名--%>
        <div class="form-group">
            <label class="control-label col-sm-1">姓名：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control input-sm" data-parsley-type="userName" >
            </div>
        </div>

        <%--性别--%>
        <div class="form-group">
            <label class="col-sm-1 control-label">性别：</label>
            <div class="col-sm-3">
                <div class="radio inline-block">
                    <div class="custom-radio m-right-xs">
                        <input type="radio" id="sexMan" name="sex">
                        <label for="sexMan"></label>
                    </div>
                    <div class="inline-block vertical-top">男</div>
                </div>
                <div class="radio inline-block">
                    <div class="custom-radio m-right-xs">
                        <input type="radio" id="sexWomen" name="sex">
                        <label for="sexWomen"></label>
                    </div>
                    <div class="inline-block vertical-top">女</div>
                </div>
            </div>
        </div>

        <%--学校--%>
        <div class="form-group">
            <label class="col-sm-1 control-label">校区：</label>
            <div class="col-sm-3">
                <select class="form-control">
                    <option value="1">莲花街校区</option>
                    <option value="2">嵩山路校区</option>
                    <option value="3">中原路校区</option>
                </select>
            </div>
        </div>

            <%--班级--%>
        <div class="form-group">
            <label class="col-sm-1 control-label">班级：</label>
            <div class="col-sm-3">
                <select class="form-control">
                    <option value="1">软件工程</option>
                    <option value="2">计算机科学</option>
                    <option value="3">中原路校区</option>
                </select>
            </div>
        </div>


        <div style="padding-left: 300px">
            <button type="submit" class="btn btn-info">添加</button>
        </div>
    </form>
</div>
</div>

</body>
</html>
