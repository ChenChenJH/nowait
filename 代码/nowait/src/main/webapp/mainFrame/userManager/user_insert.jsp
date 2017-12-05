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
    <title>添加商家頁面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.min.js"></script>
<link href="css/bootstrapValidator.min.css" rel="stylesheet" />
<script type="text/javascript">
	$(function () {
    $('#myform').bootstrapValidator({message: 'This value is not valid',
       feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	userName: {
                validators: {
                    notEmpty: {
                        message: '登录名不能为空'
                    },
                    callback:{
                    	message: '登录名已存在',
                    	callback: function (value,validator) {
                    		var res = true;
                    		$.ajax({
                    			  url: 'user/isExist',
                    			  type: 'get',
                    			  data: {userName:value},
                    			  async: false,
                    			  success: function (data){
									if (data == 'true') {
										res = false;
									}
                    			  }
                    			});
                    		return res;
                    	}
                   }
                }
            },
        	pwd: {
                 validators: {
                     notEmpty: {
                         message: '密码不能为空'
                     },
                     stringLength: {
                         min: 6,
                         max: 18,
                         message: '密码长度必须在6到18位之间'
                     }
                 }
            },
        	trueName: {
                message: '真实姓名验证失败',
                validators: {
                    notEmpty: {
                        message: '真实姓名不能为空'
                    }
                }
            },
            card: {
                validators: {
                    notEmpty: {
                        message: '身份证不能为空'
                    },
                    regexp: {
                        regexp: /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/,
                        message: '身份证格式错误'
                    }
                }
            },
            phone: {
                validators: {
                    notEmpty: {
                        message: '手机号不能为空'
                    },
                    regexp: {
                        regexp: /^1[34578]\d{9}$/,
                        message: '手机号格式错误'
                    }
                }
            },
            
        }
    });
});
</script>
<style>
    .formBox {
        width: 60%;
        margin-left: 50px;
    }
}
</style>
<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.jsp">首頁</a></li>
    <li class="active">商家管理</li>
    <li><a href="mainFrame/userManager/user_list.jsp">商家列表</a></li>
    <li class="active">添加商家</li>
</ol>
<div class="formBox">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>添加商家</h2>
        </div>
        <div class="panel-body">
        <form class="form-horizontal" id="myform" role="form" action="user/add" method="POST">
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">登錄名</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="username" name="userName" placeholder="請輸入登錄名">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">密碼</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="password" name="pwd" placeholder="請輸入密碼">
                </div>
            </div>
            <div class="form-group">
                <label for="trueName" class="col-sm-2 control-label">真實姓名</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="trueName" name="trueName" placeholder="請輸入真實姓名">
                </div>
            </div>
            <div class="form-group">
                <label for="card" class="col-sm-2 control-label">身份證號</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="card" name="card"  placeholder="請輸入身份證號">
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">手機號</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="請輸入手機號" >
                </div>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-success">添加</button>
            </div>
        </form>
        </div>
    </div>
</div>
</body>
</html>