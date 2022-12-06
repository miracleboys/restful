<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% String path=request.getContextPath(); String basePath=request.getScheme() + "://" + request.getServerName() + ":"
        + request.getServerPort() + path; %>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入css文件 -->
    <link rel="stylesheet" href="../css/signIn.css">
    <!-- 引入jquery -->
    <script src="../js/jquery.min.js"></script>
    <!-- 引入js -->
    <script src="../js/signIn.js"></script>
    <script src="../js/main.js"></script>
    <title>账号登录与注册</title>
    <link rel="shortcut icon" href="../images/logo.ico">
</head>

<body>
    <!-- 最外层的大盒子 -->
    <div class="box">
        <!-- 滑动盒子 -->
        <div class="pre-box">
            <h1>WELCOME</h1>
            <p>JOIN US!</p>
            <div class="img-box">
                <img src="../images/waoku.jpg" alt="" class="qaq">
            </div>
        </div>
        <!-- 注册盒子 -->
        <div class="register-form">
            <!-- 标题盒子 -->
            <div class="title-box">
                <h1>注册</h1>
            </div>
            <!-- 输入框盒子 -->
            <div class="input-box">
            <form action="signIn.jsp" id="formSignUp">
                用户名称：<input type="text" placeholder="用户名称" id="username">
                <br>
                用户实名：<input type="text" placeholder="用户实名" id="name">
                <br>
                账号密码：<input type="password" placeholder="密码" id="password">
                <br>
                密码确认：<input type="password" placeholder="密码确认" id="rpassword">
                <div class="sex_select">
                    性别：
                    <input type="radio" value="male" name="sex" id="male" onclick="sexmale()">男
                    <input type="radio" value="fmale" name="sex" id="fmale" onclick="sexfmale()">女
                </div>
               <!-- 阻止form提交 -->
                <button onclick="model(); return false;">模型选择</button>
                <div id="maleModel">
                    <div><img src="../images/data/model/mheadA.png" alt="" onclick="mheadA()" class="mheadA"></div>
                    <div><img src="../images/data/model/mheadB.png" alt="" onclick="mheadB()" class="mheadB"></div>
                </div>
                <div id="fmaleModel">
                    <div><img src="../images/data/model/wheadA.png" alt="" onclick="wheadA()" class="mheadA"></div>
                    <div><img src="../images/data/model/wheadB.png" alt="" onclick="wheadB()" class="mheadB"></div>
                </div>
                </form>
            </div>
            <br>
            <div class="tip"></div>
            <!-- 按钮盒子 -->
            <div class="btn-box">
                <button  onclick="signOn()">注册</button>
                <!-- 绑定点击事件 -->
                <p onclick="mySwitch()">已有账号?去登录</p>
            </div>
        </div>
        <!-- 登录盒子 -->
        <div class="login-form">
            <!-- 标题盒子 -->
            <div class="title-box" id="lognin">
                <h1>登录</h1>
            </div>
            <!-- 输入框盒子 -->
            <div class="input-box">
            <form action="index.jsp" id="formSignIn">
                用户名称：<input type="text" placeholder="用户名" id="login_username">
                <br>
                账号密码：<input type="password" placeholder="密码" id="login_password">
                </form>
            </div>
            <div class="tip2"></div>
            <br>
            <!-- 按钮盒子 -->
            <div class="btn-box">
                <button onclick="signIn()">登录</button>
                <!-- 绑定点击事件 -->
                <p onclick="mySwitch()">没有账号?去注册</p>
            </div>
        </div>
    </div>
</body>
<script >
var op = 0;
//运行查询
$(document).ready(function () {
    
});

// 注册检测提示
function Tip(msg){
	$(".tip").show().html("<div class='prompt'><i class='tishi_icon'></i>"+msg+"</div>");
}

//登录检测提示
function Tip2(msg){
	$(".tip2").show().html("<div class='prompt'><i class='tishi_icon'></i>"+msg+"</div>");
}


 // 注册发送到后台后事件
function doSignUp (data){
    
    console.log(data);
    if(data.code == 0){
    	// 注册成功
    	alert(data.description);
    	
    	// 页面刷新，路径会有参数
    	$("#formSignUp").action = "signIn.jsp";
    	$("#formSignUp").submit();
    }else{
    	// 注册失败
    	alert(data.description);
    	
    }
}
 
// 注册检验
function cliLogin(){
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
    			Tip('账号密码不能为空');
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
        			}
        		}
    		}
    		
    	}
    }
    
    return usernameflag & nameflag & passwordflag & sexflag;
    
}

// 账号注册
function signOn(){
    // 注册用户
    var user = {};
    // 用户名称
    user.username = $("#username").val();
    
    // 用户实名
    user.name = $("#name").val();
    
    
    // 密码
    user.password = $("#password").val();
    
    // 性别类型转换
    user.sex = $("input[name=sex]:checked").val();
    if(user.sex == "male"){
    	user.sex = 1
    }else{
    	user.sex = 0
    }
    
    // 头像，可以获取signIn.js里的数据
    user.model = userModel;
    
    
    console.log(user.model);
    
    console.log(user);
    
    if(cliLogin()){
    	request("POST","<%=basePath%>/user/signUp",user,doSignUp,serverError);
    }
    

}

// 登录成功后事件
function doSignIn(data){
	  // alert("发送成功");
	  console.log(data);
	  if(data.code == 0){
		  // 
		  console.log(data.description);
		  alert(data.description);
		  
		  // form提交，页面跳转
		  $("#formSignIn").submit();
		  
	  }else{
		  // 登录失败
		  alert(data.description);
	  }
	  
}

function cliSignIn(){
	// 注册用户
    var user = {};
    // 用户名称
    user.username = $("#login_username").val();
    var usernameflag = false;
    // 密码
    user.password = $("#login_password").val();
    var passwordflag = false;
    
    if(user.username == ""){
    	Tip2("用户名称不能为空")
    }else{
    	usernameflag = true;
    	if(user.password == ""){
    		Tip2("账号密码不能为空")
    	}else{
    		passwordflag = true;
    	}
    }
}


// 账号登录
function signIn(){
	console.log("登录");
	// 登录用户
	var user = {};
	
	// 登录用户名称 
	user.username = $("#login_username").val();
	
	// 登录用户密码
	user.password = $("#login_password").val();
	
	console.log(user);
	// 发送登录请求
	if(cliSignIn()){
		request("POST","<%=basePath%>/user/signIn",user,doSignIn,serverError);
	}
	
}


</script>
</html>