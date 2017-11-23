<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>反饋信息列表页面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <!-- 引入下面文件才有字体图标 -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="js/jquery.js"></script>

</head>

<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.jsp">首頁</a></li>
    <li class="active">反饋信息管理</li>
    <li class="active">反饋信息列表</li>
</ol>
<form action="<%=request.getContextPath()%>/feedback/deleteFeedbackByIds" target="mainFrame" >
    <table class="table table-hover">
        <thead>
        <tr>
            <th><input type="checkbox" id="checkAll" name="checkAll" />全選</th>
            <th>微信用戶ID</th>
            <th class="text-center">反饋內容</th>
            <th class="text-center">反饋時間</th>
            <th class="text-center">狀態</th>
            <th class="text-center">單行操作</th>
        </tr>
        </thead>
        
        <c:forEach items="${feedbacks}" var="feedback">
	        <tr>
	            <td><input type="checkbox" value="${feedback.id}" name="checkBox"/></td>
	            <td>${feedback.wxUser.openid}</td>
	            <td class="text-center">${feedback.info}</td>
	            <td class="text-center">${feedback.createDate}</td>
	            <td class="text-center">${feedback.isRead}</td>
	            <td class="text-center">
	                <div class="btn-group">
	                    <a class="btn btn-default" href="<%=request.getContextPath()%>/feedback/getFeedbackById?id=${feedback.id}" target="mainFrame" >詳情</a>
	                    <a class="btn btn-default" href="<%=request.getContextPath()%>/feedback/deleteFeedbackById?id=${feedback.id}" target="mainFrame" onclick="onedelete()">刪除</a>
	                </div>
	            </td>
	        </tr>
        </c:forEach>

        <tfoot>
        <tr>
            <th colspan="6" class="text-center">
                <a class="btn btn-warning" href="<%=request.getContextPath()%>/feedback/updateFeedbackIsRead" >全部标记为已讀</a>
                <a class="btn btn-info" href="<%=request.getContextPath()%>/feedback/getAllFeedbackByIsRead" >显示所有未讀反馈</a>
                <input type="submit" class="btn btn-danger" value="批量删除" onclick="checkdelete()" >
            </th>
        </tr>
        </tfoot>
    </table>
</form>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    $(function(){
        function initTableCheckbox() {
            var $thr = $('table thead tr');
            /*“全选/反选”复选框*/
            var $checkAll = $thr.find('input');
            $checkAll.click(function(event){
                /*将所有行的选中状态设成全选框的选中状态*/
                $tbr.find('input').prop('checked',$(this).prop('checked'));
                /*并调整所有选中行的CSS样式*/
                if ($(this).prop('checked')) {
                    $tbr.find('input').parent().parent().addClass('warning');
                } else{
                    $tbr.find('input').parent().parent().removeClass('warning');
                }
                /*阻止向上冒泡，以防再次触发点击操作*/
                event.stopPropagation();
            });
            /*点击全选框所在单元格时也触发全选框的点击操作*/
            $('#checkAll').click(function(){
                $(this).find('input').click();
            });
            var $tbr = $('table tbody tr');
            /*点击每一行的选中复选框时*/
            $tbr.find('input').click(function(event){
                /*调整选中行的CSS样式*/
                $(this).parent().parent().toggleClass('warning');
                /*如果已经被选中行的行数等于表格的数据行数，将全选框设为选中状态，否则设为未选中状态*/
                $checkAll.prop('checked',$tbr.find('input:checked').length == $tbr.length ? true : false);
                /*阻止向上冒泡，以防再次触发点击操作*/
                event.stopPropagation();
            });
            /*点击每一行时也触发该行的选中操作*/
            $tbr.click(function(){
                $(this).find('input').click();
            });
            /*点击按钮 不选中复选框*/
            var $a = $('table tr td a');
            $a.click(function(){
                $(this).parent().parent().parent().find('input').click();
            });
        }
        initTableCheckbox();
        /* 按钮删除操作 */
    });
    function onedelete(){
        if (!confirm("確定要刪除？")) {  window.event.returnValue = false;  }
    }

    function checkdelete(){
        if (!confirm("確認刪除所有被選項？")) {
            window.event.returnValue = false;
        }
        else{
            var checkflag = false; //false:未选中复选框  true:选中至少一个
            var checkboxs = document.getElementsByName("checkBox");
            for(var i=0;i<checkboxs.length;i++){
                if(checkboxs[i].checked == true){
                    checkflag = true;
                    break;
                }
            }
            if(!checkflag){
                alert("未選中用戶,請選擇後再執行批量刪除");
                window.event.returnValue = false;
            }
        }
    }
</script>
</html>