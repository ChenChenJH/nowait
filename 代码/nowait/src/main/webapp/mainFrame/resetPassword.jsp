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
<!-- jQuery文件 -->
<script src="js/jquery.min.js"></script>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.min.js"></script>
<link href="css/bootstrapValidator.min.css" rel="stylesheet" />
</head>
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
				<form id="myform" class="form-horizontal" role="form"
					action="user/updatePwd"  method="POST">
					<div class="form-group">
						<label for="oldPwd" class="col-sm-2 control-label">原密碼</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="pwd" name="pwd"
								placeholder="请输入原密碼">
						</div>
					</div>
					<div class="form-group">
						<label for="newPwd" class="col-sm-2 control-label">新密碼</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="newPwd" name="newPwd"
								placeholder="请输入新密碼" onblur="checkAgain()">
						</div>
					</div>
					<div class="form-group">
						<label for="rePwd" class="col-sm-2 control-label">确认新密碼</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="rePwd" name="rePwd"
								placeholder="请再次輸入新密碼">
						</div>
					</div>
					<div class="form-group text-center">
						<button type="submit" class="btn btn-success" id="btn" onclick="return update()">修改</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function check() {
		 $('#myform').bootstrapValidator({message: 'This value is not valid',
	         feedbackIcons: {
	             valid: 'glyphicon glyphicon-ok',
	             invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	          },
	         fields: {
	        	 pwd: {
	                 validators: {
	                     notEmpty: {
	                         message: '原密碼不能为空'
	                     },
	                     regexp: {
	                         regexp: /^${sessionScope.pwd}$/,
	                         message: '密碼不正确'
	                     }
	                 }
	             },
	             newPwd: {
	            	 validators: {
	                     notEmpty: {
	                         message: '新密碼不能为空'
	                     },
	                 stringLength: {
	                     min: 3,
	                      max: 18,
	                      message: '新密碼长度必须在3到18位之间'
	                    },
	             	}
	         	},
	         	rePwd :{
	             	validators: {
	             		notEmpty: {
	                         message: '確認密碼不能为空'
	                     },
	                     identical: {
	                         field: 'newPwd',
	                         message: '两次输入的新密碼不一致'
	                     }
	                 }
	             },
	         }
		  });
	  }
	//重新开启校验
	 function checkAgain(){
		  $("#myform").data('bootstrapValidator').destroy();
		  $('#myform').data('bootstrapValidator', null);
		  check();
	 }
	
	$(function () {
		check();
	});
	  
	  function update(){
		  return confirm("确定修改吗?");
	  }
	</script>
</body>
</html>