<%--
  User: Administrator
  Date: 2016/4/28 0028
  Time: 上午 9:25
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页面</title>
    <script src="/jquery/jquery.min.js"></script>
    <script type="application/javascript">
        $(function(){
            var session =<%=session.getAttribute("user")%>;
            if(null == session){
                alert("登录超时！");
            }
        });

    </script>
</head>

<frameset rows="55px,*" border="0">
    <frame src="/index/top" name="topFrame" scrolling="No" noresize="noresize" id="topFrame"/>
    <frameset cols="250px,*">
        <frame src="/index/left" name="topFrame"  noresize="noresize" id="leftFrame"/>
        <frame src="/page/main/main.jsp" name="mainFrame" noresize="noresize" id="mainFrame"/>
    </frameset>
</frameset>

<body>

</body>
</html>