<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>餐廳訂單列表頁面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>

<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="../../index/mainFrame.html">首頁</a></li>
    <li class="active">餐廳信息管理</li>
    <li ><a href="restaurantList.html">餐廳列表</a></li>
    <li class="active">餐廳排隊列表</li>
</ol>
<form action="successOfOrderManager.html" target="mainFrame" >
    <table class="table table-hover">
        <thead>
        <tr>
            <th><input type="checkbox" id="checkAll" name="checkAll" />全選</th>
            <th class="text-center">微信用户id</th>
            <th class="text-center">餐廳名</th>
            <th class="text-center">排隊號碼</th>
            <th class="text-center">下單日期</th>
            <th class="text-center">是否能用</th>
            <th class="text-center">單行操作</th>
        </tr>
        </thead>
        <c:forEach items="${orderList }" var="orderList">
            <tr>
                <td><input type="checkbox" name="checkBox"/></td>
                <td class="text-center">${orderList.id}</td>
                <td class="text-center">${orderList.restName}</td>
                <td class="text-center">${orderList.waitNo}</td>
                <td class="text-center">${orderList.createDate}</td>
                <td class="text-center">${orderList.isUsage}</td>
                <td class="text-center">
                    <div class="btn-group">
                        <a class="btn btn-default" href="order/queryOrderById?id=${orderList.id }" target="mainFrame" >詳情</a>
                        <a STYLE="display: none" class="btn btn-default" href="successOfOrderManager.html" target="mainFrame" onclick="onedelete()">刪除</a>
                    </div>
                </td>
            </tr>
        </c:forEach>

        <tfoot>
        <tr>
            <th colspan="7" class="text-center">
                <input STYLE="display: none" type="submit" class="btn btn-danger" value="批量删除" onclick="checkdelete()" >
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
