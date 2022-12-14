// 请求request
function request(method,url,data,successCallBack,errorCallBack,async){
        $.ajax({
            url: url,
            contentType:"application/json",
            async:async,
            data: JSON.stringify(data),
            method: method
        }).done(successCallBack).fail(errorCallBack);
}

// 文件上传
function uploadFileRequest(suit,urlPrefix){
	suit.find("#uploaderContainer input").fileupload({
		    dataType: 'json',
		    done: function (e, data) {
		    	suit.find("#imageUrl").val(data.result.description);
		    	suit.find("#uploaderContainer img").attr("src",urlPrefix+data.result.description);
		    	showMessage({"code":0,"description":data.result.description+"上传成功！"});
		        }
		});
}


// 显示消息
function showMessage(data){	
	alert(data.description);
}

// 服务器错误
function serverError(XMLHttpRequest, textStatus){
    console.log("responseText:",XMLHttpRequest.responseText);
    console.log("status:",XMLHttpRequest.status);
    console.log("textStatus:",textStatus);
    console.log("readyState:",XMLHttpRequest.readyState);
    alert("服务器故障");
}

// 内容居中
function centerObject(object,zIndex){
	object.css({
    	zIndex:zIndex,
		position:'absolute', 
		left: ($(window).width() - object.outerWidth())/2, 
		top: ($(window).height() -object.outerHeight())/3 + $(document).scrollTop() 
	});
}

// 水平居中
function centerObjectX(object,zIndex){
	object.css({
    	zIndex:zIndex,
		position:'absolute', 
		left: ($(window).width() - object.outerWidth())/2
	});
}

// 垂直居中
function centerObjectY(object,zIndex){
	object.css({
    	zIndex:zIndex,
		position:'absolute', 		 
		top: ($(window).height() - object.outerHeight())/3 + $(document).scrollTop() 
	});
}

// 内容隐藏
function hideObject(object){
	object.css({
    	zIndex:0,
		display:"none"
	});
}

// 格式化
Number.prototype.formatMoney = function (places, symbol, thousand, decimal) {
    places = !isNaN(places = Math.abs(places)) ? places : 2;
    symbol = symbol !== undefined ? symbol : "$";
    thousand = thousand || ",";
    decimal = decimal || ".";
    var number = this,
        negative = number < 0 ? "-" : "",
        i = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;
    return symbol + negative + (j ? i.substr(0, j) + thousand : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousand) + (places ? decimal + Math.abs(number - i).toFixed(places).slice(2) : "");
};



