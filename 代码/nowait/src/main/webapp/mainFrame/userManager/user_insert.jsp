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
    <title>添加商家頁面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<script>
    function add(){
        if (!confirm("確認添加？")) {  window.event.returnValue = false;  }
    }
</script>
<style>
    .formBox {
        width: 60%;
        margin-left: 50px;
    }
</style>
<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.jsp">首頁</a></li>
    <li class="active">商家管理</li>
    <li><a href="mainFrame/userManager/user_list.jsp">商家列表</a></li>
    <li class="active">添加商家</li>
</ol>
<div class="formBox">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>添加商家</h2>
        </div>
        <div class="panel-body">
        <form class="form-horizontal" role="form" action="mainFrame/userManager/success.jsp" target="mainFrame" method="POST">
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">登錄名</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="username" placeholder="請輸入登錄名">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">密碼</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="password" placeholder="請輸入密碼">
                </div>
            </div>
            <div class="form-group">
                <label for="trueName" class="col-sm-2 control-label">真實姓名</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="trueName" placeholder="請輸入真實姓名">
                </div>
            </div>
            <div class="form-group">
                <label for="card" class="col-sm-2 control-label">身份證號</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="card" placeholder="請輸入身份證號">
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">手機號</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="phone" placeholder="請輸入手機號">
                </div>
            </div>

            <div class="form-group text-center">
                <button type="submit" class="btn btn-success" onclick="add()">添加</button>
            </div>
        </form>
        </div>
    </div>
</div>
</body>
</html>