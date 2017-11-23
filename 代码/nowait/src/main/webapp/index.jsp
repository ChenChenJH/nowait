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
    <title>後臺管理</title>

</head>
<frameset rows="80px,*,17px" border="0">
    <frame src="index/head.jsp">
    <frameset cols="200px,*" border="0">
        <frame src="index/menu.jsp" scrolling="no">
        <frame src="index/mainFrame.jsp" name="mainFrame">
    </frameset>
    <frame src="index/footer.jsp">
</frameset>
<noframes>
    <body>
    <p>
        <font size="+3" color="red">你的瀏覽器不支持框架，請升級你的瀏覽器</font>
    </p>
    </body>
</noframes>
</html>