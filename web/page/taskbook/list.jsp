<%--
  Created by IntelliJ IDEA.
  User: Tang
  Date: 2016/4/7
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>任务书列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

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

    <script type="text/javascript">
        function go() {
            var number = document.getElementById("jump").value;
//            var recordPage = eval("("+XMLHttpRequest.response()+")");
//            alert(recordPage);
            $.ajax({
                type: "post",
                data: {"pageNumber": number},
                url: "/taskbook/list",
                success: function () {

                },
                error: function () {
                    alert("调用失败");
                }
            })
        };

        $("#search").click(function(){
            alert("123");
            $.ajax({
                type: "post",
                data: {
                    "courseName": $("#courseName").val
                    , "major": document.getElementById("major").value,
                    "courseProperty": document.getElementById("courseProperty").value
                    , "term": document.getElementById("term").value
                },
                url: "/taskbook/list",
                success: function () {

                },
                error: function () {
                    alert("调用失败");
                }
            })
        });
    </script>
</head>

<body class="overflow-hidden">
<div class="wrapper preload">
    
    <jsp:include page="/page/common/common.html"/>


    <div class="main-container">
        <div class="padding-md">
            <ul class="breadcrumb">
                <li><span class="primary-font"><i class="icon-home"></i></span><a href="index.html"> Home</a></li>
                <li>任务书管理</li>
                <li>任务书列表</li>
            </ul>
            <div>
                <form class="form-inline no-margin" id="searchForm">
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
                    <button type="button" class="btn btn-sm btn-success" id="search">Search</button>
                    <script>
                        $("#search").click(function(){
                            $.ajax({
                                type: "post",
                                data: {
                                    "courseName": document.getElementById("courseName").value
                                    , "major": document.getElementById("major").value,
                                    "courseProperty": document.getElementById("courseProperty").value
                                    , "term": document.getElementById("term").value
                                },
                                url: "/taskbook/list",
                                success: function () {

                                },
                                error: function () {
                                    alert("调用失败");
                                }
                            })
                        })
                    </script>
                </form>
            </div>
            <table class="table table-striped" id="dataTable" >
                <thead>
                <tr>
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
                    <th>教师签名</th>
                    <th>职称</th>
                    <th>课程性质</th>
                    <th>合班意见</th>
                    <th>教室类型</th>
                    <th>学期</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="taskbook" items="${recordPage.list}">
                    <tr>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.serialNumber == null || taskbook.serialNumber == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.serialNumber}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.courseCode == null || taskbook.courseCode == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.courseCode}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.courseName == null || taskbook.courseName == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.courseName}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.teachingNumber == null || taskbook.teachingNumber == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.teachingNumber}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.major == null || taskbook.major == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.major}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.schoolZone == null || taskbook.schoolZone == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.schoolZone}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.classAndStudent == null || taskbook.classAndStudent == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.classAndStudent}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.grade == null || taskbook.grade == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.grade}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.totalStudent == null || taskbook.totalStudent == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.totalStudent}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.testType == null || taskbook.testType == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.testType}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.weekTime == null || taskbook.weekTime == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.weekTime}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.totalTime == null || taskbook.totalTime == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.totalTime}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.startAndEndWeek == null || taskbook.startAndEndWeek == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.startAndEndWeek}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.classHour == null || taskbook.classHour == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.classHour}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.teacherSign == null || taskbook.teacherSign == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.teacherSign}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.title == null || taskbook.title == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.title}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.courseProperty == null || taskbook.courseProperty == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.courseProperty}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.mergeClassOpinion == null || taskbook.mergeClassOpinion == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.mergeClassOpinion}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.classRoomType == null || taskbook.classRoomType == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.classRoomType}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${taskbook.term == null || taskbook.term == ''}">
                                    <span class="label label-danger">未填写</span>
                                </c:when>
                                <c:otherwise>
                                    ${taskbook.term}
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- ./padding-md -->
        <%--<div id="pager">
            <ul class="pagination pagination-split">
                <li class="disabled"><a href="#">&laquo;</a></li>
                <li class="active"><a href="/taskbook/list?pageNumber=1">1</a></li>
                <li><a href="/taskbook/list?pageNumber=2">2</a></li>
                <li><a href="/taskbook/list?pageNumber=3">3</a></li>
                <li><a href="/taskbook/list?pageNumber=4">4</a></li>
                <li><a href="/taskbook/list?pageNumber=5">5</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </div>--%>
        <div class="pages">
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
    </div>
    <!-- /main-container -->
    <footer class="footer">
				<span class="footer-brand">
					<strong class="text-danger">HAUT OA System</strong>
				</span>

        <p class="no-margin">
            &copy; 2016 <strong>CoderKK</strong>. ALL Rights Reserved.
        </p>
    </footer>
</div>
<!-- /wrapper -->
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
