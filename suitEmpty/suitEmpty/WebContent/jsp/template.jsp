<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% String path=request.getContextPath(); String basePath=request.getScheme() + "://" + request.getServerName() + ":"
        + request.getServerPort() + path; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/template.css">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/template.js"></script>
     <script src="../js/main.js"></script>
</head>
<body>
    <div class="template">
        <div class="title">服饰类别</div>
        
            <div class="input-box">
            <ul>
                <li>
                    编号：
                    <input class="inputVal" type="text">
                </li>
                <li>
                    名称：
                    <input class="inputVal" type="text">
                </li>
            </ul>
        
            <div class="btnDiv">
                <button  class="btn" id="add" onclick="addclothes()">添加</button>
            </div>
        </div>
       
    </div>
</body>
<script>
$(document).ready(function(){
	// 已有服饰类别展示
	

       
});

function cliclothes(){
	var codes = document.querySelectorAll(".inputVal");
	var codeflag = false;
	var nameflag = false;
    clothes = {};
    clothes.code = codes[0].value;
    clothes.name = codes[1].value;
    if(clothes.code == ""){
    	alert("编号不能为空")
    }else{
    	codeflag = true;
    	if(clothes.name == ""){
    		alert("名称不能为空")
    	}else{
    		nameflag = true;
    	}
    }
    
    return nameflag & codeflag;
	    
}

function addclothes(){
	// 获取服饰类别编号和名称
    var num = $(this).find(".code").val();
    var nam = $(this).find(".name").val();
    
    // 数据库
    var codes = document.querySelectorAll(".inputVal");

    clothes = {};
    clothes.code = codes[0].value;
    clothes.name = codes[1].value;
    
    //console.log(clothes);
    //console.log(codes);
    // 编号名称为空
    if(cliclothes()){
    	request("POST","<%=basePath%>/user/addClothes",clothes,doadd,serverError);
    	// 要在成功后面复制，获取数据ID隐藏
        let html = $(".template:first-of-type").clone(true);
        $(html).attr('code',num);
        $(html).attr('name',nam);
        html.find("button").remove();
        html.find(".btnDiv").append(`
        <button class="btn delete" onclick="deleteclothes(this)">删除</button>
        <button class="btn keep"  onclick="updateclothes(this)">保存</button>
    `);
        $("body").append(html);
    }
   
    
    
}


// 添加成功
function doadd(){
	alert("ss");
}


// 删除服饰类别
function deleteclothes(obj){
	//console.log(obj);
	var a = "帽子";
	// 确定删除
	var result = window.confirm("你确定要删除"+a+"吗?");
	
	if(result == true){
		// 页面删除
		obj.parentNode.parentNode.parentNode.remove();
		// 数据库删除
		
	}
	
}


// 修改服饰类别
function updateclothes(obj){
	console.log(obj);
	
	// 服饰ID编号名称
	clothes = {};
	clothes.id = "12";
	clothes.code = "ss";
	clothes.name = "ssss";
	
	// 不为空
	
	
}


</script>
</html>