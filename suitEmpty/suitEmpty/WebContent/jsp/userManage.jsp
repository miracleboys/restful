<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% String path=request.getContextPath(); String basePath=request.getScheme() + "://" + request.getServerName() + ":"
        + request.getServerPort() + path; %>
<!DOCTYPE html>
<html lang="en"></html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入css文件 -->
    <link rel="stylesheet" href="../css/userManage.css">
    <!-- 引入jquery -->
    <script src="../js/jquery.min.js"></script>
    <!-- 引入js -->
    <script src="../js/signIn.js"></script>
    <script src="../js/main.js"></script>
    <script src="../js/userManage.js"></script>
    <title>用户管理</title>
</head>

<body>
    <!-- 最外层的大盒子 -->
    <div class="box">
        <!-- 注册盒子 -->
        <div class="register-form">
            <!-- 标题盒子 -->
            <div class="title-box">
                <h1>用户信息</h1>
            </div>
            <!-- 输入框盒子 -->
            <div class="input-box">
                <table>
                    <tr  class="tableTop">
                        <td >id</td>
                        <td>用户名称</td>
                        <td>用户实名</td>
                        <td>性别</td>
                        <td>模型选择</td>
                        <td >是否管理员</td>
                        <td colspan="2" style="width:400px;" >操作</td>
                    </tr>
                    <tr class="tableBody" >
                        <td ><input type="text" class="id" style="text-align:center" disabled></td>
                        <td><input type="text" class="username" style="text-align:center" disabled></td>
                        <td><input type="text" class="name" style="text-align:center" disabled></td>
                        <td><input type="text" class="sex" style="text-align:center" disabled></td>
                        <td><input type="text" class="model"></td>
                        <td><input type="text" class="power" style="text-align:center" disabled></td>
                        <td>
                            <button class="change" onclick="form">修改</button>
                        </td>
                        <td>
                            <button class="deleteUser" style="background-color: red;"  >删除</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    
    <div class="form">
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
                <br>
                是否管理员：
                <input type="radio" name="opselect" value="Yes" id="Yes">是
                <input type="radio" name="opselect" value="No" id="No">否
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
                <button class="complete" onclick="">保存信息</button>
            </div>
        </div>
        
    </div>
</div>
</body>
<script>
$(document).ready(function(){
	// 已有服饰类别展示
	request("POST","<%=basePath%>/user/userManage", {}, showlist, serverError,true);

       
});

function showlist(responseData){
	// 返回信息
	showMessage(responseData);
	
	// 异常
	if(responseData.code < 0){
		return;
	}
	
	// 数据库里的数据
	var users = responseData.data;
	console.log(users);
	
	$(users).each(function (index,item){
		console.log("fg");
		var userdata = $(".tableBody").clone(true);
		$(userdata).attr("class","tableClone");
		$(userdata).find(".id").attr("value",item.id);
		$(userdata).find(".username").attr("value",item.username);
		$(userdata).find(".name").attr("value",item.name);
		// 性别
		
		if(item.sex == 1){
			$(userdata).find(".sex").attr("value","男");
		}else{
			$(userdata).find(".sex").attr("value","女");
		}
		
		// 模型
		
		if(item.model == "mheadA"){
			$(userdata).find(".model").css("background-image","url('../images/data/model/mheadA.png')");
			$(userdata).find(".model").css("background-repeat","no-repeat");
			$(userdata).find(".model").css("background-size","contain");
			$(userdata).find(".model").css("background-position","center");
			
		}else if(item.model == "mheadB"){
			$(userdata).find(".model").css("background-image","url('../images/data/model/mheadB.png')");
			$(userdata).find(".model").css("background-repeat","no-repeat");
			$(userdata).find(".model").css("background-size","contain");
			$(userdata).find(".model").css("background-position","center");
		}else if(item.model == "wheadA"){
			$(userdata).find(".model").css("background-image","url('../images/data/model/wheadA.png')");
			$(userdata).find(".model").css("background-repeat","no-repeat");
			$(userdata).find(".model").css("background-size","contain");
			$(userdata).find(".model").css("background-position","center");
		}else if(item.model == "wheadB"){
			$(userdata).find(".model").css("background-image","url('../images/data/model/wheadB.png')");
			$(userdata).find(".model").css("background-repeat","no-repeat");
			$(userdata).find(".model").css("background-size","contain");
			$(userdata).find(".model").css("background-position","center");
		}
		
		
		// 管理员，可以但数据库修改了数据没用   数据库问题吧hhhhhhhhhhhhhhhhhhhhhhhh 不知道为什么又好了
		if(item.power == 1){
			$(userdata).find(".power").attr("value","是");
		}else{
			$(userdata).find(".power").attr("value","");
		}
		// console.log($(userdata).find(".deleteUser"));
		
		// 删除功能，他妈妈的方便多了不用重新找数据  我是SBsbsbsbsbsbsbsb
		$(userdata).find(".deleteUser").click(function(){
			var result = window.confirm("确定要删除吗？");
			if(result == true){
				// 删除
				userdata.remove();
				request("POST","<%=basePath%>/user/deleteUserManage",item,dodelete,serverError,true);
			}
		})
		
		
		$("tbody").append(userdata);
	})
	
	$(".tableBody").css("display","none");
	
}

function dodelete(responseData){
	showMessage(responseData);
}



</script>