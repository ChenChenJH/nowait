<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>餐廳門店列表頁面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>

</head>

<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.html">首頁</a></li>
    <li class="active">餐廳信息管理</li>
    <li class="active">餐廳列表</li>
</ol>
<form action="restaurant/deleteAll"  method="post" target="mainFrame" >
    <table class="table table-hover">
        <thead>
        <tr>
            <th><input type="checkbox" id="checAll" name="ids" />全選</th>
            <th class="text-center">餐厅名</th>

            <th class="text-center">商家姓名</th>
            <th class="text-center">价格简介</th>
           
            <th class="text-center">客服电话</th>
            <th class="text-center">营业时间</th>
			 <th class="text-center">查看该餐厅排队情况</th>
            <th class="text-center">單行操作</th>
        </tr>
        </thead>
        <c:forEach items="${list }" var="item">
            <tr>
                <td><input type="checkbox" id="checkBox" name="ids" value="${item.id}"/></td>
                <td class="text-center">${item.name}</td>
                <td class="text-center">${item.userTureName}</td>
                <td class="text-center">${item.priceInfo}</td>
                <td class="text-center">${item.phone}</td>
                <td class="text-center">${item.shopTime}</td>
                <td class="text-center"><a href="order/queryOrderList?id=${item.id}">查看<a></td>
                <td class="text-center">
                    <div class="btn-group">
                        <a class="btn btn-default" href="restaurant/queryRestaurantById?id=${item.id }" target="mainFrame" >詳情</a>
                        <a class="btn btn-default" href="restaurant/delete?id=${item.id }" target="mainFrame" onclick="onedelete()">刪除</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        <tfoot>
        <tr>
            <th colspan="8" class="text-center">
                <div class="btn-group col-6 ">
                    <c:choose>
                        <c:when test="${page.pageNum != 1}">
                            <a class="btn btn-default" href="<%=request.getContextPath()%>/restaurant/queryRestaurantList?page=${page.firstPage}" target="mainFrame">首頁</a>
                            <a class="btn btn-default" href="<%=request.getContextPath()%>/restaurant/queryRestaurantList?page=${page.prePage}" target="mainFrame">上一頁</a>
                        </c:when>
                        <c:otherwise>
                            <b class="btn btn-default" style="background-color:#D4D4D4;">首頁</b>
                            <b class="btn btn-default" style="background-color:#D4D4D4;">上一頁</b>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${page.pageNum != page.pages}">
                            <a class="btn btn-default" href="<%=request.getContextPath()%>/restaurant/queryRestaurantList?page=${page.nextPage}" target="mainFrame">下一頁</a>
                            <a class="btn btn-default" href="<%=request.getContextPath()%>/restaurant/queryRestaurantList?page=${page.lastPage}" target="mainFrame">尾頁</a>
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
                            <c:forEach var = "li" begin="1" end="${page.pages}">
                                <option <c:if test='${page.pageNum == li}'>  selected='selected'  </c:if> value="${li}" id="select" name="select">${li}</option>
                            </c:forEach>

                        </select>


                    </div>
                    <span class="input-group-btn">
                        <a id="jump" class="btn btn-default" href="javascript:location.href='${pageContext.request.contextPath}/restaurant/queryRestaurantList?page='+$('#row').val();" target="mainFrame" >跳轉</a>
	                </span>
                </div>
            </th>
        </tr>

        <tr>
            <th colspan="8" class="text-center">
                <input type="submit" class="btn btn-danger" onclick="checkdelete()" value="批量删除">
                <a class="btn btn-info" href="restaurant/addFilter?uId=${uid}" target="mainFrame">添加餐廳</a>
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
        /* 按钮删除操作 */
    });
    function onedelete(){
        if (!confirm("確定要刪除？")) {  window.event.returnValue = false;  }
    }

    function checkdelete(){

        if (confirm("確認刪除所有被選項？")==true) {

//       }
//       else{
            var checkflag = false; //false:未选中复选框  true:选中至少一个
            var checkboxs = document.getElementsByName("ids");
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
           // location.href("restaurant/deleteAll?ids="+ids);
        }
    }
</script>
</html>