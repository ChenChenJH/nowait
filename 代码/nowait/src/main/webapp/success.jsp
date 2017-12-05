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
    <title>公众号列表页面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <!-- 引入下面文件才有字体图标 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<h2 class="text-center">注册成功</h2>
<div class="text-center"><h1>正在前往登录页面....</h1></div>
<script>
	window.onload = function(){
		setTimeout("location.href='login.jsp'",2000);
	}
</script>
</body>
</html>