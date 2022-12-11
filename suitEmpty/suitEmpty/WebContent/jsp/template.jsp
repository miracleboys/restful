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
            <input class="inputID id" type="hidden">
            </li>
                <li>
                    编号：
                    <input class="inputVal code" type="text">
                </li>
                <li>
                    名称：
                    <input class="inputVal name" type="text">
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
	request("POST","<%=basePath%>/user/showClothes", {}, shouwlist, serverError,true);

       
});

function shouwlist(responseData){
	// 返回信息
	showMessage(responseData);
	
	// 异常
	if(responseData.code < 0){
		return;
	}
	
	// 数据库里的数据
	var clothes = responseData.data;
	console.log(clothes);
	
	$(clothes).each(function(index,item){
		let clothesDiv = $(".template:first-of-type").clone(true);
		$(clothesDiv).find(".id").attr('value',item.id);
		$(clothesDiv).find(".code").attr('value',item.code);
		$(clothesDiv).find(".name").attr('value',item.name);
		clothesDiv.find("button").remove();
		clothesDiv.find(".btnDiv").append(`
	        <button class="btn delete" onclick="deleteclothes(this)">删除</button>
	        <button class="btn keep"  onclick="updateclothes(this)">保存</button>
	    `);
	        $("body").append(clothesDiv);
	})
	
	
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
    
    // 编号名称为空
    if(cliclothes()){
    	request("POST","<%=basePath%>/user/addClothes",clothes,doadd,serverError,true);
    }
   
    
    
}

//编号名称为空
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


// 添加成功
function doadd(data){
	if(data.code < 0){
		alert(data.description);
	}else{
		alert(data.description);
		var clothesData = data.data;
		
		console.log(clothesData);
		let clothesDiv = $(".template:first-of-type").clone(true);
		$(clothesDiv).find(".id").attr('value',clothesData.id);
		$(clothesDiv).find(".code").attr('value',clothesData.code);
		$(clothesDiv).find(".name").attr('value',clothesData.name);
		clothesDiv.find("button").remove();
		clothesDiv.find(".btnDiv").append(`
	        <button class="btn delete" onclick="deleteclothes(this)">删除</button>
	        <button class="btn keep"  onclick="updateclothes(this)">保存</button>
	    `);
	        $("body").append(clothesDiv);
		
	}
}


// 删除服饰类别
function deleteclothes(obj){
	
	var clothesname = obj.parentNode.parentNode.children[0].children[2].children[0].value;
	
	// 确定删除
	var result = window.confirm("你确定要删除"+ clothesname +"吗?");
	
	if(result == true){
		var clothesid = obj.parentNode.parentNode.children[0].children[0].children[0].value;
		var clothescode = obj.parentNode.parentNode.children[0].children[1].children[0].value;
		var clothesname = obj.parentNode.parentNode.children[0].children[2].children[0].value;
		// 服饰ID编号名称
		clothes = {};
		clothes.id = clothesid;
		clothes.code = clothescode;
		clothes.name = clothesname;
		
		// 页面删除
		obj.parentNode.parentNode.parentNode.remove();
		// 数据库删除
		request("POST","<%=basePath%>/user/deleteClothes",clothes,dodelete,serverError,true);
	}
	
}

function dodelete(responseData){
	showMessage(responseData);
}


// 修改服饰类别
function updateclothes(obj){
	// console.log(obj.parentNode.parentNode.children[0].children[0].children[0]);
	
	var clothesid = obj.parentNode.parentNode.children[0].children[0].children[0].value;
	var clothescode = obj.parentNode.parentNode.children[0].children[1].children[0].value;
	var clothesname = obj.parentNode.parentNode.children[0].children[2].children[0].value;
	// 服饰ID编号名称
	clothes = {};
	clothes.id = clothesid;
	clothes.code = clothescode;
	clothes.name = clothesname;
	
	console.log(clothes);
	// 修改后服饰类别不为空
	if(clothesEmpty(clothescode,clothesname)){
		request("POST","<%=basePath%>/user/updateClothes",clothes,doupdate,serverError,true);
	}
	
	
}

// 修改后服饰类别不为空
function clothesEmpty(clothescode,clothesname){
	var codeflag = false;
	var nameflag = false;
	
	
	if(clothescode == ""){
		alert("编号不能为空");
	}else{
		codeflag = true;
		if(clothesname == ""){
			alert("名称不能为空");	
		}else{
			nameflag = true;
		}
	}
	
	return nameflag & codeflag;
}

// 成功修改
function doupdate(responseData){
	showMessage(responseData);
}


</script>
</html>