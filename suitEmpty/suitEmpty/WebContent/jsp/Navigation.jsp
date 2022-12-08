<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% String path=request.getContextPath(); String basePath=request.getScheme() + "://" + request.getServerName() + ":"
        + request.getServerPort() + path; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="../css/Navigation.css">
    <title>Document</title>
   
</head>
<body>
    <div class="leftimg"><a href="PInformation.jsp" target="view"><img src="../images/ui/self.png" style="width: 78px ; height: 78px;"></a></div>
    <div class="leftimg"><a href="" target="view"><img src="../images/ui/userList.png" style="width: 80px ; height: 80px;"></a></div>
    <div class="leftimg"><a href="template.jsp" target="view"><img src="../images/ui/catalog.png" style="width: 80px ; height: 80px;"></a></div>
    <div class="leftimg"><a href="" target="view"><img src="../images/ui/suits.png" style="width: 80px ; height: 80px;"></a></div>
    <div class="leftimg"><a href="" target="view"><img src="../images/ui/mySuits.png" style="width: 80px ; height: 80px;"></a></div>
    <div class="leftimg"><a href="" target="view"><img src="../images/ui/exit.png" style="width: 80px ; height: 80px;"></a></div>
</body>
</html>
