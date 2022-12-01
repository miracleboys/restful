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
    <title>登录</title>
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
               
                <button onclick="model()">模型选择</button>
                <div id="maleModel">
                    <div><img src="../images/data/model/mheadA.png" alt="" onclick="mheadA()" class="mheadA"></div>
                    <div><img src="../images/data/model/mheadB.png" alt="" onclick="mheadB()" class="mheadB"></div>
                </div>
                <div id="fmaleModel">
                    <div><img src="../images/data/model/wheadA.png" alt="" onclick="wheadA()" class="mheadA"></div>
                    <div><img src="../images/data/model/wheadB.png" alt="" onclick="wheadB()" class="mheadB"></div>
                </div>

            </div>
            <br>
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
                用户名称：<input type="text" placeholder="用户名" id="login_username">
                <br>
                账号密码：<input type="password" placeholder="密码" id="login_password">
            </div>
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
//运行查询
$(document).ready(function () {
    
});

 // 注册成功后事件
function doSignUp (){
    alert("注册成功");
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
    
    // 性别
    user.sex = $("input[name=sex]:checked").val();
    
    // 头像
    
    
    // 数据检验
    console.log(user);
    
    request("POST","<%=basePath%>/user/signUp",user,doSignUp,serverError)


}

// 登录成功后事件
function doSignIn(){
	  alert("登录成功");
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
	
	
	
	request("POST","<%=basePath%>/user/signIn",user,doSignIn,serverError)
}


</script>
</html>