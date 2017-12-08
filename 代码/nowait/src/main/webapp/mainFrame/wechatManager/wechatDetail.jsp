<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>微信用戶詳情頁</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <!-- 引入下面文件才有字体图标 -->
    <link href="css/bootstrap.css" rel="stylesheet">

</head>
<script type="text/javascript">
    function onedelete(){
        if (!confirm("确认要删除？")) {  window.event.returnValue = false;  }
    }
</script>
<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.jsp">首頁</a></li>
    <li class="active">微信用戶管理</li>
    <li><a href="<%=request.getContextPath()%>/wxuser/getAllWxUser?row=1">微信用戶列表</a></li>
    <li class="active">用戶詳情</li>
</ol>
<table class="table">
    <thead>
    <tr>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tr>
        <th  class="col-sm-3 text-center">用户openid</th>
        <td  class="col-sm-9 text-center">${wxUser.openid}</td>
    </tr>
    <tr>
        <th  class="col-sm-3 text-center">手机号码</th>
        <td  class="text-center">${wxUser.phone}</td>
    </tr>
    <tfoot>
    <tr>
        <th colspan="2" class="text-center">
            <a class="btn btn-danger" href="<%=request.getContextPath()%>/wxuser/deleteWxUserById?id=${wxUser.id}&row=${param.row}" target="mainFrame" onclick="onedelete()">刪除該用戶</a>
            <a class="btn btn-info" href="javascript:history.back(-1)"
               target="mainFrame">返回列表</a>
        </th>
    </tr>
    </tfoot>
</table>
</body>
</html>