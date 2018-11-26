<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 2018/11/13
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <title>注册成功</title>
	<style type="text/css">
	a{
		text-decoration: none;
	}
	a:hover{
		color: #66D9D0;
	}
	</style>
</head>
<body>
      <h1>注册成功</h1>
      <a href="../login.jsp" >返回登录界面</a>
</body>
</html>
