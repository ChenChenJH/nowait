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
    <meta charset="UTF-8">
    <title>右側窗口</title>
    <!-- 表示根据设备的大小调整页面显示的宽度-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
<ol class="breadcrumb">
    管理員：
    <li class="active">首頁</li>
</ol>
<div class="container">
    <h1>您好，請通過左側菜單完成後臺管理</h1>
</div>
</body>
</html>