<%--
  Created by IntelliJ IDEA.
  User: Tang
  Date: 2016/5/10
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>教师选课情况</title>
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
    <link href="/css/style.css" rel="stylesheet">

    <script src="/jquery/jquery.min.js"></script>

    <script src="/js/validation.js"></script>

    <script type="text/javascript">

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

        /*获取课程状态 页面加载就获取*/
        function queryTaskbookStatus(currentPage) {
            //获取下拉框选中的值
            var obj = document.getElementById('isChoosen');
            var index = obj.selectedIndex; //序号，取当前选中选项的序号
            var isChoosen = obj.options[index].value;
            var para = {
                "requestId": "1a30fa8c-362d-4634-86f6-6f1e600e40db",
                "requestContent": {
                    "isChoosen": isChoosen,
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
                url: "/taskbook/queryTaskbookStatus",
                data: para,	//要发送的是para中的数据
                async: false,
                error: function (data) {
                    alert("数据错误！");
                },
                success: function (data) {
                    totalPage = data.page.totalPage;
                    /*如果返回状态等于0 请求成功*/
                    if (0 == data.status) {
                        //将请求成功的数据显示出来
                        var responseContent = data.responseContent;
                        var tbody = $("#tbody");
                        tbody.empty();
                        for (var i in responseContent) {
                            var str = "<tr> " +
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
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].teacherSign) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].title) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].courseProperty) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].mergeClassOpinion) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].classRoomType) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].term) + " </td>" +
                                    "<td class='td-style'> " + checkTdNUllOrEmpty(responseContent[i].teacherName) + " </td>" +
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
    </script>
</head>

<body>
<div class="padding-md">
    <ul class="breadcrumb">
        <li><span class="primary-font"><i class="icon-home"></i></span><a href="index.html"> Home</a></li>
        <li>选课管理</li>
        <li>教师选课情况查看</li>
        <li>课程状态查看</li>
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

        <div class="form-group">
            <select class="form-control" id="isChoosen" name="isChoosen">
                <option selected="selected" value="">全部课程</option>
                <option value="1">已被选择课程</option>
                <option value="0">未被选择课程</option>
            </select>
        </div>
        <!-- /form-group -->
        <button type="button" class="btn btn-sm btn-success" id="search" onclick="queryTaskbookStatus(1)">Search</button>
    </div>
    <table class="table table-striped" id="dataTable" style="table-layout:fixed;height: 70%">
        <thead>
        <tr>
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
            <th class="td-style">教师签名</th>
            <th class="td-style">职称</th>
            <th class="td-style">课程性质</th>
            <th class="td-style">合班意见</th>
            <th class="td-style">教室类型</th>
            <th class="td-style">学期</th>
            <th class="td-style">选课教师</th>
        </tr>
        </thead>
        <tbody id="tbody">
        </tbody>
    </table>
</div>
<%--<footer class="footer">
				<span class="footer-brand">
					<strong class="text-danger">HAUT OA System</strong>
				</span>

    <p class="no-margin">
        &copy; 2016 <strong>CoderKK</strong>. ALL Rights Reserved.
    </p>
</footer>--%>
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

<!-- Datatable -->
<script src='/js/jquery.dataTables.min.js'></script>
<script src='/js/uncompressed/dataTables.bootstrap.js'></script>

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
        onPageChange: function (num, type) {
            queryTaskbookStatus(num);
        }
    });
</script>
</body>
</html>
