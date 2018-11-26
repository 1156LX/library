<%@ page import="com.lixin.library.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: john
  Date: 2018/11/13
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user= (User) request.getSession().getAttribute("user");
    String username=user.getUsername();
    String pic=user.getPic();
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
	<meta charset="UTF-8">
	<title>个人主页</title>
  <style type="text/css">
  *{
    margin:0px;padding:0px;
  }
  h1{
    font-family: "华文新魏";
    height: 56px;
    line-height: 56px;
     color:#2F0C10;
  }
  #cen{
      margin-left: 100px;
      width: 300px;
      font-family: "华文新魏";
      margin:100px;
       color:#2F0C10;
  }
  a{
    text-decoration: none;
    margin-top: 18px;
    display: block;
    font-size: 24px;
    color:#2F0C10;
  }
  a:hover{
    color:#309075;
  }
  h2{
    font-size: 30px;
  }
  </style>
</head>
<body background="<%=basePath%>img/index.jpg">
      <br>
      <br>
      <h1><%=username%>,欢迎来到图书管理系统</h1>
      <br>
      <br>
      <hr>
      <div style="position:absolute;left:1000px;top:10px;" >
          <img src= <%=pic%>; style="border-radius: 50%;border: none;width: 100px;height: 100px">
      </div>
      <div align="center" id="cen">

          <h2>请选择需要的功能:</h2><br>
          <a href="/userUpdate " >修改个人信息</a><br>
          <a href="/userChangePassword">修改密码</a><br>
          <a href="/user/allBooks" >查看所有书籍</a><br>
          <a href="/user/borrowBook">借书</a><br>
          <a href="/user/returnRecord " >还书</a><br>
          <a href="/user/allRecord" >借书记录</a><br>
          <a href="/user/downline ">退出登录</a>
      </div>
</body>
</html>
