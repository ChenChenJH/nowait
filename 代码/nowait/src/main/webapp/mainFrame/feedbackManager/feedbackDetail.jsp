<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>反饋信息詳情頁面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <!-- 引入下面文件才有字体图标 -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="js/jquery.js"></script>

</head>
<script type="text/javascript">
    function onedelete(){
        if (!confirm("确认要删除？")) {  window.event.returnValue = false;  }
    }
    $(function(){
        if ($("#unRead").attr("checked") == "checked") {
            check = 0;
        } else {
            check = 1;
        }
        if (check == 0) {
            $("#read").click(function(){
                $("#updateCheck").removeAttr("disabled");
            });
            $("#unRead").click(function(){
                $("#updateCheck").attr("disabled","disabled");
            });
        } else {
            $("#unRead").click(function(){
                $("#updateCheck").removeAttr("disabled");
            });
            $("#read").click(function(){
                $("#updateCheck").attr("disabled","disabled");
            });
        }
    })
</script>
<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.jsp">首頁</a></li>
    <li class="active">反饋信息管理</li>
    <li><a href="<%=request.getContextPath()%>/feedback/getAllFeedback?row=1">反饋信息列表</a></li>
    <li class="active">詳情</li>
</ol>
<table class="table">
    <thead>
    <tr>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tr>
        <th  class="col-sm-3 text-center">微信用戶id</th>
        <td  class="col-sm-9 text-center">${feedback.wxUser.openid}</td>
    </tr>
    <tr>
        <th  class="col-sm-3 text-center">反饋時間</th>
        <td  class="col-sm-9 text-center">${feedback.createDate}</td>
    </tr>

    <tr>
        <th  class="col-sm-3 text-center">反饋信息</th>
        <td>
            <div class="form-group">
                <textarea readonly class="form-control" rows="4" style="resize:none;">&#9;${feedback.info}
                </textarea>
            </div>
        </td>
    </tr>
    <tr>
        <th  class="col-sm-3 text-center">狀態</th>
        <td  class="col-sm-9 text-center">
            <form action="<%=request.getContextPath()%>/feedback/updateFeedbackIsReadById" target="mainFrame">
            <c:if test="${feedback.isRead == '未讀'}">
                <label class="radio-inline">
	                <input type="radio" name="check"  id="unRead" value="option1" checked>未讀
	            </label>
	            <label class="radio-inline">
	                <input type="radio" name="check" id="read"  value="option2">已讀
	            </label>
            </c:if>
            <c:if test="${feedback.isRead == '已讀'}">
                <label class="radio-inline">
	                <input type="radio" name="check" id="unRead" value="option1">未讀
	            </label>
	            <label class="radio-inline">
	                <input type="radio" name="check" id="read"  value="option2" checked>已讀
	            </label>
            </c:if>
            <input type="submit" id="updateCheck" value="修改" class="btn btn-default" disabled="disabled">
            <input type="hidden" name="id" value="${feedback.id}">
            </form>
        </td>
    </tr>
    <tfoot>
    <tr>
        <th colspan="2" class="text-center">
            <a class="btn btn-danger" href="<%=request.getContextPath()%>/feedback/deleteFeedbackById?id=${feedback.id}&isRead=${feedback.isRead}" target="mainFrame" onclick="onedelete()">刪除該條反饋</a>
            <a class="btn btn-info" href="<%=request.getContextPath()%>/feedback/getAllFeedback?row=1"
               target="mainFrame">返回列表</a>
        </th>
    </tr>
    </tfoot>
</table>
</body>
</html>