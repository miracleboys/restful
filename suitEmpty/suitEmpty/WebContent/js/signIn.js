// 滑动的状态
let flag = true;
const mySwitch = () => {
  if (flag) {
    // 获取到滑动盒子的dom元素并修改它移动的位置
    $(".pre-box").css("transform", "translateX(100%)");
    // 获取到滑动盒子的dom元素并修改它的背景颜色
    $(".pre-box").css("background-color", "#c9e0ed");
    //修改图片的路径
    $(".qaq").attr("src", "../images/wuwu.jpeg");
  } else {
    $(".pre-box").css("transform", "translateX(0%)");
    $(".pre-box").css("background-color", "#edd4dc");
    $(".qaq").attr("src", "../images/waoku.jpg");
  }
  flag = !flag;
};


const bubleCreate = () => {
// 获取body元素
const body = document.body;
// 创建泡泡元素
const buble = document.createElement("span");
// 设置泡泡半径
let r = Math.random() * 5 + 25; //半径大小为25~30
// 设置泡泡的宽高
buble.style.width = r + "px";
buble.style.height = r + "px";
// 设置泡泡的随机起点
buble.style.left = Math.random() * innerWidth + "px";
// 为body添加buble元素
body.append(buble);
// 4s清除一次泡泡
setTimeout(() => {
buble.remove();
}, 4000);
};
// 每200ms生成一个泡泡
setInterval(() => {
bubleCreate();
}, 200);



// 模型展示
let flag2 = true;
var item = null;

// 模型选择
function model(){
  // 获取性别
  item = $("input[name=sex]:checked").val();
  // alert(item);
  
  if (flag2) {
    if (item == "male") {
      $("#maleModel").css("display", "block");
    } else if (item == "fmale") {
      $("#fmaleModel").css("display", "block");
    }else if(item == undefined){
      alert("还未选择性别！")
    }
  } else {
    if (item == "male") {
      $("#maleModel").css("display", "none");
    } else if (item == "fmale") {
      $("#fmaleModel").css("display", "none");
    } else if (item == undefined) {
      alert("还未选择性别！");
    }
  }
  flag2 = !flag2;
}

// 性别切换
function sexmale(){
  if(flag2 == false){
      $("#maleModel").css("display", "block");
      $("#fmaleModel").css("display", "none");
      
      $(".wheadA").css("border-left", "");
      $(".wheadA").css("border-top", "");
      $(".wheadA").css("border-right", "");
      $(".wheadA").css("border-bottom", "");
      $(".wheadB").css("border-left", "");
      $(".wheadB").css("border-top", "");
      $(".wheadB").css("border-right", "");
      $(".wheadB").css("border-bottom", "");
      
      
      flag4 = 0;
      userModel = "";
  }
}

function sexfmale() {
  if (flag2 == false) {
    $("#fmaleModel").css("display", "block");
     $("#maleModel").css("display", "none");
     
     $(".mheadA").css("border-left", "");
     $(".mheadA").css("border-top", "");
     $(".mheadA").css("border-right", "");
     $(".mheadA").css("border-bottom", "");
     $(".mheadB").css("border-left", "");
     $(".mheadB").css("border-top", "");
     $(".mheadB").css("border-right", "");
     $(".mheadB").css("border-bottom", "");
     
     flag3 = 0;
     userModel = "";
  }
}
// 选择头像
let userModel = null;
// 男性
var flag3 = 0;

function mheadA() {
  console.log(flag3);
  if (flag3 == 0){
     $(".mheadA").css("border-left", "1px solid #fff");
     $(".mheadA").css("border-top", "1px solid #fff");
     $(".mheadA").css("border-right", "3px solid #000");
     $(".mheadA").css("border-bottom", "3px solid #000");
     flag3 = 1;
     userModel = "mheadA";
  }else if (flag3 == 1) {
    $(".mheadA").css("border-left", "");
    $(".mheadA").css("border-top", "");
    $(".mheadA").css("border-right", "");
    $(".mheadA").css("border-bottom", "");
    flag3 = 0;
  }
 
}

function mheadB() {
  console.log(flag3);
  if(flag3 == 0){
     $(".mheadB").css("border-left", "1px solid #fff");
     $(".mheadB").css("border-top", "1px solid #fff");
     $(".mheadB").css("border-right", "3px solid #000");
     $(".mheadB").css("border-bottom", "3px solid #000");
     flag3 = -1;
     userModel = "mheadB";
  }else if (flag3 == -1){
     $(".mheadB").css("border-left", "");
     $(".mheadB").css("border-top", "");
     $(".mheadB").css("border-right", "");
     $(".mheadB").css("border-bottom", "");
     flag3 = 0;

  }
 
}

// 女性
var flag4 = 0;

function wheadA() {
  console.log(flag4);
  if (flag4 == 0) {
    $(".wheadA").css("border-left", "1px solid #fff");
    $(".wheadA").css("border-top", "1px solid #fff");
    $(".wheadA").css("border-right", "3px solid #000");
    $(".wheadA").css("border-bottom", "3px solid #000");
    flag4 = 1;
    userModel = "wheadA";
  } else if (flag4 == 1) {
    $(".wheadA").css("border-left", "");
    $(".wheadA").css("border-top", "");
    $(".wheadA").css("border-right", "");
    $(".wheadA").css("border-bottom", "");
    flag4 = 0;
  }
}

function wheadB() {
  console.log(flag4);
  if (flag4 == 0) {
    $(".wheadB").css("border-left", "1px solid #fff");
    $(".wheadB").css("border-top", "1px solid #fff");
    $(".wheadB").css("border-right", "3px solid #000");
    $(".wheadB").css("border-bottom", "3px solid #000");
    flag4 = -1;
    userModel = "wheadB";
  } else if (flag4 == -1) {
    $(".wheadB").css("border-left", "");
    $(".wheadB").css("border-top", "");
    $(".wheadB").css("border-right", "");
    $(".wheadB").css("border-bottom", "");
    flag4 = 0;
  }
}
