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
            <button type="button" class="navbar-toggle pull-left sidebar-toggle" id="sidebarToggleSM">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <ul class="nav-notification pull-right">
                <li>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog fa-lg"></i></a>
                    <span class="badge badge-danger bounceIn">1</span>
                    <ul class="dropdown-menu dropdown-sm pull-right">
                        <li class="user-avatar">
                            <img src="/images/profile/profile1.jpg" alt="" class="img-circle">

                            <div class="user-content">
                                <h5 class="no-m-bottom">John Doe</h5>

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
                <i class="fa fa-database"></i><span class="brand-name">河南工业大学OA系统</span>
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
                            <form name="search-form" method="post" action="/taskbook/list">
                                <input type="text" class="form-control input-sm inline-block" name="term">
                            </form>
                            <a href="javascript:document:search_form.submit();" class="input-icon text-normal"><i
                                    class="ion-ios7-search-strong"></i></a>
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
                            Jane Doe
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
                <!--<ul class="nav-notification">
                    <li>
                        <a href="#" data-toggle="dropdown"><i class="fa fa-envelope fa-lg"></i></a>
                        <span class="badge badge-purple bounceIn animation-delay5 active">2</span>
                        <ul class="dropdown-menu message pull-right">
                            <li><a>You have 4 new unread messages</a></li>
                            <li>
                                <a class="clearfix" href="#">
                                    <img src="/images/profile/profile2.jpg" alt="User Avatar">

                                    <div class="detail">
                                        <strong>John Doe</strong>

                                        <p class="no-margin">
                                            Lorem ipsum dolor sit amet...
                                        </p>
                                        <small class="text-muted"><i class="fa fa-check text-success"></i> 27m ago
                                        </small>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a class="clearfix" href="#">
                                    <img src="/images/profile/profile3.jpg" alt="User Avatar">

                                    <div class="detail">
                                        <strong>Jane Doe</strong>

                                        <p class="no-margin">
                                            Lorem ipsum dolor sit amet...
                                        </p>
                                        <small class="text-muted"><i class="fa fa-check text-success"></i> 5hr ago
                                        </small>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a class="clearfix" href="#">
                                    <img src="/images/profile/profile4.jpg" alt="User Avatar">

                                    <div class="detail m-left-sm">
                                        <strong>Bill Doe</strong>

                                        <p class="no-margin">
                                            Lorem ipsum dolor sit amet...
                                        </p>
                                        <small class="text-muted"><i class="fa fa-reply"></i> Yesterday</small>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a class="clearfix" href="#">
                                    <img src="/images/profile/profile5.jpg" alt="User Avatar">

                                    <div class="detail">
                                        <strong>Baby Doe</strong>

                                        <p class="no-margin">
                                            Lorem ipsum dolor sit amet...
                                        </p>
                                        <small class="text-muted"><i class="fa fa-reply"></i> 9 Feb 2013</small>
                                    </div>
                                </a>
                            </li>
                            <li><a href="#">View all messages</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" data-toggle="dropdown"><i class="fa fa-bell fa-lg"></i></a>
                        <span class="badge badge-info bounceIn animation-delay6 active">4</span>
                        <ul class="dropdown-menu notification dropdown-3 pull-right">
                            <li><a href="#">You have 5 new notifications</a></li>
                            <li>
                                <a href="#">
												<span class="notification-icon bg-warning">
													<i class="fa fa-warning"></i>
												</span>
                                    <span class="m-left-xs">Server #2 not responding.</span>
                                    <span class="time text-muted">Just now</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
												<span class="notification-icon bg-success">
													<i class="fa fa-plus"></i>
												</span>
                                    <span class="m-left-xs">New user registration.</span>
                                    <span class="time text-muted">2m ago</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
												<span class="notification-icon bg-danger">
													<i class="fa fa-bolt"></i>
												</span>
                                    <span class="m-left-xs">Application error.</span>
                                    <span class="time text-muted">5m ago</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
												<span class="notification-icon bg-success">
													<i class="fa fa-usd"></i>
												</span>
                                    <span class="m-left-xs">2 items sold.</span>
                                    <span class="time text-muted">1hr ago</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
												<span class="notification-icon bg-success">
													<i class="fa fa-plus"></i>
												</span>
                                    <span class="m-left-xs">New user registration.</span>
                                    <span class="time text-muted">1hr ago</span>
                                </a>
                            </li>
                            <li><a href="#">View all notifications</a></li>
                        </ul>
                    </li>
                    <li class="chat-notification">
                        <a href="#" class="sidebarRight-toggle"><i class="fa fa-comments fa-lg"></i></a>
                        <span class="badge badge-danger bounceIn">1</span>

                        <div class="chat-alert">
                            Hello, Are you there?
                        </div>
                    </li>
                </ul>-->
            </div>
        </div>
    </div>
    <!-- ./top-nav-inner -->
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
