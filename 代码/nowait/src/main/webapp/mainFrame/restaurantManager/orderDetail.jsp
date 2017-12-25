<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>餐廳訂單詳情頁面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrapValidator.min.js"></script>
	<link href="css/bootstrapValidator.min.css" rel="stylesheet" />
    <!-- 日期控件 -->
     <link href=css/bootstrap-datetimepicker.css" rel="stylesheet">
    <script src="js/bootstrap-datetimepicker.js"></script>
    <script src="js/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<script type="text/javascript">
    $(function () {
        $("#datetimepicker").datetimepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
            todayBtn: true,
            todayHighlight: true,
            showMeridian: true,
            pickerPosition: "bottom-left",
            language: 'zh-CN',//中文，需要引用zh-CN.js包
            startView: 2,//月视图
            minView: 2//日期时间选择器所能够提供的最精确的时间选择视图
        });
    });
    function onedelete(){
        if (!confirm("确认要删除？")) {  window.event.returnValue = false;
        }
    }
    function update(){
        if (!confirm("确认修改？")) {  window.event.returnValue = false;  }
    }
</script>
<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.jsp">首頁</a></li>
    <li class="active">餐廳信息管理</li>
    <li ><a href="restaurant/queryRestaurantList">餐廳列表</a></li>
    <li><a href="order/queryOrderList?id=${order.wxuserId}">餐廳排隊列表</a></li>
    <li class="active">詳情</li>
</ol>
<table class="table">
    <thead>
    <tr>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <form class="form-horizontal" role="form" action="successOfOrderManager.html" target="mainFrame" onsubmit="update()">
        <tr>
            <th  class="col-sm-3 text-center">微信用戶id</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control"  readonly= "true" value="${order.openId}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">餐廳名</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control"  readonly= "true" value="${order.restName}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">桌子類型</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control"  readonly= "true" value="${order.style}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">人數信息</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control" readonly= "true" value="${order.info}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">排隊號碼</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control" readonly= "true" value="${order.waitNo}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">下單日期</th>
            <td  class="col-sm-9 text-center">
                <input type="text" class="form-control" readonly= "true" value="${order.createDate}" id="datetimepicker" data-date-format="yyyy-mm-dd" style="width: 220px;margin-left: 30%">
            </td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">取號公示</th>
            <td  class="col-sm-9 text-center">
                <textarea readonly class="form-control" rows="3" style="resize:none;width: 220px;margin-left: 30%">&#9;${order.warnInfo}</textarea>
            </td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">是否能用</th>
            <td  class="col-sm-9 text-center">
                <label class="radio-inline">
                    <input type="radio" name="check" id="unRead"  value="option1">是
                </label>
                <label class="radio-inline">
                    <input type="radio" name="check" id="read"  value="option2" checked>否
                </label>
            </td>
        </tr>
        <tfoot>
        <tr>
            <th colspan="2" class="text-center">
                <a class="btn btn-info" href="javascript:history.back(-1)"
                   target="mainFrame">返回列表</a>
            </th>
        </tr>
        </tfoot>
    </form>
</table>
</body>
</html>
