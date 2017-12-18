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
<title>商家詳情页面</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="css/bootstrap.css" rel="stylesheet">
</head>
<style type="text/css">
	small{
		color: red;	
	}
</style>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.min.js"></script>
<link href="css/bootstrapValidator.min.css" rel="stylesheet" />
<script type="text/javascript">
$(function () {
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
                         message: '密码不能为空'
                     }
                 }
            },
        	trueName: {
                message: '真实姓名验证失败',
                validators: {
                    notEmpty: {
                        message: '真实姓名不能为空'
                    },
                    regexp: {
                        regexp: /^[\u4e00-\u9fa5]+$/,
                        message: '真实姓名只能是汉字'
                    }
                }
            },
            card: {
                validators: {
                    notEmpty: {
                        message: '身份证不能为空'
                    },
                    regexp: {
                        regexp: /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/,
                        message: '身份证格式错误'
                    }
                }
            },
            phone: {
                validators: {
                    notEmpty: {
                        message: '手机号不能为空'
                    },
                    regexp: {
                        regexp: /^1[34578]\d{9}$/,
                        message: '手机号格式错误'
                    }
                }
            },
            
        }
    });
});
</script>
<body>
	<ol class="breadcrumb">
		管理員：
		<li><a href="index/mainFrame.jsp">首頁</a></li>
		<li class="active">商家管理</li>
		<li><a href="user/list">商家列表</a></li>
		<li class="active">詳情</li>
	</ol>
	<form class="form-horizontal" id="myform" role="form" action="user/update" target="mainFrame"  method="POST">
	<table class="table">
		<thead>
			<tr>
				<th></th>
				<th></th>
			</tr>
		</thead>
			<tbody class="form-group">
			<input type="hidden" value="${user.id}" name="id"/>
			<input type="hidden" name="row" value="${param.row}" />
			 <tr>
				<th class="col-sm-3 text-center">登錄名</th>
				<td class="col-sm-9 text-center"><input type="text" name="userName"
					class="form-control" value="${user.userName}" id="username"
					style="width: 220px; margin-left: 30%" disabled="disabled"></td>
				
			</tr>
			<tr>
				<th class="col-sm-3 text-center">密碼</th>
				<td class="col-sm-9 text-center"><input type="text" name="pwd" id="pwd"
					class="form-control" value="${user.pwd}"
					style="width: 220px; margin-left: 30%"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">真實姓名</th>
				<td class="col-sm-9 text-center"><input type="text" name="trueName" id="trueName"
					class="form-control" value="${user.trueName}"
					style="width: 220px; margin-left: 30%"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">身份證號</th>
				<td class="col-sm-9 text-center"><input type="text" name="card" id="card"
					class="form-control" value="${user.card}"
					style="width: 220px; margin-left: 30%"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">手機號碼</th>
				<td class="col-sm-9 text-center"><input type="text" name="phone" id="phone"
					class="form-control" value="${user.phone}"
					style="width: 220px; margin-left: 30%"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">創建時間</th>
				<td class="col-sm-9 text-center"><input type="text"
					class="form-control" value="${user.createDate}"
					style="width: 220px; margin-left: 30%" disabled="disabled"></td>
			</tr>
			<tbody>
			<tfoot>
				<tr>
					<th colspan="2" class="text-center"><button type="submit" class="btn btn-success" onclick="return confirm('确定要修改吗？')">修改</button>
					 <a class="btn btn-danger" href="user/delete?id=${user.id}&row=${param.row}" target="mainFrame" onclick="return confirm('确定要删除改商家？')">刪除該商家</a> 
					 <a class="btn btn-info" href="javascript:history.back(-1)" target="mainFrame">返回列表</a></th>
				</tr>
			</tfoot>
	</table>
	</form>
</body>

</html>