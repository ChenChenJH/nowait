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
    <title>修改密碼</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <!-- 引入下面文件才有字体图标 -->
    <link href="css/bootstrap.css" rel="stylesheet">

</head>
<script type="text/javascript">
    function beforeSubmit(){
        return confirm('確認修改?');
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
    <li class="active">修改密碼</li>
</ol>
<div class="formBox">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>修改密碼</h2>
        </div>
        <div class="panel-body">
            <form class="form-horizontal" role="form" action="login.jsp"  target="_top" method="POST" onsubmit="return beforeSubmit()">
                <div class="form-group">
                    <label for="oldPwd" class="col-sm-2 control-label">原密碼</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="oldPwd" placeholder="请输入原密碼">
                    </div>
                </div>
                <div class="form-group">
                    <label for="newPwd" class="col-sm-2 control-label">新密碼</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="newPwd" placeholder="请输入新密碼">
                    </div>
                </div>
                <div class="form-group">
                    <label for="rePwd" class="col-sm-2 control-label">重複新密碼</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="rePwd" placeholder="请再次輸入新密碼">
                    </div>
                </div>
                <div class="form-group text-center">
                    <button type="submit" class="btn btn-success">修改</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>