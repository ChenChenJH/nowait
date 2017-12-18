<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>頭部</title>
<script src="js/jquery.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
   <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    .head {
        /*#f0ad4e; 橙色*/
        height: 80px;
        border-bottom: 2px solid #337ab7;
        background-color: #f5f5f5;
    }
    .head .user{
        margin-top:50px;
        margin-right: 10px;
    }
    .head .user a{
        color: #122b40;
    }
    .head .user a:hover{
        color: #122b40;
    }
    .head h1 {
        float:left;
    }
</style>
<body>
<div class="head container-fluid">
    <h1>排隊不用等</h1>
    <ul class="user navbar-right">
        <span class="glyphicon glyphicon-user"></span>${sessionScope.type}：${sessionScope.name}
        <a href="mainFrame/resetPassword.jsp" target="mainFrame" style="margin-left: 10px"><span class="glyphicon glyphicon-cog"></span> 修改密碼</a>
        <a href="user/louginout" target="_top" style="margin-left: 10px" onclick="exit()"><span class="glyphicon glyphicon-log-out"></span> 登出</a>
    </ul>
</div>
</body>
<script>
    function exit() {
        if (!confirm("確認退出？")) {  window.event.returnValue = false;  }
    }
</script>
</html>