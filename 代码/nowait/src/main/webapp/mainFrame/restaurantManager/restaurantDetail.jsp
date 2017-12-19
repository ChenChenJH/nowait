<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>餐廳門店詳情頁面</title>
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
     <script src="js/jquery.uploadify.js"></script>
	<link href="js/uploadify.css" rel="stylesheet">
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
        if (!confirm("确认要删除？")) {  window.event.returnValue = false;  }
    }
    function update(){
        if (!confirm("确认修改？")) {  window.event.returnValue = false;  }
    }




</script>
<script language=javascript>
    function previewFile() {
        var preview = document.querySelector("img[name=cover]");
        var file  = document.querySelector('input[name=pictureFile1]').files[0];
        var reader = new FileReader();
        reader.onloadend = function () {
            preview.src = reader.result;
        }
        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
    function previewFile1() {
        var preview = document.querySelectorAll('img[name=nav]')[0];
        var file  = document.querySelectorAll('input[name=pictureFile2]')[0].files[0];
        var reader = new FileReader();
        reader.onloadend = function () {
            preview.src = reader.result;
        }
        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
    function previewFile2() {
        var preview = document.querySelectorAll('img[name=nav]')[1];
        var file  = document.querySelectorAll('input[name=pictureFile2]')[1].files[0];
        var reader = new FileReader();
        reader.onloadend = function () {
            preview.src = reader.result;
        }
        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
    function previewFile3() {
        var preview = document.querySelectorAll('img[name=nav]')[2];
        var file  = document.querySelectorAll('input[name=pictureFile2]')[2].files[0];
        var reader = new FileReader();
        reader.onloadend = function () {
            preview.src = reader.result;
        }
        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }

</script>
<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.jsp">首頁</a></li>
    <li class="active">餐廳信息管理</li>
    <li><a href="restaurantList.html">餐廳門店列表</a></li>
    <li class="active">詳情</li>
</ol>
<table class="table">
    <thead>
    <tr>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <form class="form-horizontal" role="form" action="restaurant/update?id=${restaurant.id}" method="post" target="mainFrame" enctype="multipart/form-data" onsubmit="update()">
        <tr>
            <th  class="col-sm-3 text-center">餐厅名</th>
            <td  class="col-sm-3 text-center"><input type="text" class="form-control" name="name" value="${restaurant.name}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">价格简介</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control" name="priceInfo" value="${restaurant.priceInfo}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">取号告示</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control" name="warnInfo" value="${restaurant.warnInfo}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">地址</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control" name="address" value="${restaurant.address}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">客服电话</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control" name="phone" value="${restaurant.phone}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">营业时间</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control" name="shopTime" value="${restaurant.shopTime}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">餐厅状况</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control" name="status" value="${restaurant.status}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">用户真实名称</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control" name="userTureName" value="${restaurant.userTureName}" style="width: 220px;margin-left: 30%"></td>
        <<input type="text" id="userId" name="userId" style="display: none" value="${restaurant.userId}">
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">连锁店名称</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control" name="chainName" value="${restaurant.chainName}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">餐厅门面图</th>
            <td  class="col-sm-9 text-center">
                    <input style="display: none" name="coverPic" id="coverPic" value="${restaurant.coverPic}">
                    <img src="${restaurant.coverPic}" width="200px" height="200px" name="cover">
                <input type="file" value="${restaurant.coverPic}" name="pictureFile1" onchange="previewFile()">
                </td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">餐厅导航图</th>
        <td  class="col-sm-9 text-center">
            <input name="navPic" id="navPic" style="display: none" value="${restaurant.navPic}">

            <script type="text/javascript">
                var a=$("#navPic").val();
                nav=a.split(",");
                for(i=0;i<3;i++)
                {
                    document.write("<img src="+nav[i]+" width='200px' height='200px' name='nav'>");
                    document.write("<input type='file' value="+nav[i]+" name='pictureFile2'onchange='previewFile"+(i+1)+"()' >");
                }

            </script>

                </td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">经度</th>
            <td  class="col-sm-9 text-center">
                <input name="lng" type="text" class="form-control" value="${restaurant.lng}" style="width: 220px;margin-left: 30%">
            </td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">纬度</th>
            <td  class="col-sm-9 text-center">
                <input name="lat" type="text" class="form-control" value="${restaurant.lat}" style="width: 220px;margin-left: 30%">
            </td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center">创建时间</th>
            <td  class="col-sm-9 text-center"><input type="text" class="form-control" value="${restaurant.createDate}" id="datetimepicker" data-date-format="yyyy-mm-dd" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tfoot>
        <tr>
            <th colspan="2" class="text-center">
                <input type="submit" class="btn btn-success" value="修改">
                <a class="btn btn-danger" href="restaurant/delete?id=${restaurant.id }&pageNumber=${pageNumber}" target="mainFrame" onclick="onedelete()">刪除該餐廳</a>
                <a class="btn btn-info" href="javascript:history.back(-1)"
                   target="mainFrame">返回列表</a>
            </th>
        </tr>
        </tfoot>
    </form>
</table>
</body>
</html>
