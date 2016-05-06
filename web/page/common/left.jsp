<%--
  User: Administrator
  Date: 2016/4/28 0028
  Time: 上午 9:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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

    <base target="mainFrame">
</head>
<body>
<div class="sidebar-menu fixed">
    <%--<div class="sidebar-inner scrollable-sidebar">--%>
    <div class="main-menu">
        <ul class="accordion">
            <li class="menu-header">
                主菜单
            </li>
            <!-- 任务书管理 -->
            <li class="openable bg-palette2">
                <a href="#">
									<span class="menu-content block openable">
										<span class="menu-icon"><i class="block fa fa-list fa-lg"></i></span>
										<span class="text m-left-sm">任务书管理</span>
										<span class="submenu-icon"></span>
									</span>
									<span class="menu-content-hover block">
										任务书
									</span>
                </a>
                <ul class="submenu bg-palette4">
                    <li><a href="/UI/uploadTaskbookUI"><span class="submenu-label">上传任务书</span></a>
                    </li>
                    <li><a href="/UI/queryTaskbookUI"><span
                            class="submenu-label">查看任务书</span></a></li>
                </ul>
            </li>

            <!-- 选课管理 -->
            <li class="openable bg-palette4">
                <a href="#">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-tags fa-lg"></i></span>
										<span class="text m-left-sm">选课管理</span>
										<span class="submenu-icon"></span>
									</span>
									<span class="menu-content-hover block">
										选课
									</span>
                </a>
                <ul class="submenu">
                    <li><a href="/UI/chooseTaskbookUI"><span class="submenu-label">我要选课</span></a></li>
                    <li><a href="ui_element.html"><span class="submenu-label">我的选课列表</span></a></li>
                </ul>
            </li>

            <!-- 期中教学管理 -->
            <li class="bg-palette1">
                <a href="inbox.html">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-envelope fa-lg"></i></span>
										<span class="text m-left-sm">期中教学管理</span>
                                        <!--<small class="badge badge-danger badge-square bounceIn animation-delay5 m-left-xs">-->
                                        <!--5-->
                                        <!--</small>-->
									</span>
									<span class="menu-content-hover block">
										教学
									</span>
                </a>
            </li>

            <!-- 教师管理 -->
            <li class="openable bg-palette3">
                <a href="#">
									<span class="menu-content block openable">
										<span class="menu-icon"><i class="block fa fa-list fa-lg"></i></span>
										<span class="text m-left-sm">教师信息管理</span>
										<span class="submenu-icon"></span>
									</span>
									<span class="menu-content-hover block">
										教师
									</span>
                </a>
                <ul class="submenu bg-palette4">
                    <li><a href="/UI/addTeacherUI"><span class="submenu-label">添加教师</span></a>
                    </li>
                    <li><a href="/UI/queryTeacherUI"><span
                            class="submenu-label">查看本学院教师列表</span></a></li>
                </ul>
            </li>

            <!-- 日常办公管理 -->
            <li class="openable bg-palette3">
                <a href="#">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-gift fa-lg"></i></span>
										<span class="text m-left-sm">日常办公管理</span>
										<span class="submenu-icon"></span>
									</span>
									<span class="menu-content-hover block">
										办公
									</span>
                </a>
                <ul class="submenu">
                    <li><a href="signin.html"><span class="submenu-label">Sign in</span></a></li>

                </ul>
            </li>

            <!-- 关于 -->
            <li class="bg-palette2">
                <a href="timeline.html">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-clock-o fa-lg"></i></span>
										<span class="text m-left-sm">关于</span>
									</span>
									<span class="menu-content-hover block">
										关于
									</span>
                </a>
            </li>

        </ul>
    </div>
    <%--</div>--%>
</div>


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
