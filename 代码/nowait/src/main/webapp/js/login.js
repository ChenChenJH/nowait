
	//登录
    function login(){
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        $.ajax({
            type:'post',
            url:'user/login',
            data:{"name":$("#username").val(),"pwd":$("#password").val(),
            	"type":$("#usertype").val(),"isReadme":$('#isReadme').prop("checked")},
			dataType:"text",
            success:function(data){
            	if(data == 'true'){
            		 location.href ="index.jsp";
		    	  }else{
		    		 alert(data);
		    	 }
            }
        });
    }


//验证表单
	 $(function () {
        $('#myform').bootstrapValidator({message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
               validating: 'glyphicon glyphicon-refresh'
             },
            fields: {
                name: {
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                    stringLength: {
                        min: 4,
                         max: 20,
                         message: '用户名长度必须在4到20位之间'
                        },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '用户名只能包含大写、小写、数字和下划线'
                        }
                    }
                },
               pwd: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                }
            }
        });
    });
	 
	//异步提交前进行拦截表单验证
		$("#login").on("click", function(){
		   var bootstrapValidator = $("#myform").data('bootstrapValidator');
		   bootstrapValidator.validate();
		   if(bootstrapValidator.isValid())
		     login();
		   else return;
		
		});
