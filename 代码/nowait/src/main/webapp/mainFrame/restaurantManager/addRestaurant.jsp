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
<title>添加餐廳門店頁面</title>
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
<script>
	function add() {
		if (!confirm("確認添加？")) {
			//window.event.returnValue = false;
		}
	}
</script>
<script language=javascript>
    function previewFile() {
        var preview = document.querySelector("img[name=cover]");
        var file  = document.querySelector('input[name=coverPicFile]').files[0];
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
        var preview = document.querySelector('img[name=nav1]');
        var file  = document.querySelectorAll('input[name=navPicFile]')[0].files[0];
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
        var preview = document.querySelector('img[name=nav2]');
        var file  = document.querySelectorAll('input[name=navPicFile]')[1].files[0];
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
        var preview = document.querySelector('img[name=nav3]');
        var file  = document.querySelectorAll('input[name=navPicFile]')[2].files[0];
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
<script>
    $(function () {
        $('form').bootstrapValidator({
            message: 'This value is not valid',
			feedbackIcons: {               
                valid: 'glyphicon glyphicon-ok',              
				invalid: 'glyphicon glyphicon-remove',
				validating: 'glyphicon glyphicon-refresh' },
            live: 'enabled',
            fields: {
                name: {
                    message: '点名验证失败',
                    validators: {
                        notEmpty: {
                            message: '店名不能为空'
                        },
                        stringLength: {
                            min: 2,
                            max: 18,
                            message: '用户名长度必须在2到18位之间'
                        }
                    }
                },
                priceInfo: {
                    validators: {
                        notEmpty: {
                            message: '均价不能为空'
                        }
                    }
                },
                warnInfo: {
                    message: '取号告示验证失败',
                    validators: {
                        notEmpty: {
                            message: '取号告示不能为空'
                        }
                    }
                },
                address: {
                    message: '地址验证失败',
                    validators: {
                        notEmpty: {
                            message: '地址不能为空'
                        }
                    }
                },
                phone: {
                    message: '电话验证失败',
                    validators: {
                        notEmpty: {
                            message: '电话不能为空'
                        },
                        regexp: {
                            regexp:/^1\d{10}$/,
							message:'电话号码必须为11位'
						},
                    }
                },
                shopTime:{
                    message:'营业时间校验失败',
					validators:{
                        notEmpty:{
                            message:'营业时间不能为空'
						}
					}
				},
                status: {
                    message: '餐厅状态验证失败',
                    validators: {
                        notEmpty: {
                            message: '餐厅状态不能为空'
                        }
                    }
                },
                chainName: {
                    message: '连锁店的名称验证失败',
                    validators: {
                        notEmpty: {
                            message: '连锁店名称不能为空'
                        }
                    }
                },
                coverPicFile: {
                    message: '门面图片验证失败',
                    validators: {
                        notEmpty: {
                            message: '门面图片不能为空'
                        }
                    }
                },
                suggestId:{
                    message:'地址上传失败',
					validators:{
                        notEmpty:{
                            message:'请选址地址'
						}
					}
				}
            }
        });
    });
</script>
<style>
.formBox {
	width: 60%;
	margin-left: 50px;
}
fieldset{margin-top:10px}
</style>
<body>
	<ol class="breadcrumb">
		管理員：
		<li><a href="index/mainFrame.jsp">首頁</a></li>
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
				<form id="batchUploadRiskFileForm"  class="form-horizontal" role="form"
					action="restaurant/addRestaurant" method="POST" enctype="multipart/form-data">

					<c:if test="${uid==0}">
						<div class="form-group">
							<label for="openid" class="col-sm-2 control-label">用户姓名</label>
							<div class="col-sm-9">
								<select id="userId" name="userId" class="form-control" style="width: auto;">
									<c:forEach items="${listUser}" var="list">
										<option value="${list.id}">${list.trueName}</option>
									</c:forEach>

								</select>
							</div>
						</div>
					</c:if>
					<div class="form-group">
						<label for="openid" class="col-sm-2 control-label">餐厅名</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="openid" name="name"
								placeholder="请输入餐厅名">
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">价格简介</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chainName" name="priceInfo"
								placeholder="請輸入价格简介">
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">取号告示</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chainName" name="warnInfo"
								placeholder="請輸入取號公示">
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">地址</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chainName" name="address"
								placeholder="請輸入餐廳地址">
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">客服电话</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chainName" name="phone"
								placeholder="請輸入客服电话">
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">营业时间</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chainName"  name="shopTime"
								placeholder="請輸入營業時間">
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">餐厅状况</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chainName" name="status"
								placeholder="请输入餐厅状况">
						</div>
					</div>
					<fieldset id="additional">
						<div class="form-group">
							<label for="chainName" class="col-sm-2 control-label">桌子類型</label>
							<div class="col-sm-2">
								<select class="form-control" name="style">
								  <option>大桌</option>
								  <option>小桌</option>
								  <option>中桌</option>
								</select>
							</div>
							<div class="col-sm-4">
								<input type="number" class="form-control" id="info" name="info"
									placeholder="請輸入桌子的容坐人數">
							</div>
							<div class="col-sm-3">
								<button id="addDesk" type="button" class="btn btn-default col-sm-4 create">新增</button>
								<button id="removeDesk" type="button" class="btn btn-default col-sm-4 remove">移除</button>
							</div>
						</div>
					</fieldset>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">是否过号不取消</label>
						<div class="col-sm-4">
							<select class="form-control" name="isOverdue">
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="chainName" class="col-sm-2 control-label">连锁店名称</label>
						<div class="col-sm-9">
						<select id="chainName" name="chainName" class="form-control" style="width: auto;">
							<option value="null">无</option>
							<c:forEach items="${listChainShop}" var="list">
								<option value="${list.name}">${list.name}</option>
							</c:forEach>

						</select>
					</div>
					</div>
					<div class="form-group">
						<label for="coverPicFile" class="col-sm-2 control-label">餐厅门面图</label>

						<div class="col-sm-9">
							<input type="file" id="coverPicFile" name="coverPicFile" onchange="previewFile()" >
							<img name="cover" src="" height="200" width="200" alt="未选择图片"/>
						</div>
					</div>
					<div class="form-group">
						<label for="navPicture1" class="col-sm-2 control-label">餐厅导航图</label>
						<div class="col-sm-9">
							<input type="file" id="navPicture1" name="navPicFile" onchange="previewFile1()" >
							<img name="nav1" src="" height="200" width="200" alt="至少选择一张图片作为导航图"/>
							<input type="file" id="navPicture2" name="navPicFile" onchange="previewFile2()">
							<img name="nav2" src="" height="200" width="200" alt="未选择图片"/>
							<input type="file" id="navPicture3" name="navPicFile" onchange="previewFile3()">
							<img name="nav3" src="" height="200" width="200" alt="未选择图片"/>
						</div>
					</div>
					
					<div class="form-group" style="text-align:center">
						<p >
							<lable style="color:red;font-size:16px;font-weight:bold;">上传餐厅的位置信息(必填)</lable>
						</p>
						<div id="r-result">请输入地址：<input type="text" id="suggestId" size="20" name="suggestId" value="百度" style="width:500px;"></div>
					<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:500px;height:auto;display:none;"></div>
					</br>
						经度:<input id="longitude" type="text"  name="lng"
							style="width: 100px; margin-right: 10px;" /> 
							纬度:<input id="latitude" type="text" name="lat"
							style="width: 100px; margin-right: 10px;" /> 
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
	function G(id) {
		return document.getElementById(id);
	}

	var map = new BMap.Map("allmap");
	//new BMap.Point(113.360493,22.132428),17
	map.centerAndZoom(new BMap.Point(116.331398,39.897445),12);
	//添加地图类型控件
	map.addControl(new BMap.MapTypeControl({
		mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));
	
	map.enableScrollWheelZoom(true);
	var myStyleJson=[
	                 {
	                     "featureType": "land",
	                     "elementType": "geometry",
	                     "stylers": {
	                               "color": "#e7f7fc"
	                     }
	           },
	           {
	                     "featureType": "water",
	                     "elementType": "all",
	                     "stylers": {
	                               "color": "#96b5d6"
	                     }
	           },
	           {
	                     "featureType": "green",
	                     "elementType": "all",
	                     "stylers": {
	                               "color": "#b0d3dd"
	                     }
	           },
	           {
	                     "featureType": "highway",
	                     "elementType": "geometry.fill",
	                     "stylers": {
	                               "color": "#a6cfcf"
	                     }
	           },
	           {
	                     "featureType": "highway",
	                     "elementType": "geometry.stroke",
	                     "stylers": {
	                               "color": "#7dabb3"
	                     }
	           },
	           {
	                     "featureType": "arterial",
	                     "elementType": "geometry.fill",
	                     "stylers": {
	                               "color": "#e7f7fc"
	                     }
	           },
	           {
	                     "featureType": "arterial",
	                     "elementType": "geometry.stroke",
	                     "stylers": {
	                               "color": "#b0d5d4"
	                     }
	           },
	           {
	                     "featureType": "local",
	                     "elementType": "labels.text.fill",
	                     "stylers": {
	                               "color": "#7a959a"
	                     }
	           },
	           {
	                     "featureType": "local",
	                     "elementType": "labels.text.stroke",
	                     "stylers": {
	                               "color": "#d6e4e5"
	                     }
	           },
	           {
	                     "featureType": "arterial",
	                     "elementType": "labels.text.fill",
	                     "stylers": {
	                               "color": "#374a46"
	                     }
	           },
	           {
	                     "featureType": "highway",
	                     "elementType": "labels.text.fill",
	                     "stylers": {
	                               "color": "#374a46"
	                     }
	           },
	           {
	                     "featureType": "highway",
	                     "elementType": "labels.text.stroke",
	                     "stylers": {
	                               "color": "#e9eeed"
	                     }
	           }
	 ];
	map.setMapStyle({styleJson: myStyleJson });
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
	
	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
			{"input" : "suggestId"
			,"location" : map
		});

	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
		
		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		G("searchResultPanel").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		
		setPlace();
	});
	
	function setPlace(){
		map.clearOverlays();
		function myFun(){
			var pp = local.getResults().getPoi(0).point;
			$("#longitude").val(pp.lng);
			$("#latitude").val(pp.lat);
			map.centerAndZoom(pp,18);
			map.addOverlay(new BMap.Marker(pp));
		}
		var local = new BMap.LocalSearch(map,
				{onSearchComplete : myFun}
				);
		local.search(myValue);
	}
	
	
	$(function () { 
		$("#removeDesk").hide();
        $("#addDesk").click(function(){
        	$("#additional").after($(this).parent().parent().clone(true));
        	$("button:gt(1)").show();
        });
        $("#removeDesk").click(function(){
        	$(this).parent().parent().remove();
        });
        
        
    });
	
	
	
	
</script>
</html>