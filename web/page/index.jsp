<%--
  Created by IntelliJ IDEA.
  User: Tang
  Date: 2016/3/28
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="login-content" data-ng-app="materialAdmin">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>Henan University of Technology</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico"/>
    <!-- Vendor CSS -->
    <link href="/css/material-design-iconic-font/css/material-design-iconic-font.min.css" rel="stylesheet"
          type="text/css">
    <!-- CSS -->
    <link href="/css/app.min.1.css" rel="stylesheet" type="text/css">

    <script type="application/javascript">
        function login(URL, PARAMS) {
//            if(null == PARAMS.get){
//                alert("用户名或密码不能为空！");
//                return false;
//            }
            var temp = document.createElement("form");
            temp.action = URL;
            temp.method = "post";
            temp.style.display = "none";
            for (var x in PARAMS) {
                var opt = document.createElement("textarea");
                opt.name = x;
                opt.value = PARAMS[x];
                temp.appendChild(opt);
            }
            document.body.appendChild(temp);
            temp.submit();
            return temp;
        }

        function doLoginByAjax() {
            var para = {
                "requestTime": "2016-03-15 15:38:09.009",
                "requestMethod": "",
                "sessionId": "2c88449748214631ac43e6b370bd1034",
                "requestId": "1a30fa8c-362d-4634-86f6-6f1e600e40db",
                "requestContent": {
                    "username": $("#username").val(),
                    "password": $("#password").val()
                },
                "pageInfo": {
                    "pageSize": 20,
                    "currentPage": 1
                }
            };
            $.ajax({
                cache: false,
                type: "POST",
                dataType: "json",		  //json格式，重要
                url: "/user/login",	//把表单数据发送到/user/login
                data: para,	//要发送的是para中的数据
                async: false,
                error: function (data) {
                    alert("用户名或密码错误！");
                },
                success: function (data) {
//                    $("#ajaxDiv").html(data);	//将返回的结果显示到ajaxDiv中
//                    window.location.href = "/higherEducation/main";
                    /*如果返回状态等于0 登录成功 跳转到主页面*/
                    if (0 == data["status"]) {
                        window.location.href = "/index/frame";
                    } else {
                        alert(data["message"]);
                    }
                }

            });
        }

        function doRegisterByAjax() {
            var password = $("#registerPassword").val();
            var confirmPassword = $("#registerConPassword").val();
            if (confirmPassword != password) {
                alert("确认密码错误！")
                return false;
            }
            var para = {
                "sessionId": "2c88449748214631ac43e6b370bd1034",
                "requestContent": {
                    "username": $("#registerUsername").val(),
                    "email": $("#registerEmail").val(),
                    "password": confirmPassword,
                },
                "pageInfo": {
                    "pageSize": 20,
                    "currentPage": 1
                }
            };
            $.ajax({
                cache: false,
                type: "POST",
                dataType: "json",		  //json格式，重要
                url: "/user/register",	//把表单数据发送到/user/login
                data: para,	//要发送的是para中的数据
                async: false,
                error: function (data) {
                    alert("发送请求失败！");
                },
                success: function (data) {
//                    $("#ajaxDiv").html(data);	//将返回的结果显示到ajaxDiv中
//                    alert("请求成功"+data["data"]);
//                    window.location.href = "/higherEducation/main";
                    if (0 == data["status"]) {
                        window.location.href = "/index/frame";
                    } else {
                        alert(data["message"]);
                    }
                }

            });
        }

    </script>
</head>
<body class="login-content" data-ng-controller="loginCtrl as lctrl">

<div class="lc-block" id="l-login" data-ng-class="{'toggled':lctrl.login === 1}">
    <h1 class="lean">HAUT OA</h1>

    <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-account"></i>
    		</span>

        <div class="fg-line">
            <input type="text" class="form-control" placeholder="Username" regex="^\w{3,16}$" id="username"
                   name="username" value="Admin"/>
        </div>
    </div>

    <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-male"></i>
    		</span>

        <div class="fg-line">
            <input type="password" class="form-control" placeholder="Password" regex="^\w+" id="password"
                   name="password" value="123456"/>
        </div>
    </div>

    <div class="clearfix"></div>

    <div class="checkbox">
        <label>
            <input type="checkbox" value=""/>
            <i class="input-helper">
                保持登录状态
            </i>
        </label>
    </div>
    <a href="javascript:doLoginByAjax()" class="btn btn-login btn-danger btn-float">
        <i class="zmdi zmdi-arrow-forward"></i>
    </a>
    <ul class="login-navigation">
        <li class="bgm-red" data-ng-click="lctrl.login = 0; lctrl.register = 1">注册</li>
        <li data-block="#l-forget-password" class="bgm-orange" data-ng-click="lctrl.login = 0; lctrl.forgot = 1">忘记密码?
        </li>
    </ul>
</div>

<div class="lc-block" id="l-register" data-ng-class="{ 'toggled': lctrl.register === 1 }"
     data-ng-if="lctrl.register === 1">
    <h1 class="lean">HAUT OA</h1>

    <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-account"></i>
    		</span>

        <div class="fg-line">
            <input type="text" class="form-control" placeholder="Username" regex="^\w{3,16}$" id="registerUsername"/>
        </div>
    </div>

    <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-email"></i>
    		</span>

        <div class="fg-line">
            <input type="text" class="form-control" placeholder="Email Address"
                   regex="^\w+@\w+\.[a-zA-Z]+(\.[a-zA-Z]+)?$" id="registerEmail"/>
        </div>
    </div>

    <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-male"></i>
    		</span>

        <div class="fg-line">
            <input type="password" class="form-control" placeholder="Password" regex="^\w+" id="registerPassword"/>
        </div>
    </div>

    <div class="input-group m-b-20">
    		<span class="input-group-addon">
    			<i class="zmdi zmdi-male"></i>
    		</span>

        <div class="fg-line">
            <input type="password" class="form-control" placeholder="Confirm Password" regex="^\w+"
                   id="registerConPassword"/>
        </div>
    </div>

    <div class="clearfix"></div>

    <div class="checkbox">
        <label>
            <input type="checkbox" value=""/>
            <i class="input-helper"></i>
            接受许可协议
        </label>
    </div>

    <a href="javascript:doRegisterByAjax()" class="btn btn-login btn-danger btn-float"><i
            class="zmdi zmdi-arrow-forward"></i></a>

    <ul class="login-navigation">
        <li data-block="#l-login" class="bgm-green" data-ng-click="lctrl.register = 0; lctrl.login = 1">登录</li>
        <li data-block="#l-forget-password" class="bgm-orange" data-ng-click="lctrl.register = 0; lctrl.forgot = 1">
            忘记密码?
        </li>
    </ul>
</div>

<div class="lc-block" id="l-forget-password" data-ng-class="{ 'toggled': lctrl.forgot === 1 }"
     data-ng-if="lctrl.forgot === 1">
    <h1 class="lean">HAUT OA</h1>

    <p class="text-left">请输入您注册账户所用的邮箱，我们将发送验证文件到您的邮箱中，请注意查收</p>

    <div class="input-group m-b-20">
        <span class="input-group-addon"><i class="zmdi zmdi-email"></i></span>

        <div class="fg-line">
            <input type="text" class="form-control" placeholder="Email Address"
                   regex="^\w+@\w+\.[a-zA-Z]+(\.[a-zA-Z]+)?$"/>
        </div>
    </div>

    <a href="" class="btn btn-login btn-danger btn-float"><i class="zmdi zmdi-arrow-forward"></i></a>

    <ul class="login-navigation">
        <li data-block="#l-login" class="bgm-green" data-ng-click="lctrl.forgot = 0; lctrl.login = 1">登录</li>
        <li data-block="#l-register" class="bgm-red" data-ng-click="lctrl.forgot = 0; lctrl.register = 1">注册</li>
    </ul>
</div>
</body>

<script src="/js/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/js/log.js"></script>
<!-- Angular -->
<script src="/js/bower_components/angular/angular.min.js"></script>
<script src="/js/bower_components/angular-resource/angular-resource.min.js"></script>
<script src="/js/bower_components/angular-animate/angular-animate.min.js"></script>


<!-- Angular Modules -->
<script src="/js/bower_components/angular-ui-router/release/angular-ui-router.min.js"></script>
<script src="/js/bower_components/angular-loading-bar/src/loading-bar.js"></script>
<script src="/js/bower_components/oclazyload/dist/ocLazyLoad.min.js"></script>
<script src="/js/bower_components/angular-bootstrap/ui-bootstrap-tpls.min.js"></script>

<!-- Common js -->
<script src="/js/bower_components/angular-nouislider/src/nouislider.min.js"></script>
<script src="/js/bower_components/ng-table/dist/ng-table.min.js"></script>

<!-- Placeholder for IE9 -->
<!--[if IE 9 ]>
<script src="/js/bower_components/jquery-placeholder/jquery.placeholder.min.js"></script>
<![endif]-->
<!-- App level -->
<script src="/js/app.js"></script>
<script src="/js/controllers/main.js"></script>
<script src="/js/controllers/ui-bootstrap.js"></script>


<!-- Template Modules -->
<script src="/js/modules/form.js"></script>
<script type="text/javascript">
    $(function () {
        // 定位到用户名输入框
        $("#username").focus();
    });
    // 避免session过期后重新登录后输入框嵌套
    if (window.parent != window) {
        window.parent.location.reload(true)
    }
</script>
</html>
