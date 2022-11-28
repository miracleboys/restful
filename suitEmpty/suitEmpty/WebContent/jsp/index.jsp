<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% String path=request.getContextPath(); String basePath=request.getScheme() + "://" + request.getServerName() + ":"
        + request.getServerPort() + path; %> 
<html>
<head>
<title>梦想试衣间</title>
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
</head>
<frameset rows="50,*" >
			<noframes>
				<body>你的浏览器不支持显示框架</body>
			</noframes>
			<frame src="Hanging.jsp" />
			<frameset cols="160px,*">
				<frame src="Navigation.jsp"  />
				<frame src="PInformation.jsp" name="view"/>
			</frameset>
		</frameset>
</html>
