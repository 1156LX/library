<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.lixin.library.domain.Book" %>
<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 2018/11/14
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>可借书籍</title>
<style type="text/css">
	*{
		margin:0px;
		padding: 0px;
	}
	body{
		background-size: cover;
		font-family: 华文新魏;
		
	}
	#center{
		background: rgba(255,255,255,0.7);
		width: 1000px;
		height: 800px;
		margin:100px auto;
		padding-top: 20px;
	}
	h1{
		text-align: center;
		font-size: 40px;
	}
	th{
		font-size: 30px;
		margin-left: 30px;
		width: 150px;
	}
	tr{
		text-align: center;
		height: 40px;
		
	}
	td{
		height: 40px;
		line-height: 30px;
		font-size: 20px;
	}
	table{
		margin: 0px auto;
		border-right: 1px solid #C47D7F;
		padding-right: 50px;
		border-left: 1px solid #C47D7F;
		padding-left: 50px;
	}
	button{
		position: absolute;
		left:580px;
		font:1500px;
		background: #E2B2BE;
		width: 80px;
		height: 30px;
		border: 2px solid black;
		border-radius: 5px;

	}
	button:hover{
		color: red;
	}
	</style>
</head>

<body background="<%=basePath%>img/other.jpg">
<div align="center" id="center">
<h1>可借书籍</h1>
<br>
<form action="/user/doBorrow">
<table>
    <tr>
        <th>书名</th>
        <th>作者</th>
        <th>出版社</th>
        <th>可借</th>
    </tr>
    <c:forEach var="Book" items="${enableBooks}">
        <tr>
            <td><c:out value="${Book.bookName}"/></td>
            <td><c:out value="${Book.author}"/></td>
            <td><c:out value="${Book.publish}"/></td>
            <td><input type="radio" name="bookId"  value="${Book.id}"/>借阅</td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="2"><button >确定</button>
        </td>
    </tr>
</table>
</form>
</div>
</body>
</html>
