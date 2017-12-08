<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>微信用戶列表頁面</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- jQuery文件 -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>

<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.jsp">首頁</a></li>
    <li class="active">微信用戶管理</li>
    <li class="active">微信用戶列表</li>
</ol>
<form action="<%=request.getContextPath()%>/wxuser/deleteWxUserByIds" target="mainFrame" >
	<!-- 批量删除记住当前页面 -->
	<input type="hidden" name="row" value="${row}" />
    <table class="table table-hover">
        <thead>
        <tr>
            <th><input type="checkbox" id="checkAll" name="checkAll" />全選</th>
            <th class="text-center">openId</th>
            <th class="text-center">手機號碼</th>
            <th class="text-center">單行操作</th>
        </tr>
        </thead>
        <c:forEach items="${wxUsers}" var="wxUser">
	        <tr>
	            <td><input type="checkbox" value="${wxUser.id}" name="checkBox" id="checkboxID"/></td>
	            <td class="text-center">${wxUser.openid}</td>
	            <td class="text-center">${wxUser.phone}</td>
	            <td class="text-center">
	                <div class="btn-group">
	                    <a class="btn btn-default" href="<%=request.getContextPath()%>/wxuser/getWxUserById?id=${wxUser.id}&row=${row}" target="mainFrame" >詳情</a>
	                    <a class="btn btn-default" href="<%=request.getContextPath()%>/wxuser/deleteWxUserById?id=${wxUser.id}&row=${row}" target="mainFrame" onclick="onedelete()">刪除</a>
	                </div>
	            </td>
	        </tr>
        </c:forEach>

        <tfoot>
        <tr>
            <th colspan="4" class="text-center"> 
	            <div class="btn-group col-6">
		            <c:choose>
			            <c:when test="${row != 1}">
			                <a class="btn btn-default" href="<%=request.getContextPath()%>/wxuser/getAllWxUser?row=1" target="mainFrame">首頁</a>
                            <a class="btn btn-default" href="<%=request.getContextPath()%>/wxuser/getAllWxUser?row=${row-1}" target="mainFrame">上一頁</a>
			            </c:when>
			            <c:otherwise>
			                <b class="btn btn-default" style="background-color:#D4D4D4;">首頁</b>
			                <b class="btn btn-default" style="background-color:#D4D4D4;">上一頁</b>
			            </c:otherwise>
			        </c:choose>
			        <c:choose>
                        <c:when test="${row != page}">
                            <a class="btn btn-default" href="<%=request.getContextPath()%>/wxuser/getAllWxUser?row=${row+1}" target="mainFrame">下一頁</a>
                            <a class="btn btn-default" href="<%=request.getContextPath()%>/wxuser/getAllWxUser?row=${page}" target="mainFrame">尾頁</a>
                        </c:when>
                        <c:otherwise>
                            <b class="btn btn-default" style="background-color:#D4D4D4;">下一頁</b>
                            <b class="btn btn-default" style="background-color:#D4D4D4;">尾頁</b>
                        </c:otherwise>
                    </c:choose>
	                
	            </div>
 
                <div class="btn-group col-6">
	               <div class="input-group-btn">
		                <select id="row" class="form-control" style="width: auto;">
		                    <c:forEach var = "li" begin="1" end="${page}">
                                <option <c:if test='${row == li}'>  selected='selected'  </c:if>>${li}</option>
                            </c:forEach>
		                </select>
	                </div>
	                <span class="input-group-btn">
	                <a id="jump" class="btn btn-default" href="#" target="mainFrame">跳轉</a>
	                </span>  
                </div>
            </th>
        </tr>
        <tr>   
            <th colspan="5" class="text-center">
                <input type="submit" class="btn btn-danger" value="批量刪除" onclick="checkdelete()" >
                <a class="btn btn-info" href="mainFrame/wechatManager/addWeChat.jsp?row=${row}" target="mainFrame">添加用戶</a>
            </th>
        </tr>
        </tfoot>
    </table>
</form>
</body>
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
        
        // 按页数跳转
        $('#jump').click(function(){
            var row = $('#row option:selected').val();
            console.log(row);
            $("#jump").attr("href", "<%=request.getContextPath()%>/wxuser/getAllWxUser?row="+row);
        });
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
                alert("未選中数据,請選擇後再執行批量刪除");
                window.event.returnValue = false;
            }
        }
    }
    
</script>
</html>