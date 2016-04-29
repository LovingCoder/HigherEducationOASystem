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

      <form action="/taskbook/uploadTaskbook" class="form-inline" enctype="multipart/form-data" method="post">
        <div class="form-group">
          <label for="termName">请填写学期名称（如：2015-2016学年第一学期）</label>
          <input name="term" type="text" class="form-control" id="termName" placeholder="学期名称"/>
        </div>
        <div class="form-group">
          <label for="fileName">请选择文件</label>
          <input name="file" type="file" class="form-control" id="fileName"/>
        </div>
        <button type="submit" class="btn btn-success btn-sm">确认上传</button>
      </form>
    </div><!-- ./padding-md -->
  <%--</div><!-- /main-container -->--%>

  <footer class="footer">
				<span class="footer-brand">
					<strong class="text-danger">HAUT OA System</strong>
				</span>
    <p class="no-margin">
      &copy; 2016 <strong>CoderKK</strong>. ALL Rights Reserved.
    </p>
  </footer>
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

  function testfn()	{
    $
  }

  var test = testfn();

</script>
</body>
</html>
