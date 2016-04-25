<%--
  Created by IntelliJ IDEA.
  User: Tang
  Date: 2016/4/3
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="prefixOfTag" %>
<html>
<head>
    <title>用户注册</title>
</head>

<script type="application/javascript">
    function submit () {

    }
    function returnIndex(){

    }
</script>

<body>
  <form name="register" action="/user/register" method="post">

    <table>
        <tr>
            <td>用户名</td>
            <td><input type="text" name="username" id="username"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="password" id="password"></td>
        </tr>
        <tr>
            <td>确认密码</td>
            <td><input type="password" name="repassword" id="repassword"></td>
        </tr>
        <tr>
            <td><input type="button" value="提交信息" onclick="submit()"></td>
            <td><input type="button" value="回到登录" onclick="returnIndex()"></td>
        </tr>
    </table>

  </form>
</body>
</html>
