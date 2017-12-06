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
   <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>

<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.jsp">首頁</a></li>
    <li class="active">商家管理</li>
    <li class="active">操作成功</li>
</ol>
<h2 class="text-center">操作成功</h2>
<div class="text-center"><a href="user/list" class="btn btn-success">點擊返回列表</a></div>
</body>
</html>