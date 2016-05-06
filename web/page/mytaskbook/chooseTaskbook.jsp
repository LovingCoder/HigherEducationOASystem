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

    <script src="/jquery/jquery.min.js"></script>

    <script src="/js/validation.js"></script>

    <script type="text/javascript">

        /**
         * 获取session
         * */
        var session =<%=session.getAttribute("user")%>;
        /*获取没有被选择的任务书 课程列表 页面加载就获取*/
        $(function () {
            var schoolId = session.teacher.schoolId;
            var collegeId = session.teacher.collegeId;
            if (null == schoolId || "" == schoolId || null == collegeId || "" == collegeId) {
                alert("对不起，您没有该权限！点击回到首页");
                window.location.href = "/index/frame";
                return false;
            }
            var para = {
                "requestTime": "2016-03-15 15:38:09.009",
                "requestMethod": "",
                "sessionId": "2c88449748214631ac43e6b370bd1034",
                "requestId": "1a30fa8c-362d-4634-86f6-6f1e600e40db",
                "requestContent": {
                    "schoolId": schoolId,
                    "collegeId": collegeId
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
                url: "/taskbook/getNotChoosenTaskbook",	//把数据发送到/taskbook/getNotChoosenTaskbook
                data: para,	//要发送的是para中的数据
                async: false,
                error: function (data) {
                    alert("数据错误！");
                },
                success: function (data) {
                    /*如果返回状态等于0 请求成功 否则弹出提示信息*/
                    if (0 == data.status) {
                        //将请求成功的数据显示出来
                        var responseContent = data.responseContent;
//                        responseContent = null;
                        var tbody = $("#tbody");
                        for (var i in responseContent) {
                            var str = "<tr> " +
                                    "<td><input class='tgl tgl-flip' id='" + responseContent[i].id + "' type='checkbox' value='" + responseContent[i].id + "' onclick='checking(" + responseContent[i].id + ")' name='checkbox'><label class='tgl-btn' data-tg-off='未选' data-tg-on='已选' for='" + responseContent[i].id + "'></label></td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].serialNumber) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].courseCode) + " </td> " +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].courseName) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].teachingNumber) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].major) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].schoolZone) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].classAndStudent) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].grade) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].totalStudent) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].testType) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].weekTime) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].totalTime) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].startAndEndWeek) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].classHour) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].courseProperty) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].mergeClassOpinion) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].classRoomType) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].term) + " </td>" +
                                    "</tr>"
                            tbody.append(str);
                        }
                    } else {
                        alert(data["message"]);
                    }
                }

            });
        });

        function go() {
            var number = document.getElementById("jump").value;
            $.ajax({
                type: "post",
                data: {"pageNumber": number},
                url: "/taskbook/list",
                success: function (data) {

                },
                error: function () {
                    alert("调用失败");
                }
            })
        }
        ;

        /**
         * 搜索任务书
         */
        function search() {
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
                        tbody.empty();
                        for (var i in responseContent) {
                            var str = "<tr> " +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].serialNumber) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].courseCode) + " </td> " +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].courseName) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].teachingNumber) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].major) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].schoolZone) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].classAndStudent) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].grade) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].totalStudent) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].testType) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].weekTime) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].totalTime) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].startAndEndWeek) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].classHour) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].teacherSign) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].title) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].courseProperty) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].mergeClassOpinion) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].classRoomType) + " </td>" +
                                    "<td> " + checkTdNUllOrEmpty(responseContent[i].term) + " </td>" +
                                    "</tr>"
                            tbody.append(str);
                        }
                    } else {
                        alert(data["message"]);
                    }
                },
                error: function () {
                    alert("调用失败");
                }
            })
        }

        /**
         * 异步请求该课程是否已经被选
         */
        $(document).on("click", ".tgl", function () {
            var taskbookId = $(this).attr("id");
            if ($(this)[0].checked == true) {
                alert(taskbookId);
                var para = {
                    "requestTime": "2016-03-15 15:38:09.009",
                    "requestMethod": "",
                    "sessionId": "2c88449748214631ac43e6b370bd1034",
                    "requestId": "1a30fa8c-362d-4634-86f6-6f1e600e40db",
                    "requestContent": {
                        "taskbookId": taskbookId
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
                    url: "/taskbook/checkTaskbookIsChoosen",	//把数据发送到/taskbook/checkTaskbookIsChoosen
                    data: para,	//要发送的是para中的数据
                    async: false,
                    error: function (data) {
                        alert("数据错误！");
                    },
                    success: function (data) {
                        /*如果返回状态等于0 说明该课程可以用 弹出课程的信息 如果状态是1 说明该课程已经被选了 弹出课程信息以及选课的教师*/
                        alert(data.responseContent);
                        if(0 == data.status){

                        }else if(1 == data.status){

                        }
                    }

                });
            } else {
                alert("你还没点呢");
            }
        });


        //        $(".tgl").each(function(){
        //            var schoolId = $(this).attr("id");
        //            if($(this)[0].checked == true){
        //                alert(schoolId);
        //            }else{
        //                alert("你还没点呢");
        //            }
        //        });


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
        <button type="button" class="btn btn-sm btn-success" id="search" onclick="search()">Search</button>
        <button type="button" class="btn btn-sm btn-success" id="choose" onclick="search()" style="float: right">
            提交所选课程
        </button>
    </div>
    <table class="table table-striped" id="dataTable">
        <thead>
        <tr>
            <th>选定</th>
            <th>序号</th>
            <th>课程代码</th>
            <th>课程名称</th>
            <th>教学计划号</th>
            <th>专业</th>
            <th>校区</th>
            <th>班级及人数</th>
            <th>年级</th>
            <th>总人数</th>
            <th>考核方式</th>
            <th>周学时</th>
            <th>总学时</th>
            <th>上课起止周次</th>
            <th>时数</th>
            <th>课程性质</th>
            <th>合班意见</th>
            <th>教室类型</th>
            <th>学期</th>
        </tr>
        </thead>
        <tbody id="tbody">
        </tbody>
    </table>
    <div class="pages" id="page">
        <div id="Pagination">
            <ul class="pagination pagination-split"></ul>
        </div>
        <div class="searchPage">
            <span class="page-sum">共<strong class="allPage">${recordPage.totalPage}</strong>页</span>
            <span class="page-go">跳转到第<input type="text" id="jump">页</span>
            <button type="button" class="btn btn-success marginTB-xs" onclick="go()">GO<i
                    class="fa fa-angle-double-right m-left-xs"></i></button>
        </div>
    </div>
    <footer class="footer">
				<span class="footer-brand">
					<strong class="text-danger">HAUT OA System</strong>
				</span>

        <p class="no-margin">
            &copy; 2016 <strong>CoderKK</strong>. ALL Rights Reserved.
        </p>
    </footer>
</div>
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


</body>
</html>
