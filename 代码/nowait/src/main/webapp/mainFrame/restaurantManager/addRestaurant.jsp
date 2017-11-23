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
<title>添加餐廳門店頁面</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="css/bootstrap.css" rel="stylesheet">
 <script src="js/jquery.min.js"></script>

</head>
<script>
	function add() {
		if (!confirm("確認添加？")) {
			window.event.returnValue = false;
		}
	}
</script>
<style>
.formBox {
	width: 60%;
	margin-left: 50px;
}
</style>
<body>
	<ol class="breadcrumb">
		管理員：
		<li><a href="../../index/mainFrame.html">首頁</a></li>
		<li class="active">餐廳信息管理</li>
		<li><a href="restaurantList.html">餐廳門店列表</a></li>
		<li class="active">添加餐廳</li>
	</ol>
	<div class="formBox">
		<div class="panel panel-default" style="width:800px;">
			<div class="panel-heading text-center">
				<h2>添加餐廳</h2>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form"
					action="successOfResManager.html" method="POST">
					<div class="form-group">
						<label for="openid" class="col-sm-2 control-label">餐厅名</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="openid"
								placeholder="请输入餐厅名">
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">价格简介</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chainName"
								placeholder="請輸入价格简介">
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">取号告示</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chainName"
								placeholder="請輸入取號公示">
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">地址</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chainName"
								placeholder="請輸入餐廳地址">
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">客服电话</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chainName"
								placeholder="請輸入客服电话">
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">营业时间</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chainName"
								placeholder="請輸入營業時間">
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">餐厅状况</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chainName"
								placeholder="请输入餐厅状况">
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">连锁店名称</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chainName"
								placeholder="请输入连锁店名称">
						</div>
					</div>
					<div class="form-group">
						<label for="coverPicture" class="col-sm-2 control-label">餐厅门面图</label>
						<div class="col-sm-9">
							<input type="file" id="coverPicture">
						</div>
					</div>
					<div class="form-group">
						<label for="navPicture" class="col-sm-2 control-label">餐厅导航图</label>
						<div class="col-sm-9">
							<input type="file" id="navPicture">
						</div>
					</div>
					
					<div class="form-group" style="text-align:center">
						<p >
							<lable style="color:red;font-size:16px;font-weight:bold;">上传餐厅的位置信息(必填)</lable>
						</p>
						经度:<input id="longitude" type="text" 
							style="width: 100px; margin-right: 10px;" /> 
							纬度:<input id="latitude" type="text"
							style="width: 100px; margin-right: 10px;" /> <input
							type="button" value="定位" onclick="theLocation()" /> &nbsp;&nbsp;
							<input type="button" value="自动定位" onclick="autoLocation()" />
					</div>
					
					<div style="width:600px;height:480px;border:1px solid gray;margin:30px auto" id="allmap"></div>  

					<div class="form-group text-center">
						<button type="submit" class="btn btn-success" onclick="add()">添加</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=134db1b9cf1f1f2b4427210932b34dcb"></script>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(113.360493,22.132428),17);
	//添加地图类型控件
	map.addControl(new BMap.MapTypeControl({
		mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));	
	map.enableScrollWheelZoom(true);
	
	// 用经纬度设置地图中心点
	function theLocation(){
		if(document.getElementById("longitude").value != "" && document.getElementById("latitude").value != ""){
			map.clearOverlays(); 
			var new_point = new BMap.Point(document.getElementById("longitude").value,document.getElementById("latitude").value);
			var marker = new BMap.Marker(new_point);  // 创建标注
			map.addOverlay(marker);              // 将标注添加到地图中
			map.panTo(new_point);      
		}
	}
	function autoLocation(){
		var geolocation = new BMap.Geolocation();
		geolocation.getCurrentPosition(function(r){
			if(this.getStatus() == BMAP_STATUS_SUCCESS){
				var mk = new BMap.Marker(r.point);
				alert('您的位置：'+r.point.lng+','+r.point.lat);
				$("#longitude").val(r.point.lng);
				$("#latitude").val(r.point.lat);
				map.addOverlay(mk);
				map.panTo(r.point);  //跳转
				
			}
			else {
				alert('failed'+this.getStatus());
			}        
		},{enableHighAccuracy: true})
	}
</script>
</html>