<%--
  Created by IntelliJ IDEA.
  User: Tang
  Date: 2016/4/20
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Simplify Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="/css/font-awesome.min.css" rel="stylesheet">

    <!-- ionicons -->
    <link href="/css/ionicons.min.css" rel="stylesheet">

    <!-- Dropzone -->
    <link href="/css/dropzone/css/dropzone.css" rel="stylesheet">

    <!-- Simplify -->
    <link href="/css/simplify.min.css" rel="stylesheet">

    <script src="/jquery/jquery.min.js"></script>

    <%--对话框插件--%>
    <link rel="stylesheet" href="/css/ui-dialog.css">
    <script src="/js/dialog-min.js"></script>

    <script type="application/javascript">

        var session = <%=session.getAttribute("user")%>;

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
                        return false;
                    }
                });
                d.showModal();
            } else {

            }
        });

        function uploadTaskbook() {
            var formData = new FormData();
            if (null == $("#termName").val() || "" == $.trim($("#termName").val())) {
                alert("请填写学期！");
                return false;
            }
            if (null == $("#file")[0].files[0]) {
                alert("请选择要上传的任务书excel文件！");
                return false;
            }
            if (null == session.teacher || null == session.teacher.collegeId || '' == session.teacher.collegeId || null == session.teacher.schoolId || '' == session.teacher.schoolId || 0!=session.teacher.userRole) {
                alert("对不起，您没有上传文件权限！");
                return false;
            }
            formData.append('term', $("#termName").val());
            formData.append('file', $("#file")[0].files[0]);
            $.ajax({
                url: '/taskbook/uploadTaskbook',
                type: 'POST',
                cache: false,
                data: formData,
                processData: false,
                contentType: false
            }).done(function (res) {
                if (res["status"] == 0) {
                    alert(res["message"]);
                    window.location.href = "/UI/queryTaskbookUI";
                } else {
                    alert(res["message"]);
                }
            }).fail(function (res) {
                alert(res["message"]);
            });
        }
    </script>
</head>

<body class="overflow-hidden">
<%--<jsp:include page="/page/common/common.html"/>--%>

<%--<div class="main-container">--%>
<div class="padding-md">
    <ul class="breadcrumb">
        <li><span class="primary-font"><i class="icon-home"></i></span><a href="index.html"> Home</a></li>
        <li>任务书管理</li>
        <li>上传任务书</li>
    </ul>
    <div class="alert alert-info alert-custom">
        <i class="fa fa-warning"></i><span class="m-left-xs">请选择要上传的任务书.</span>
    </div>
    <div class="form-group">
        <label for="termName">请填写学期名称（如：2015-2016学年第一学期）</label>
        <input name="term" type="text" class="form-control" id="termName" placeholder="学期名称"/>
    </div>
    <div class="form-group">
        <label for="file">请选择文件</label>
        <input name="file" type="file" class="form-control" id="file"/>
    </div>
    <button type="button" class="btn btn-success btn-sm" onclick="uploadTaskbook()">确认上传</button>
</div>
<!-- ./padding-md -->
<%--</div><!-- /main-container -->--%>

<%--<footer class="footer">
				<span class="footer-brand">
					<strong class="text-danger">HAUT OA System</strong>
				</span>

    <p class="no-margin">
        &copy; 2016 <strong>CoderKK</strong>. ALL Rights Reserved.
    </p>
</footer>--%>
</div><!-- /wrapper -->

<a href="#" class="scroll-to-top hidden-print"><i class="fa fa-chevron-up fa-lg"></i></a>

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<!-- Jquery -->
<script src="/js/jquery-1.11.1.min.js"></script>

<!-- Bootstrap -->
<script src="/bootstrap/js/bootstrap.min.js"></script>

<!-- Popup Overlay -->
<script src='/js/jquery.popupoverlay.min.js'></script>

<!-- Dropzone -->
<script src='/js/dropzone.min.js'></script>

<!-- Slimscroll -->
<script src='/js/jquery.slimscroll.min.js'></script>

<!-- Modernizr -->
<script src='/js/modernizr.min.js'></script>

<!-- Simplify -->
<script src="/js/simplify/simplify.js"></script>

<script>

    function testfn() {
        $
    }

    var test = testfn();

</script>
</body>
</html>
