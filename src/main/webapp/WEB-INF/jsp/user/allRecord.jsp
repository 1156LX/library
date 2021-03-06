<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.lixin.library.domain.Record" %>
<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 2018/11/15
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <title>还书</title>
	
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
		border: 0px;
		border-radius: 5px;
		border: 2px solid black;
	}
	button:hover{
		color: red;
	}
	</style>
</head>

<body background="<%=basePath%>img/other.jpg">
<div align="center" id="center" >
    <h1>借书记录</h1>
    <br>
    <form action="/userIndex">
        <table>
            <tr>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>借书时间</th>
                <th>还书时间</th>
            </tr>
            <c:forEach var="Record" items="${allRecord}">
                <tr>
                    <td><c:out value="${Record.bookName}"/></td>
                    <td><c:out value="${Record.author}"/></td>
                    <td><c:out value="${Record.publish}"/></td>
                    <td><c:out value="${Record.startDate}"/></td>
                    <td><c:out value="${Record.endDate}"/></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="2"><button >返回</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
