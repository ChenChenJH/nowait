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
//    $(function () {
////        $("#datetimepicker").datetimepicker({
////            format: "yyyy-mm-dd",
////            autoclose: true,
////            todayBtn: true,
////            todayHighlight: true,
////            showMeridian: true,
////            pickerPosition: "bottom-left",
////            language: 'zh-CN',//中文，需要引用zh-CN.js包
////            startView: 2,//月视图
////            minView: 2//日期时间选择器所能够提供的最精确的时间选择视图
////        });
//
//    });
    function onedelete(){
        if (!confirm("确认要删除？")) {  window.event.returnValue = false;  }
    }




</script>

<script>
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
                    message: '店名验证失败',
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
                chainName: {
                    message: '连锁店的名称验证失败',
                    validators: {
                        notEmpty: {
                            message: '连锁店名称不能为空'
                        }
                    }
                },
                lng:{
                    message:'经度校验失败',
                    validators:{
                        notEmpty:{
                            message:'经度不能为空'
                        }
                    }
                },
                lat:{
                    message:'纬度校验失败',
                    validators:{
                        notEmpty:{
                            message:'纬度不能为空'
                        }
                    }
                }
            }
        });
    });
</script>

<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.jsp">首頁</a></li>
    <li class="active">餐廳信息管理</li>
    <li><a href="restaurant/queryRestaurantList">餐廳門店列表</a></li>
    <li class="active">詳情</li>
</ol>
<form class="form-horizontal" role="form" action="restaurant/update?id=${restaurant.id}" method="POST" target="mainFrame" enctype="multipart/form-data">
<table class="table">
    <thead>
    <tr>
        <th></th>
        <th></th>
    </tr>
    </thead>

        <tr>
            <th  class="col-sm-3 text-center" colspan="2">餐厅名</th>
            <td  class="col-sm-3 text-center" colspan="2"><input type="text" class="form-control" name="name" value="${restaurant.name}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center" colspan="2">价格简介</th>
            <td  class="col-sm-9 text-center" colspan="2"><input type="text" class="form-control" name="priceInfo" value="${restaurant.priceInfo}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center" colspan="2">取号告示</th>
            <td  class="col-sm-9 text-center" colspan="2"><input type="text" class="form-control" name="warnInfo" value="${restaurant.warnInfo}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center" colspan="2">地址</th>
            <td  class="col-sm-9 text-center" colspan="2"><input  type="text" class="form-control" name="address" value="${restaurant.address}" style="width: 220px;margin-left: 30%"></td>

        </tr>
        <tr>
            <th  class="col-sm-3 text-center" colspan="2">客服电话</th>
            <td  class="col-sm-9 text-center" colspan="2"><input type="text" class="form-control" name="phone" value="${restaurant.phone}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center" colspan="2">营业时间</th>
            <td  class="col-sm-9 text-center" colspan="2"><input type="text" class="form-control" name="shopTime" value="${restaurant.shopTime}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center" colspan="2">餐厅状况</th>
            <td  class="col-sm-9 text-center" colspan="2"><select class="form-control" name="status"  style="width: 220px;margin-left: 30%" >
                <
                <option>${restaurant.status}</option>
                <option>前方正在等待</option>
                <option>餐廳暫停取號</option>
                <option>當前排隊狀況</option>
            </select></td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center" colspan="2">用户真实名称</th>
            <td  class="col-sm-9 text-center" colspan="2"><input type="text" class="form-control" name="userTureName" value="${restaurant.userTureName}" style="width: 220px;margin-left: 30%"></td>
        <input type="text" id="userId" name="userId" style="display: none" value="${restaurant.userId}">
        </tr>
        <tr>
            <th  class="col-sm-3 text-center" colspan="2">连锁店名称</th>
            <td  class="col-sm-9 text-center" colspan="2"><input type="text" class="form-control" name="chainName" value="${restaurant.chainName}" style="width: 220px;margin-left: 30%"></td>
        </tr>
        <c:forEach var="desk" items="${desklists}">

            <c:if test='${desk.style=="大桌"}'>
                <input style="display: none" name="desks[0].id" value="${desk.id}">
                <input style="display: none" name="desks[0].restId" value="${desk.restId}">

            <tr >
                <th  class="col-sm-3 text-center" colspan="2">桌子类型</th>
                <td class="col-sm-3 text-center" colspan="1" ><input type="text" class="form-control" id="style0" name="desks[0].style" value="大桌" style="width: 220px;margin-left: 30%"></td>
                <c:choose>
                    <c:when test='${desk.info=="0"}'>
                        <td class="col-sm-3 text-center" colspan="1"><input type="text" class="form-control" id="info0" name="desks[0].info" placeholder="请输入用餐人数" style="width: 220px;margin-left: 30%"></td>
                    </c:when>
                <c:otherwise >
                    <td class="col-sm-3 text-center" colspan="1"><input type="text" class="form-control" id="info0" name="desks[0].info" value="${desk.info}" style="width: 220px;margin-left: 30%"></td>
                </c:otherwise>
                </c:choose>
            </tr>
            </c:if>
            <c:if test='${desk.style=="中桌"}'>
                <input style="display: none" name="desks[1].id" value="${desk.id}">
                <input style="display: none" name="desks[1].restId" value="${desk.restId}">

                <tr >
                    <th  class="col-sm-3 text-center" colspan="2">桌子类型</th>
                    <td class="col-sm-3 text-center" colspan="1" ><input type="text" class="form-control" id="style1" name="desks[1].style" value="中桌" style="width: 220px;margin-left: 30%"></td>
                    <c:choose>
                        <c:when test='${desk.info=="0"}'>
                            <td class="col-sm-3 text-center" colspan="1"><input type="text" class="form-control" id="info1" name="desks[1].info" placeholder="请输入用餐人数" style="width: 220px;margin-left: 30%"></td>
                        </c:when>
                        <c:otherwise >
                            <td class="col-sm-3 text-center" colspan="1"><input type="text" class="form-control" id="info1" name="desks[1].info" value="${desk.info}" style="width: 220px;margin-left: 30%"></td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:if>
            <c:if test='${desk.style=="小桌"}'>

                <input style="display: none" name="desks[2].id" value="${desk.id}">
                <input style="display: none" name="desks[2].restId" value="${desk.restId}">
                <tr >
                    <th  class="col-sm-3 text-center" colspan="2">桌子类型</th>
                    <td class="col-sm-3 text-center" colspan="1" ><input type="text" class="form-control" id="style0" name="desks[2].style" value="小桌" style="width: 220px;margin-left: 30%"></td>
                    <c:choose>
                        <c:when test='${desk.info=="0"}'>
                            <td class="col-sm-3 text-center" colspan="1"><input type="text" class="form-control" id="info0" name="desks[2].info" placeholder="请输入用餐人数" style="width: 220px;margin-left: 30%"></td>
                        </c:when>
                        <c:otherwise >
                            <td class="col-sm-3 text-center" colspan="1"><input type="text" class="form-control" id="info0" name="desks[2].info" value="${desk.info}" style="width: 220px;margin-left: 30%"></td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:if>

        </c:forEach>

        <tr>
            <th  class="col-sm-3 text-center" colspan="2">餐厅门面图</th>
            <td  class="col-sm-9 text-center" colspan="2">
                    <input style="display: none" name="coverPic" id="coverPic" value="${restaurant.coverPic}">
                    <img src="${restaurant.coverPic}" width="200px" height="200px" name="cover">
                <input type="file" value="${restaurant.coverPic}" name="pictureFile1" onchange="previewFile()">
                </td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center" colspan="2">餐厅导航图</th>
        <td  class="col-sm-9 text-center" colspan="2">
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
            <th  class="col-sm-3 text-center" colspan="2">经度</th>
            <td  class="col-sm-9 text-center" colspan="2">
                <input id="longitude" name="lng" type="text" class="form-control" value="${restaurant.lng}" style="width: 220px;margin-left: 30%">
            </td>
        </tr>
        <tr>
            <th  class="col-sm-3 text-center" colspan="2">纬度</th>
            <td  class="col-sm-9 text-center" colspan="2">
                <input id="latitude" name="lat" type="text" class="form-control" value="${restaurant.lat}" style="width: 220px;margin-left: 30%">
            </td>
        </tr>

        <tr><th  class="col-sm-3 text-center" colspan="2">如需更改地址请输入新地址</th>
            <td  class="col-sm-9 text-center" id="r-result"  colspan="2">
                <input class="form-control" type="text" id="suggestId" size="20" name="newadress" style="width:500px;">
            </td>
            <td id="searchResultPanel"  style="border:1px solid #C0C0C0;width:500px;height:auto;display: none"></td></tr>
        <tr>
            <th colspan="4" class="text-center"><div style="width:600px;height:480px;border:1px solid gray;margin:30px auto" id="allmap"></div></th>
        </tr>
        <tfoot>
        <tr>
            <th colspan="4" class="text-center">

           <button type="submit" class="btn btn-success" onclick="return confirm('确定要修改吗？')">修改</button>
                <a class="btn btn-danger" href="restaurant/delete?id=${restaurant.id }&pageNumber=${pageNumber}" target="mainFrame" onclick="onedelete()">刪除該餐廳</a>
                <a class="btn btn-info" href="javascript:history.back(-1)"
                   target="mainFrame">返回列表</a>
            </th>
        </tr>
        </tfoot>
    </form>
</table>
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
