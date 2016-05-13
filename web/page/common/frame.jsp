<%--
  User: Administrator
  Date: 2016/4/28 0028
  Time: 上午 9:25
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页面</title>
    <link rel="stylesheet" href="/css/ui-dialog.css">

    <script src="/jquery/jquery.min.js"></script>
    <script src="/js/dialog-min.js"></script>


    <script type="application/javascript">
        var session =<%=session.getAttribute("user")%>;
        $(function(){
            var collegeId = session.teacher.collegeId;
            var schoolId = session.teacher.schoolId;
            if(null == collegeId || '' == collegeId || null == schoolId || '' == schoolId){
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
                d.show();
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
