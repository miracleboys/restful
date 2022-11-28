<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% String path=request.getContextPath(); String basePath=request.getScheme() + "://" + request.getServerName() + ":"
        + request.getServerPort() + path; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/Hanging.css">
    <title>Document</title>

</head>
<body>
    <div class="top"  >
        <div class="usergroup"><a >当前用户:<input type="text" value="权限组" style="display: ;" ></a></div>
        <div class="logo"><img src="../images/ui/themeBanner.png"></div>
    </div>
</body>
</html>