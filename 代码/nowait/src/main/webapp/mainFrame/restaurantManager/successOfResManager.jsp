<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>門店模塊操作成功頁面</title>
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.jsp">首頁</a></li>
    <li class="active">餐廳信息管理</li>
    <li class="active">操作成功</li>
</ol>
<h2 class="text-center">操作成功</h2>
<div class="text-center"><a href="restaurant/queryRestaurantList" class="btn btn-success">點擊返回門店列表</a></div>
</body>
</html>
