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
</head>
<body>
    <div class="template">
        <div class="title">服饰类别</div>
        <form action="">
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
                <input type="button" class="btn" value="添加" id="add">
            </div>
        </div>
        </form>
    </div>
</body>
</html>