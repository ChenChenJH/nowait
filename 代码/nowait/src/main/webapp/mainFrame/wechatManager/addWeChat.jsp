<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>添加微信用戶页面</title>
<!-- jQuery文件 -->
<script src="js/jquery.min.js"></script>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<!-- 引入下面文件才有字体图标 -->
<link href="css/bootstrap.css" rel="stylesheet">
<!-- bookstrap表单验证 css -->
<link href="css/bootstrapValidator.min.css" rel="stylesheet"
	type="text/css">
<!-- bookstarp验证表单 -->
<script src="js/bootstrapValidator.min.js"></script>

</head>
<script>
	//验证表单
	$(function() {
		$('#myform').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				openid : {
					validators : {
						notEmpty : {
							message : 'openid不能为空'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_]+$/,
							message : 'Openid只能包含大写、小写、数字和下划线'
						}
					}
				},
				phone : {
					validators : {
						notEmpty : {
							message : '手机不能为空'
						},
						regexp : {
							regexp:/^1[34578]\d{9}$/,
							message : '手机号码格式不对'
						}
					}
				}
			}
		});
	});
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
		<li class="active">微信用戶管理</li>
		<li><a href="<%=request.getContextPath()%>/wxuser/getAllWxUser">微信用戶列表</a></li>
		<li class="active">添加微信用戶</li>
	</ol>
	<div class="formBox">
		<div class="panel panel-default">
			<div class="panel-heading text-center">
				<h2>添加用戶</h2>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" id="myform"
					action="<%=request.getContextPath()%>/wxuser/insertWxUser"
					method="POST">
					<div class="form-group">
						<label for="openid" class="col-sm-2 control-label">OpenId</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="openid" name="openid"
								placeholder="请输入微信用戶的OpenID">
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label">手機號碼</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="phone" name="phone"
								placeholder="请输入手機號碼">
						</div>
					</div>

					<div class="form-group text-center">
						<button type="submit" class="btn btn-success" >添加</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>