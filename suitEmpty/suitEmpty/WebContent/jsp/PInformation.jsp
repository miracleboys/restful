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
    <script src="js/jquery.min.js"></script>
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
                用户名称：<input type="text" placeholder="用户名称" id="username">
                <br>
                用户实名：<input type="text" placeholder="用户实名" id="name">
                <br>
                账号密码：<input type="password" placeholder="密码若不需要修改则本项留空" id="password">
                <br>
                密码确认：<input type="password" placeholder="密码若不需要修改则本项留空" id="rpassword">
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
                <button  onclick="">保存修改</button>
            </div>
        </div>
        
    </div>
</body>
<script >
//运行查询
$(document).ready(function () {
    
});
</script>