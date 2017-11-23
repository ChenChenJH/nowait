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

<body>
	<ol class="breadcrumb">
		管理員：
		<li><a href="index/mainFrame.jsp">首頁</a></li>
		<li class="active">商家管理</li>
		<li><a href="mainFrame/userManager/user_list.jsp">商家列表</a></li>
		<li class="active">詳情</li>
	</ol>
	<table class="table">
		<thead>
			<tr>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<form class="form-horizontal" role="form" action="mainFrame/userManager/success.jsp"
			target="mainFrame" onsubmit="update()">
			<tr>
				<th class="col-sm-3 text-center">登錄名</th>
				<td class="col-sm-9 text-center"><input type="text"
					class="form-control" value="chen"
					style="width: 220px; margin-left: 30%"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">密碼</th>
				<td class="col-sm-9 text-center"><input type="text"
					class="form-control" value="123"
					style="width: 220px; margin-left: 30%"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">真實姓名</th>
				<td class="col-sm-9 text-center"><input type="text"
					class="form-control" value="陳"
					style="width: 220px; margin-left: 30%"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">身份證號</th>
				<td class="col-sm-9 text-center"><input type="text"
					class="form-control" value="440883199606012315"
					style="width: 220px; margin-left: 30%"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">手機號碼</th>
				<td class="col-sm-9 text-center"><input type="text"
					class="form-control" value="13420156312"
					style="width: 220px; margin-left: 30%"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">創建時間</th>
				<td class="col-sm-9 text-center"><input type="text"
					class="form-control" value="2017-11-19 20:04:07"
					style="width: 220px; margin-left: 30%" disabled="disabled"></td>
			</tr>
			<tfoot>
				<tr>
					<th colspan="2" class="text-center"><input type="submit"
						class="btn btn-success" value="修改"> <a
						class="btn btn-danger" href="mainFrame/userManager/success.jsp" target="mainFrame"
						onclick="onedelete()">刪除該商家</a> <a class="btn btn-info"
						href="javascript:history.back(-1)" target="mainFrame">返回列表</a></th>
				</tr>
			</tfoot>
		</form>
	</table>
</body>
<script type="text/javascript">
	function onedelete() {
		if (!confirm("确认刪除？")) {
			window.event.returnValue = false;
		}
	}
	function update() {
		if (!confirm("确认要修改？")) {
			window.event.returnValue = false;
		}
	}
</script>
</html>