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

    <script type="application/javascript">

        function taskbookList() {
            var pageNumber = 1;
            var pageSize = 10;
            $.ajax({
                type: "post",
                data: {"pageNumber": pageNumber, "pageSize": pageSize},
                url: "/taskbook/list",
                success: function (${recordPage}) {//返回数据根据结果进行相应的处理

                }
            })
        }

    </script>
</head>
<body class="overflow-hidden">
<div class="wrapper preload">
    <header class="top-nav">
        <div class="top-nav-inner">
            <div class="nav-header">
                <button type="button" class="navbar-toggle pull-left sidebar-toggle" id="sidebarToggleSM">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <ul class="nav-notification pull-right">
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog fa-lg"></i></a>
                        <span class="badge badge-danger bounceIn">1</span>
                        <ul class="dropdown-menu dropdown-sm pull-right user-dropdown">
                            <li class="user-avatar">
                                <img src="/images/profile/profile1.jpg" alt="" class="img-circle">

                                <div class="user-content">
                                    <h5 class="no-m-bottom">Jane Doe</h5>

                                    <div class="m-top-xs">
                                        <a href="profile.html" class="m-right-sm">Profile</a>
                                        <a href="signin.html">Log out</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="inbox.html">
                                    Inbox
                                    <span class="badge badge-danger bounceIn animation-delay2 pull-right">1</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Notification
                                    <span class="badge badge-purple bounceIn animation-delay3 pull-right">2</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="sidebarRight-toggle">
                                    Message
                                    <span class="badge badge-success bounceIn animation-delay4 pull-right">7</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">Setting</a>
                            </li>
                        </ul>
                    </li>
                </ul>

                <a href="/higherEducation/main" class="brand">
                    <i class="fa fa-database"></i><span class="brand-name">HAUT OA System</span>
                </a>
            </div>
            <div class="nav-container">
                <button type="button" class="navbar-toggle pull-left sidebar-toggle" id="sidebarToggleLG">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <ul class="nav-notification">
                    <li class="search-list">
                        <div class="search-input-wrapper">
                            <div class="search-input">
                                <input type="text" class="form-control input-sm inline-block">
                                <a href="#" class="input-icon text-normal"><i class="ion-ios7-search-strong"></i></a>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="pull-right m-right-sm">
                    <div class="user-block hidden-xs">
                        <a href="#" id="userToggle" data-toggle="dropdown">
                            <img src="/images/profile/profile1.jpg" alt=""
                                 class="img-circle inline-block user-profile-pic">
                            <div class="user-detail inline-block">
                                <i class="fa fa-angle-down"></i>
                            </div>
                        </a>

                        <div class="panel border dropdown-menu user-panel">
                            <div class="panel-body paddingTB-sm">
                                <ul>
                                    <li>
                                        <a href="profile.html">
                                            <i class="fa fa-edit fa-lg"></i><span class="m-left-xs">My Profile</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="inbox.html">
                                            <i class="fa fa-inbox fa-lg"></i><span class="m-left-xs">Inboxes</span>
                                            <span class="badge badge-danger bounceIn animation-delay3">2</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="signin.html">
                                            <i class="fa fa-power-off fa-lg"></i><span class="m-left-xs">Sign out</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ./top-nav-inner -->
    </header>
    <aside class="sidebar-menu fixed">
        <div class="sidebar-inner scrollable-sidebar">
            <div class="main-menu">
                <ul class="accordion">
                    <li class="menu-header">
                        Main Menu
                    </li>
                    <li class="bg-palette1 active">
                        <a href="/higherEducation/main">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-home fa-lg"></i></span>
										<span class="text m-left-sm">Home</span>
									</span>
									<span class="menu-content-hover block">
										Home
									</span>
                        </a>
                    </li>
                    <li class="openable bg-palette3">
                        <a href="#">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-list fa-lg"></i></span>
										<span class="text m-left-sm">任务书管理</span>
										<span class="submenu-icon"></span>
									</span>
									<span class="menu-content-hover block">
										任务书
									</span>
                        </a>
                        <ul class="submenu bg-palette4">
                            <li><a href="/page/taskbook/uploadTaskBook.jsp"><span class="submenu-label">上传任务书</span></a>
                            </li>
                            <li><a href="#" onclick="taskbookList()"><span class="submenu-label">查看任务书</span></a></li>
                        </ul>
                    </li>
                    <li class="openable bg-palette4">
                        <a href="#">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-tags fa-lg"></i></span>
										<span class="text m-left-sm">选课信息管理</span>
										<span class="submenu-icon"></span>
									</span>
									<span class="menu-content-hover block">
										选课
									</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="ui_element.html"><span class="submenu-label">我要选课</span></a></li>
                            <li><a href="button.html"><span class="submenu-label">我的选课</span></a></li>
                        </ul>
                    </li>
                    <li class="bg-palette1">
                        <a href="inbox.html">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-envelope fa-lg"></i></span>
										<span class="text m-left-sm">Inboxs</span>
										<small class="badge badge-danger badge-square bounceIn animation-delay5 m-left-xs">
                                            5
                                        </small>
									</span>
									<span class="menu-content-hover block">
										Inboxs
									</span>
                        </a>
                    </li>
                    <li class="bg-palette2">
                        <a href="timeline.html">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-clock-o fa-lg"></i></span>
										<span class="text m-left-sm">Timeline</span>
										<small class="badge badge-warning badge-square bounceIn animation-delay6 m-left-xs pull-right">
                                            7
                                        </small>
									</span>
									<span class="menu-content-hover block">
										Timeline
									</span>
                        </a>
                    </li>
                    <li class="menu-header">
                        Others
                    </li>
                    <li class="openable bg-palette3">
                        <a href="#">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-gift fa-lg"></i></span>
										<span class="text m-left-sm">Extra Pages</span>
										<span class="submenu-icon"></span>
									</span>
									<span class="menu-content-hover block">
										Pages
									</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="#"><span class="submenu-label">Sign in</span></a></li>
                            <li><a href="#"><span class="submenu-label">Sign Up</span></a></li>
                            <li><a href="#"><span class="submenu-label">Lock Screen</span></a></li>
                            <li><a href="#"><span class="submenu-label">Profile</span></a></li>
                            <li><a href="#"><span class="submenu-label">Gallery</span></a></li>
                            <li><a href="#"><span class="submenu-label">Blog</span></a></li>
                            <li><a href="#"><span class="submenu-label">Single Post</span></a></li>
                            <li><a href="#"><span class="submenu-label">Pricing</span></a></li>
                            <li><a href="#"><span class="submenu-label">Invoice</span></a></li>
                            <li><a href="error404.html"><span class="submenu-label">Error404</span></a></li>
                            <li><a href="#"><span class="submenu-label">Blank</span></a></li>
                        </ul>
                    </li>
                    <li class="openable bg-palette4">
                        <a href="#">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-list fa-lg"></i></span>
										<span class="text m-left-sm">Menu Level</span>
										<span class="submenu-icon"></span>
									</span>
									<span class="menu-content-hover block">
										Menu
									</span>
                        </a>
                        <ul class="submenu">
                            <li class="openable">
                                <a href="signin.html">
                                    <span class="submenu-label">menu 2.1</span>
                                    <small class="badge badge-success badge-square bounceIn animation-delay2 m-left-xs pull-right">
                                        3
                                    </small>
                                </a>
                                <ul class="submenu third-level">
                                    <li><a href="#"><span class="submenu-label">menu 3.1</span></a></li>
                                    <li><a href="#"><span class="submenu-label">menu 3.2</span></a></li>
                                    <li class="openable">
                                        <a href="#">
                                            <span class="submenu-label">menu 3.3</span>
                                            <small class="badge badge-danger badge-square bounceIn animation-delay2 m-left-xs pull-right">
                                                2
                                            </small>
                                        </a>
                                        <ul class="submenu fourth-level">
                                            <li><a href="#"><span class="submenu-label">menu 4.1</span></a></li>
                                            <li><a href="#"><span class="submenu-label">menu 4.2</span></a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="#"><span class="submenu-label">menu 2.2</span></a></li>
                        </ul>
                    </li>
                    <li class="bg-palette2">
                        <a href="/page/main/loading.jsp">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-desktop fa-lg"></i></span>
										<span class="text m-left-sm">关于我们</span>
									</span>
									<span class="menu-content-hover block">
										Loading
									</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="sidebar-fix-bottom clearfix">
                <div class="user-dropdown dropup pull-left">
                    <a href="#" class="dropdwon-toggle font-18" data-toggle="dropdown"><i class="ion-person-add"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="inbox.html">
                                Inbox
                                <span class="badge badge-danger bounceIn animation-delay2 pull-right">1</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Notification
                                <span class="badge badge-purple bounceIn animation-delay3 pull-right">2</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="sidebarRight-toggle">
                                Message
                                <span class="badge badge-success bounceIn animation-delay4 pull-right">7</span>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">Setting</a>
                        </li>
                    </ul>
                </div>
                <a href="/page/main/lockscreen.jsp" class="pull-right font-18"><i class="ion-log-out"></i></a>
            </div>
        </div>
        <!-- sidebar-inner -->
    </aside>

    <div class="main-container">
        <div class="padding-md">
            <div class="row">
                <div class="col-sm-6">
                    <div class="page-title">
                        Dashboard
                    </div>
                    <div class="page-sub-header">
                        Welcome Back, ${sessionScope.user.userName} , <i class="fa fa-map-marker text-danger"></i>
                        Zhengzhou
                    </div>
                </div>
            </div>
        </div>
        <!-- ./padding-md -->
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

<a href="#" class="scroll-to-top hidden-print"><i class="fa fa-chevron-up fa-lg"></i></a>

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<!-- Jquery -->
<script src="/js/jquery-1.11.1.min.js"></script>

<!-- Bootstrap -->
<script src="/bootstrap/js/bootstrap.min.js"></script>

<!-- Flot -->
<script src='/js/jquery.flot.min.js'></script>

<!-- Slimscroll -->
<script src='/js/jquery.slimscroll.min.js'></script>

<!-- Morris -->
<script src='/js/rapheal.min.js'></script>
<script src='/js/morris.min.js'></script>

<!-- Datepicker -->
<script src='/js/uncompressed/datepicker.js'></script>

<!-- Sparkline -->
<script src='/js/sparkline.min.js'></script>

<!-- Skycons -->
<script src='/js/uncompressed/skycons.js'></script>

<!-- Popup Overlay -->
<script src='/js/jquery.popupoverlay.min.js'></script>

<!-- Easy Pie Chart -->
<script src='/js/jquery.easypiechart.min.js'></script>

<!-- Sortable -->
<script src='/js/uncompressed/jquery.sortable.js'></script>

<!-- Owl Carousel -->
<script src='/js/owl.carousel.min.js'></script>

<!-- Modernizr -->
<script src='/js/modernizr.min.js'></script>

<!-- Simplify -->
<script src="/js/simplify/simplify.js"></script>
<script src="/js/simplify/simplify_dashboard.js"></script>


<script>
    $(function () {
        $('.chart').easyPieChart({
            easing: 'easeOutBounce',
            size: '140',
            lineWidth: '7',
            barColor: '#7266ba',
            onStep: function (from, to, percent) {
                $(this.el).find('.percent').text(Math.round(percent));
            }
        });

        $('.sortable-list').sortable();

        $('.todo-checkbox').click(function () {

            var _activeCheckbox = $(this).find('input[type="checkbox"]');

            if (_activeCheckbox.is(':checked')) {
                $(this).parent().addClass('selected');
            }
            else {
                $(this).parent().removeClass('selected');
            }

        });

        //Delete Widget Confirmation
        $('#deleteWidgetConfirm').popup({
            vertical: 'top',
            pagecontainer: '.container',
            transition: 'all 0.3s'
        });
    });

</script>

</body>
</html>
