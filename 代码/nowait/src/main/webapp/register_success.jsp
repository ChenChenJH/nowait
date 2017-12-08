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
   <style type="text/css">
   	div{
   		text-aligh:center;
   	}
   	h1{
   		color:#a6a6a6;
   	}
   </style>
</head>

<body>
<!-- <h2 class="text-center btn-success">注册成功</h2> -->
<div style="text-align:center;margin:0 auto;"><img alt="注册成功" src="images/register-success.png" />
<h1>正在前往登錄页面....<a id="countdown" style="color:#e64340;">5</a>秒</h1><br/>
<a href="login.jsp" class="btn btn-success">立即登錄</a>

</div>

<script>
	 window.onload = function(){
		print(5);
	}  
	 function print(i){
		if(i>0)
		{
			document.getElementById("countdown").innerHTML=i;
			i--;
			setTimeout("print("+i+")",1000);
			
		}else{
			window.location.href="location.href='login.jsp";
		}
	}  
</script>
</body>
</html>