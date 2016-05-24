<%--
  Created by IntelliJ IDEA.
  User: Tang
  Date: 2016/5/6
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>选课列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="/css/font-awesome.min.css" rel="stylesheet">

    <!-- ionicons -->
    <link href="/css/ionicons.min.css" rel="stylesheet">

    <!-- Simplify -->
    <link href="/css/simplify.min.css" rel="stylesheet">
    <link href="/css/checkboxStyle.css" rel="stylesheet">
    <!-- Tag Input -->
    <link href="/css/jquery.tagsinput.css" rel="stylesheet">

    <link href="/css/style.css" rel="stylesheet">

    <script src="/jquery/jquery.min.js"></script>

    <link rel="stylesheet" href="/css/ui-dialog.css">
    <script src="/js/dialog-min.js"></script>
    <script src="/js/validation.js"></script>

    <script type="text/javascript">

        /**
         * 获取session
         * */
        var session =<%=session.getAttribute("user")%>;

        /**
         * 页面加载的时候判断该用户是否有学校和学院
         * */
        $(document).ready(function () {
            var collegeId = session.teacher.collegeId;
            var schoolId = session.teacher.schoolId;
            if (null == collegeId || '' == collegeId || null == schoolId || '' == schoolId) {
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
            }
        });

        /*获取没有被选择的任务书 课程列表 页面加载就获取*/
        function queryNotChoosenTaskbook(currentPage) {
            var schoolId = session.teacher.schoolId;
            var collegeId = session.teacher.collegeId;
            if (null == schoolId || "" == schoolId || null == collegeId || "" == collegeId) {
                alert("对不起，您没有该权限！点击回到首页");
                window.location.href = "/index/frame";
                return false;
            }
            var para = {
                "requestContent": {
                    "courseName": $("#courseName").val(),
                    "major": $("#major").val(),
                    "courseProperty": $("#courseProperty").val(),
                    "term": $("#term").val()
                },
                "pageInfo": {
                    "pageSize": 10,
                    "currentPage": currentPage
                }
            };
            $.ajax({
                cache: false,
                type: "POST",
                dataType: "json",		  //json格式，重要
                url: "/taskbook/getNotChoosenTaskbook",	//把数据发送到/taskbook/getNotChoosenTaskbook
                data: para,	//要发送的是para中的数据
                async: false,
                error: function (data) {
                    alert("数据错误！");
                },
                success: function (data) {
                    totalPage = data.page.totalPage;
                    /*如果返回状态等于0 请求成功 否则弹出提示信息*/
                    if (0 == data.status) {
                        //将请求成功的数据显示出来
                        var responseContent = data.responseContent;
//                        responseContent = null;
                        var tbody = $("#tbody");
                        tbody.empty();
                        for (var i in responseContent) {
                            var str = "<tr> " +
                                    "<td><input class='tgl tgl-flip' id='" + responseContent[i].id + "' type='checkbox' value='" + responseContent[i].id + "' onclick='checking(" + responseContent[i].id + ")' name='checkbox'><label class='tgl-btn' data-tg-off='未选' data-tg-on='已选' for='" + responseContent[i].id + "'></label></td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].serialNumber) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].courseCode) + " </td> " +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].courseName) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].teachingNumber) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].major) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].schoolZone) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].classAndStudent) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].grade) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].totalStudent) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].testType) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].weekTime) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].totalTime) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].startAndEndWeek) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].classHour) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].courseProperty) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].mergeClassOpinion) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].classRoomType) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].term) + " </td>" +
                                    "</tr>"
                            tbody.append(str);
                        }
                    } else {
                        alert(data["message"]);
                    }
                    $('#pagination').jqPaginator('option', {
                        totalPages: totalPage
                    });
                }

            });
        }

        /**
         * 点击复选框时获取里边的值
         */
        var taskbookIds = new Array();
        $(document).on("click", ".tgl", function () {
            var taskbookId = $(this).attr("id");
            if ($(this)[0].checked == true){
                taskbookIds.push(taskbookId);
            }else{
                for(var i = 0; i < taskbookIds.length; i++){
                    if(taskbookId == taskbookIds[i]){
                        delete taskbookIds[i];
                    }
                }
            }
        });


        /**
        * 选课
         */
        function chooseTaskbook(){
            var teacherId = session.teacher.id;
            var para = {
                "requestContent": {
                    "taskbookIds": taskbookIds.toLocaleString(),
                    "teacherId":teacherId
                },
                "pageInfo": {
                    "pageSize": 10,
                    "currentPage": 1
                }
            };
            $.ajax({
                cache: false,
                type: "POST",
                dataType: "json",		  //json格式，重要
                url: "/taskbook/newChooseTaskbook",	//把数据发送到/taskbook/newChooseTaskbook
                data: para,	//要发送的是para中的数据
                async: false,
                error: function (data) {
                    alert("数据错误！");
                },
                success: function (data) {
                    totalPage = data.page.totalPage;
                    if(0 == data.status){
                        var myChooseTaskbookList = data.responseContent.myChooseTaskbookList;
                        var conflictTaskbookList = data.responseContent.conflictTaskbookList;
                        var a = "";
                        var b = "";
                        for(var i in myChooseTaskbookList){
                            a = a + "<tr> " +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].serialNumber) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].courseCode) + " </td> " +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].courseName) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].teachingNumber) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].major) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].schoolZone) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].classAndStudent) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].grade) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].totalStudent) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].testType) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].weekTime) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].totalTime) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].startAndEndWeek) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].classHour) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].courseProperty) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].mergeClassOpinion) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].classRoomType) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(myChooseTaskbookList[i].term) + " </td>" +
                                    "</tr>";
                        }
                        for(var i in conflictTaskbookList){
                            b = b + "<tr> " +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].serialNumber) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].courseCode) + " </td> " +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].courseName) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].teachingNumber) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].major) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].schoolZone) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].classAndStudent) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].grade) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].totalStudent) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].testType) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].weekTime) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].totalTime) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].startAndEndWeek) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].classHour) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].courseProperty) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].mergeClassOpinion) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].classRoomType) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(conflictTaskbookList[i].term) + " </td>" +
                                    "</tr>";
                        }
                        var str = "<table class='table table-striped'>" +
                                "<thead><tr><th class='td-style'>序号</th>" +
                                "<th class='td-style'>课程代码</th>" +
                                "<th class='td-style'>课程名称</th>" +
                                "<th class='td-style'>教学计划号</th>" +
                                "<th class='td-style'>专业</th>" +
                                "<th class='td-style'>校区</th>" +
                                "<th class='td-style'>班级及人数</th>" +
                                "<th class='td-style'>年级</th>" +
                                "<th class='td-style'>总人数</th>" +
                                "<th class='td-style'>考核方式</th>" +
                                "<th class='td-style'>周学时</th>" +
                                "<th class='td-style'>总学时</th>" +
                                "<th class='td-style'>上课起止周次</th>" +
                                "<th class='td-style'>时数</th>" +
                                "<th class='td-style'>课程性质</th>" +
                                "<th class='td-style'>合班意见</th>" +
                                "<th class='td-style'>教室类型</th>" +
                                "<th class='td-style'>学期</th>" +
                                "</tr></thead><tbody><tr><td colspan='18'>本次选定课程</td><tr>"+a+"<tr><td colspan='18'>未选定课程（与其他教师冲突）</td><tr>"+b+"<tbody></table>";
                        var d = dialog({
                            cancelValue: '我知道了，再看看',
                            cancel: function () {
                                window.location.reload();
                            },
                            okValue: '选完了，去看看我的选课列表',
                            ok: function () {
                                window.location.href = '/UI/queryMyTaskbookUI';
                            },
                            title:'本次选课详情',
                            content:str
                        });
                        d.show();
                    }else if(1 == data.status){
                        alert(data.message);
                    }
                }

            });
        }


    </script>
</head>

<body>
<div class="padding-md">
    <ul class="breadcrumb">
        <li><span class="primary-font"><i class="icon-home"></i></span><a href="index.html"> Home</a></li>
        <li>选课管理</li>
        <li>我要选课</li>
    </ul>
    <div class="form-inline no-margin">
        <div class="form-group">
            <label class="sr-only">课程名称</label>
            <input type="text" class="form-control" placeholder="课程名称" id="courseName" name="courseName">
        </div>
        <!-- /form-group -->
        <div class="form-group">
            <label class="sr-only">专业</label>
            <input type="text" class="form-control" placeholder="专业" id="major" name="major">
        </div>
        <!-- /form-group -->
        <div class="form-group">
            <label class="sr-only">课程性质</label>
            <input type="text" class="form-control" placeholder="课程性质" id="courseProperty"
                   name="courseProperty">
        </div>
        <!-- /form-group -->
        <div class="form-group">
            <label class="sr-only">学期</label>
            <input type="text" class="form-control" placeholder="学期" id="term" name="term">
        </div>
        <!-- /form-group -->
        <button type="button" class="btn btn-sm btn-success" id="search" onclick="queryNotChoosenTaskbook(1)">Search</button>
        <button type="button" class="btn btn-sm btn-success" id="choose" onclick="chooseTaskbook()" style="float: right">
            提交所选课程
        </button>
    </div>
    <table class="table table-striped" id="dataTable" style="table-layout:fixed;height: 70%">
        <thead>
        <tr>
            <th class="td-style">选定</th>
            <th class="td-style">序号</th>
            <th class="td-style">课程代码</th>
            <th class="td-style">课程名称</th>
            <th class="td-style">教学计划号</th>
            <th class="td-style">专业</th>
            <th class="td-style">校区</th>
            <th class="td-style">班级及人数</th>
            <th class="td-style">年级</th>
            <th class="td-style">总人数</th>
            <th class="td-style">考核方式</th>
            <th class="td-style">周学时</th>
            <th class="td-style">总学时</th>
            <th class="td-style">上课起止周次</th>
            <th class="td-style">时数</th>
            <th class="td-style">课程性质</th>
            <th class="td-style">合班意见</th>
            <th class="td-style">教室类型</th>
            <th class="td-style">学期</th>
        </tr>
        </thead>
        <tbody id="tbody">
        </tbody>
    </table>
</div>
<%-- 分页 --%>
<ul class="pagination" id="pagination"></ul>
<a href="#" class="scroll-to-top hidden-print"><i class="fa fa-chevron-up fa-lg"></i></a>
<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<!-- Jquery -->
<script src="/js/jquery-1.11.1.min.js"></script>

<!-- Bootstrap -->
<script src="/bootstrap/js/bootstrap.min.js"></script>

<!-- Slimscroll -->
<script src='/js/jquery.slimscroll.min.js'></script>

<!-- Popup Overlay -->
<script src='/js/jquery.popupoverlay.min.js'></script>

<!-- Modernizr -->
<script src='/js/modernizr.min.js'></script>

<!-- Simplify -->
<script src="/js/simplify/simplify.js"></script>

<%-- 调用分页插件 --%>
<script src="/jquery/jquery.min.js"></script>
<script src="/js/jqPaginator.js"></script>
<script type="application/javascript">

    $.jqPaginator('#pagination', {
        totalPages: 1,
        visiblePages: 10,
        currentPage: 1,
        onPageChange: function (num) {
            queryNotChoosenTaskbook(num);
        }
    });
</script>
</body>
</html>
