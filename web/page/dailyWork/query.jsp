<%--
  Created by IntelliJ IDEA.
  User: Tang
  Date: 2016/5/11
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>事务列表</title>
  <!-- Bootstrap core CSS -->
  <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Font Awesome -->
  <link href="/css/font-awesome.min.css" rel="stylesheet">

  <!-- ionicons -->
  <link href="/css/ionicons.min.css" rel="stylesheet">

  <!-- Simplify -->
  <link href="/css/simplify.min.css" rel="stylesheet">

  <link rel="stylesheet" href="/css/ui-dialog.css">

  <script src="/jquery/jquery.min.js"></script>
  <script src="/js/dialog-min.js"></script>

  <script src="/js/validation.js"></script>

  <script type="application/javascript">

    /**
     * 获取本学院教师列表 页面一加载就执行
     */
    var session =<%=session.getAttribute("user")%>;
    var teacherList;
    $(function () {
      var collegeId = session.teacher.collegeId;
      var schoolId = session.teacher.schoolId;
      if (null == collegeId || '' == collegeId || null == schoolId || '' == schoolId) {
        alert("对不起！您没有在该学校或者学院任职！无法执行操作！");
        return false;
      }
      var para = {
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
        url: "/dailyWork/queryDailyWork",
        dataType: "json",
        cache: false,
        async: false,
        success: function (data) {
          //给表格填充值
          var dailyWorkList = data.responseContent;
          for (var i in dailyWorkList) {
            var str = "<tr> " +
                    "<td> " + checkTdNUllOrEmpty(dailyWorkList[i].commanderTeacher.teacherName) + " </td>" +
                    "<td> " + checkTdNUllOrEmpty(dailyWorkList[i].title) + " </td>" +
                    "<td> " + checkDailyWorkType(dailyWorkList[i].workType) + " </td>" +
                    "<td> " + checkTdNUllOrEmpty(dailyWorkList[i].beginTime) + " </td>" +
                    "<td> " + checkTdNUllOrEmpty(dailyWorkList[i].endTime) + " </td>" +
                    "<td> " + checkTdNUllOrEmpty(dailyWorkList[i].executorTeacher.teacherName) + " </td>" +
                    "<td> " + checkTdNUllOrEmpty(dailyWorkList[i].desText) + " </td>" +
                    "<td><button class='btn btn-warning marginTB-xs detailClick'>详情</button>&nbsp;<button type='button' class='btn btn-danger marginTB-xs'>删除</button></td>" +
                    "</tr>";
              alert(str);
            $("#tbody").append(str);
          }

          //给详情按钮添加点击事件
          $(".detailClick").click(function(){
            var inx = $(".detailClick").index(this);
            for(var i=0;i<teacherList.length;i++){
              if(i == inx){
                window.location.href = "/UI/detailTeacherUI?teacherId="+teacherList[i].id;
//                                var d = dialog({
//                                    title: '教师详情',
//                                    content: '按钮回调函数返回 false 则不许关闭',
//                                    okValue: '提交更改',
//                                    ok: function () {
//                                        this.title('提交中…');
//                                        return false;
//                                    },
//                                    cancelValue: '返回',
//                                    cancel: function () {}
//                                });
//                                d.show();

              }
            }
          });
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

    function toDetailPgae(){
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
    <th>发布老师</th>
    <th>标题</th>
    <th>类型</th>
    <th>开始时间</th>
    <th>结束时间</th>
    <th>执行老师</th>
    <th>详细信息</th>
      <th>操作</th>
  </tr>
  </thead>
  <tbody id="tbody">
  </tbody>
</table>

</body>
</html>
