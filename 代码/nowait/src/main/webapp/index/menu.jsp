<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>菜單</title>

<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</head>
<script>
	$(function() {
		$(".adminMenu a").click(
				function() {
					$(this).siblings().children().removeClass("active").end()
							.addClass("active");
					$(this).parent().siblings().children()
							.removeClass("active").end().addClass("active");
					$(this).siblings().removeClass("active").end().addClass(
							"active");
					$(this).parent().siblings().removeClass("active").end()
							.addClass("active");
					/*切换折叠指示图标*/
					$(this).find("span").toggleClass("glyphicon-chevron-down");
					$(this).find("span").toggleClass("glyphicon-chevron-up");
				});
		$(".userMenu a").click(function() {
			$(this).siblings().removeClass("active").end().addClass("active");
		});
	})
</script>
<style>
.adminMenu {
	width: 200px;
	height: 1000px;
	float: left;
	background-color: #e6e6e6;
}

.userMenu {
	width: 200px;
	height: 1000px;
	float: left;
	background-color: #e6e6e6;
}

.sonMenu {
	font-size: 10px;
	text-align: center;
}
</style>
<body>
	<!--管理員菜單-->
	<div class="adminMenu">
		<c:if test="${sessionScope.type =='管理員' }">
			<a href="wxuser/getAllWxUser" target="mainFrame"
				class="list-group-item" style="border-Radius: 0px;"> 微信用戶管理 </a>
		</c:if>
		<c:if test="${sessionScope.type =='管理員' }">
			<a href="user/list" target="mainFrame"
				class="list-group-item">商家管理</a>
		</c:if>
		<a href="mainFrame/restaurantManager/restaurantList.jsp"
			target="mainFrame" class="list-group-item"> 餐廳管理</a>

		<!--<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="list-group-item" >
        餐廳信息管理<span class="glyphicon glyphicon-chevron-down pull-right"></span>
    </a>
    <div id="collapseOne" class="panel-collapse collapse out">
        <a href="../mainFrame/restaurantManager/restaurantList.html" target="mainFrame" class="list-group-item sonMenu" style="border-Radius:0px;">餐廳門店信息</a>
        <a href="../mainFrame/restaurantManager/orderList.html" target="mainFrame" class="list-group-item sonMenu" style="border-Radius:0px;">餐廳排隊訂單</a>
    </div>-->
		<c:if test="${sessionScope.type =='管理員' }">
			<a href="feedback/getAllFeedback"
				target="mainFrame" class="list-group-item"
				style="border-Radius: 0px;">反饋信息管理</a>
		</c:if>
	</div>

</body>
</html>