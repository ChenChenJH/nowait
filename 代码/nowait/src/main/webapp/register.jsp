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
    
<!-- jQuery文件 -->
<script src="js/jquery.min.js"></script>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.min.js"></script>
<link href="css/bootstrapValidator.min.css" rel="stylesheet" />
</head>
<script type="text/javascript">

function check() {
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
                        message: '登錄名不能为空'
                    },
                    stringLength: {
                        min: 4,
                         max: 20,
                         message: '登錄名长度必须在4到20位之间'
                        },
                      regexp: {
                          regexp: /^[a-zA-Z0-9_]+$/,
                          message: '登錄名只能包含大小写字母、数字和下划线'
                      },
                    callback:{
                    	message: '登錄名已存在',
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
                         message: '密碼不能为空'
                     },
                     stringLength: {
                         min: 6,
                         max: 18,
                         message: '密碼长度必须在6到18位之间'
                     },
                    
                 }
            },
            repassword :{
            	validators: {
            		notEmpty: {
                        message: '確認密碼不能为空'
                    },
                    identical: {
                        field: 'pwd',
                        message: '两次输入的密碼不一致'
                    }
                }
            },
        	trueName: {
                message: '真实姓名验证失败',
                validators: {
                    notEmpty: {
                        message: '真实姓名不能为空'
                    },
                    regexp: {
                        regexp: /^[\u4e00-\u9fa5]+$/,
                        message: '真实姓名只能是汉字'
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
            }
        }
    });
};
	//重新开启校验
	 function checkAgain(){
		        $("#myform").data('bootstrapValidator').destroy();
		        $('#myform').data('bootstrapValidator', null);
		        check();
	 }; 
	
	$(function () {
		check();
	});
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
    <form class="form-horizontal" role="form" id="myform" action="user/register" method="POST">
        <div class="form-group">
            <label for="username" class="col-sm-3 control-label">登錄名</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="username" name="userName"
                 placeholder="請輸入登錄名" >
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-3 control-label">密碼</label>
            <div class="col-sm-9">
                <input type="password" class="form-control" id="password" name="pwd"
                 placeholder="請輸入密碼" onblur="checkAgain()">
            </div>
        </div>
        <div class="form-group">
            <label for="repassword" class="col-sm-3 control-label">確認密碼</label>
            <div class="col-sm-9">
                <input type="password" class="form-control" id="repassword" name="repassword" placeholder="請再次輸入密碼">
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">姓名</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="name" name="trueName" placeholder="請輸入真實姓名">
            </div>
        </div>
        <div class="form-group">
            <label for="idCard" class="col-sm-3 control-label">身份證</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="idCard" name="card" placeholder="請輸入身份證號碼">
            </div>
        </div>
        <div class="form-group">
            <label for="phone" class="col-sm-3 control-label">手機號碼</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="phone" name="phone" placeholder="請輸入手機號碼">
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
            <button type="submit" class="btn btn-success col-sm-8">註冊</button>
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