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

    <script src="/js/validation.js"></script>

    <script type="application/javascript">

        /**
         * 获取本学院教师列表 页面一加载就执行
         */
        $(function () {
            var session =<%=session.getAttribute("user")%>;
            var collegeId = session.teacher.collegeId;
            var schoolId = session.teacher.schoolId;
            if (null == collegeId || '' == collegeId || null == schoolId || '' == schoolId) {
                alert("对不起！您没有在该学校或者学院任职！无法执行操作！");
                return false;
            }
            var para = {
                "requestTime": "2016-03-15 15:38:09.009",
                "requestMethod": "",
                "sessionId": "2c88449748214631ac43e6b370bd1034",
                "requestId": "1a30fa8c-362d-4634-86f6-6f1e600e40db",
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
                    //给表格填充值
                    teacherList = data.responseContent;
                    for (var i in teacherList) {
                        var str = "<tr> " +
                                "<td> " + checkTdNUllOrEmpty(teacherList[i].teacherName) + " </td>" +
                                "<td> " + checkSex(teacherList[i].sex) + " </td>" +
                                "<td> " + getAge(teacherList[i].bornDate) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(teacherList[i].email) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(teacherList[i].schoolName) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(teacherList[i].collegeName) + " </td>" +
                                "<td> " + checkTdNUllOrEmpty(teacherList[i].className) + " </td>" +
                                "<td><button class='btn btn-warning marginTB-xs' onclick=toDetailPgae(teacherList[i].id)>详情</button>&nbsp;<button type='button' class='btn btn-danger marginTB-xs'>删除</button></td>" +
                                "</tr>"
                        $("#tbody").append(str);
                    }
                },
                error: function () {
                    alert("请求失败");
                }
            })
        });

//        $("button").live('click',function (teacherId){
//            $(this) //就是点击那那个button
//            alert(teacherId);
//            window.location.href = "/UI/detailTeacherUI?teacherId="+teacherId;
//        });

        function toDetailPgae(teacherId){
            alert(teacherId);
            window.location.href = "/UI/detailTeacherUI?teacherId="+teacherId;
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

<%--教师信息列表--%>
<table class="table table-striped" id="dataTable">
    <thead>
    <tr>
        <th>姓名</th>
        <th>性别</th>
        <th>年龄</th>
        <th>邮箱</th>
        <th>学校</th>
        <th>学院</th>
        <td>班级</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody id="tbody">
    <!-- 此处开始迭代 -->

    </tbody>
</table>

</body>
</html>
