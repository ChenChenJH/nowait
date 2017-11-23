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
    <title>註冊頁面</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
     <script src="js/jquery.min.js"></script>

</head>
<script>
    function register(){
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var repassword = document.getElementById("repassword").value;
        var name = document.getElementById("name").value;
        var idCard = document.getElementById("idCard").value;
        var phone = document.getElementById("phone").value;
        if(username == '' || username ==null){
            alert('用戶名不能為空');
            window.event.returnValue = false;
        }else if(password == '' || password ==null){
            alert('密碼不能為空');
            window.event.returnValue = false;
        }else if(repassword != password){
            alert('兩次輸入的密碼不一致，請重新輸入');
            window.event.returnValue = false;
        }else if(name == '' || name ==null){
            alert('姓名不能為空');
            window.event.returnValue = false;
        }else if(idCard == '' || idCard ==null){
            alert('身份證不能為空');
            window.event.returnValue = false;
        }else if(phone == '' || phone ==null){
            alert('手機號碼不能為空');
            window.event.returnValue = false;
        }
    }
</script>
<style>
    .title {
        color: azure;      /*字体颜色*/
        position:absolute;
        font-size: 50px;
        width: 450px;
        left:50%;
        top:100px;
        -webkit-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
    }
    .center-in-center {
        position: absolute;
        top: 520px;
        left: 47%;
        -webkit-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        width: 400px;
        height: 600px;
    }

</style>
<body>
<div><h1 class="title">排隊不用等後台管理</h1><img src="images/head.png" width="100%" height="200"></div>
<div class="center-in-center">
    <form class="form-horizontal" role="form" action="#" method="POST">
        <div class="form-group">
            <label for="username" class="col-sm-3 control-label">用戶名</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="username" placeholder="請輸入用戶名">
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-3 control-label">密碼</label>
            <div class="col-sm-9">
                <input type="password" class="form-control" id="password" placeholder="請輸入密碼">
            </div>
        </div>
        <div class="form-group">
            <label for="repassword" class="col-sm-3 control-label">確認密碼</label>
            <div class="col-sm-9">
                <input type="password" class="form-control" id="repassword" placeholder="請再次輸入密碼">
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">姓名</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="name" placeholder="請輸入真實姓名">
            </div>
        </div>
        <div class="form-group">
            <label for="idCard" class="col-sm-3 control-label">身份證</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="idCard" placeholder="請輸入身份證號碼">
            </div>
        </div>
        <div class="form-group">
            <label for="phone" class="col-sm-3 control-label">手機號碼</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="phone" placeholder="請輸入手機號碼">
            </div>
        </div>
        <div class="form-group">
            <label for="identifyingCode" class="col-sm-3 control-label">驗證碼</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="identifyingCode" placeholder="請輸入手機驗證碼">
            </div>
            <div class="text-center"><a class="btn btn-warning col-sm-3 form-group" >獲取驗證碼</a></div>
        </div>

        <div class="col-sm-3"></div>
        <div class="form-group text-center">
            <button type="submit" class="btn btn-success col-sm-8" onclick="register()">註冊</button>
        </div>
    </form>
</div>
<div class="row footer-bottom">
    <ul class="list-inline text-center navbar-fixed-bottom">
        <li>Copyright ©2017排隊不用等</li>
    </ul>
</div>
</body>
</html>