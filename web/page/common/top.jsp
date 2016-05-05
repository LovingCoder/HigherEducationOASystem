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

</head>
<body>

<header class="top-nav">
    <div class="top-nav-inner">
        <div class="nav-header">

            <a href="/higherEducation/main" class="brand">
                <i class="fa fa-database"></i><span class="brand-name">
                HAUT OA System
            </span>
            </a>
        </div>
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

        <div class="nav-container">
            <div class="pull-right m-right-sm">
                <div class="user-block hidden-xs">
                    <a href="#" id="userToggle" data-toggle="dropdown">
                        <img src="/images/profile/profile1.jpg" alt=""
                             class="img-circle inline-block user-profile-pic">

                        <div class="user-detail inline-block">
                            ${sessionScope.user.userName}
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

</header>
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
