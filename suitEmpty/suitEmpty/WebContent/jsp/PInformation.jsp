<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% String path=request.getContextPath(); String basePath=request.getScheme() + "://" + request.getServerName() + ":"
        + request.getServerPort() + path; %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入css文件 -->
    <link rel="stylesheet" href="../css/PInformation.css">
    <!-- 引入jquery -->
    <script src="../js/jquery.min.js"></script>
    <!-- 引入js -->
    <script src="../js/signIn.js"></script>
    <script src="../js/main.js"></script>
    <title>登录</title>
</head>

<body>
    <!-- 最外层的大盒子 -->
    <div class="box" >
        <!-- 个人信息盒子 -->
        <div class="register-form">
            <!-- 标题盒子 -->
            <div class="title-box">
                <h1>用户信息</h1>
            </div>
            <!-- 输入框盒子 -->
            <div class="input-box">
                用户名称：<input type="text" placeholder="用户名称" id="username" >
                <br>
                用户实名：<input type="text" placeholder="用户实名" id="name">
                <br>
                账号密码：<input type="password" placeholder="密码若不需要修改则本项留空" id="password">
                <br>
                密码确认：<input type="password" placeholder="密码若不需要修改则本项留空" id="rpassword">
                <div class="sex_select">
                    性别：
                    <input type="radio" value="male" name="sex" id="male" onclick="sexmale()" >男
                    <input type="radio" value="fmale" name="sex" id="fmale" onclick="sexfmale()">女
                </div>
               
                <button onclick="model()">模型选择</button>
                <div id="maleModel">
                    <div><img src="../images/data/model/mheadA.png" alt="" onclick="mheadA()" class="mheadA"></div>
                    <div><img src="../images/data/model/mheadB.png" alt="" onclick="mheadB()" class="mheadB"></div>
                </div>
                <div id="fmaleModel">
                    <div><img src="../images/data/model/wheadA.png" alt="" onclick="wheadA()" class="wheadA"></div>
                    <div><img src="../images/data/model/wheadB.png" alt="" onclick="wheadB()" class="wheadB"></div>
                </div>

            </div>
            <br>
             <div class="tip"></div>
            <!-- 按钮盒子 -->
            <div class="btn-box">
                <button  onclick="saveData()">保存信息</button>
            </div>
        </div>
        
    </div>
</body>
<script >
//运行时执行
$(document).ready(function () {
	// 权限控制
	// 要知道登录用户，所以查询后端
	
	var user = {};
	
	request("POST","<%=basePath%>/user/Pinformation",user,Information,serverError);
	
	
});

var userID = null;
var userpassword = null;
// 用户权限不能改变。。。。。。。。。。。。。。。。。。。。。。。。。。。。。

// 刷新页面
function Information(data){
	 console.log(data.data[0]);
	//console.log($("#username")[0]);
	
	// 用户ID，密码默认值
	userID = data.data[0].id;
	userpassword = data.data[0].password;
	//console.log(userID);
	//console.log(userpassword);
	
	
	// 用户名称
	var username = $("#username")[0];
	username.value = data.data[0].username;
	// 用户实名
	var name = $("#name")[0];
	name.value = data.data[0].name;
	
	//console.log(data.data[0].sex);
	// 性别
	// 1是男，0是女
	if(data.data[0].sex == 1){
		// 单选框
		$("#male").attr("checked","");
		
		$("#maleModel").css("display", "block");
		
		flag2 = false;
		//console.log(flag2);
		
		if(data.data[0].model == "mheadA"){
			 $(".mheadA").css("border-left", "1px solid #fff");
		     $(".mheadA").css("border-top", "1px solid #fff");
		     $(".mheadA").css("border-right", "3px solid #000");
		     $(".mheadA").css("border-bottom", "3px solid #000");
		     flag3 = 1;
		     userModel = "mheadA";
		}else{
			$(".mheadB").css("border-left", "1px solid #fff");
		     $(".mheadB").css("border-top", "1px solid #fff");
		     $(".mheadB").css("border-right", "3px solid #000");
		     $(".mheadB").css("border-bottom", "3px solid #000");
		     flag3 = -1;
		     userModel = "mheadB";
		}
		//console.log(flag3);
		
		
		
	}else{
		
		$("#fmale").attr("checked","");
		
		$("#fmaleModel").css("display", "block");
		
		flag2 = false;
		//console.log(flag2);
		
		if(data.data[0].model == "wheadA"){
			 	$(".wheadA").css("border-left", "1px solid #fff");
			    $(".wheadA").css("border-top", "1px solid #fff");
			    $(".wheadA").css("border-right", "3px solid #000");
			    $(".wheadA").css("border-bottom", "3px solid #000");
			    flag4 = 1;
			    userModel = "wheadA";
		}else{
			  $(".wheadB").css("border-left", "1px solid #fff");
			  $(".wheadB").css("border-top", "1px solid #fff");
			  $(".wheadB").css("border-right", "3px solid #000");
			  $(".wheadB").css("border-bottom", "3px solid #000");
			  flag4 = -1;
			  userModel = "wheadB";
		}
		//console.log(flag4);
	}
	
	
	
}

// 更新事件
function doa(){
	alert("sss");
}

function saveData(){
	
	// 注册用户
    var user = {};
	
	// ID
	user.id =  userID;
	//console.log(user.id);
	
    // 用户名称
    user.username = $("#username").val();
    
    // 用户实名
    user.name = $("#name").val();
    
 	// 性别类型转换
    user.sex = $("input[name=sex]:checked").val();
    if(user.sex == "male"){
    	user.sex = 1
    }else{
    	user.sex = 0
    }
    
    // 用户密码
    console.log(userpassword);
    
    user.password = $("#password").val();
    
    if(user.password == ""){
    	// 密码为空
    	 user.password = userpassword;
    }
    
    // 头像，可以获取signIn.js里的数据
    user.model = userModel;
	
    console.log(user);
    
    // 保存信息
    if(clidata()){
    	// 提示消失
    	request("POST","<%=basePath%>/user/update",user,doa,serverError);
    }
    
}

function clidata(){
	// 注册用户
    var user = {};
    // 用户名称
    user.username = $("#username").val();
    var usernameflag = false;
    // 用户实名
    user.name = $("#name").val();
    var nameflag = false;
    // 密码
    user.password = $("#password").val();
    user.rpassword = $("#rpassword").val();
    var passwordflag = false;
 	// 性别
    user.sex = $("input[name=sex]:checked").val();
    var sexflag = false;
    user.model = userModel;
    var modelflag = false;
    
    
    // console.log(user);
    
    if(user.username == ""){
    	Tip('用户名称不能为空');
    }else{
    	usernameflag = true;
    	if(user.name == ""){
    		Tip('用户实名不能为空');
    	}else{
    		nameflag = true;
    		if(user.password == ""){

    			// 密码为空
    			passwordflag = true;
    			if(user.sex == undefined){
    				Tip('请选择性别');
    			}else{
    				sexflag = true;
    				// 头像
    				if( user.model == null){
    					Tip('请选择头像');
    				}else{
    					modelflag = true;
    				}
    			}
    		}else{
    			if(user.password != user.rpassword){
        			Tip('两次密码不一致');
        		}else{
        			passwordflag = true;
        			if(user.sex == undefined){
        				Tip('请选择性别');
        			}else{
        				sexflag = true;
        				// 头像
        				if( user.model == null){
        					Tip('请选择头像');
        				}else{
        					modelflag = true;
        				}
        			}
        		}
    		}
    		
    	}
    }
    
    return usernameflag & nameflag & passwordflag & sexflag & modelflag;
}

function Tip(msg){
	$(".tip").show().html("<div class='prompt'><i class='tishi_icon'></i>"+msg+"</div>");
}

</script>
</html>