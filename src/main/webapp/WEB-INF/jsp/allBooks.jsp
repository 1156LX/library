<%@ page import="com.lixin.library.domain.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 2018/11/14
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>所有书籍</title>
	<style type="text/css">
	*{
		margin:0px;
		padding: 0px;
	}
	body{
		background-size: cover;
		font-family: 华文新魏;
		
	}
    #btn{
        position: absolute;
        left:580px;
        top:1800px;
        bottom: 80px;
        background: #E2B2BE;
        width: 80px;
        height: 30px;
        border: 2px solid black;
        border-radius: 5px;

    }
    #btn:hover{
        color: red;
    }
	#center{
		background: rgba(255,255,255,0.4);
		width: 1000px;
		height: 500px;
		margin:100px auto;
		padding-top: 10px;
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
	</style>
</head>
<body background="<%=basePath%>img/back.jpg" >
<div id="center">
     <h1>所有书籍</h1>
     <br>
    <div>
        <table>
         <c:forEach items ="${allBooks}" var="Book" step="2" >
            <tr>
                <td><img src="<%=basePath%>${allBooks[Book.id-1].pic}" style="height: 180px;width: 120px " >
                    <table>
                        <tr>
                            <td>书名：</td>
                            <td><c:out value="${allBooks[Book.id-1].bookName}"/></td>
                        </tr>
                        <tr>
                            <td>作者：</td>
                            <td><c:out value="${allBooks[Book.id-1].author}"/></td>
                        </tr>
                        <tr>
                            <td>出版社：</td>
                            <td><c:out value="${allBooks[Book.id-1].publish}"/></td>
                        </tr>
                    </table>
                </td>
                <td><img src="<%=basePath%>${allBooks[Book.id].pic}" style="height: 180px;width: 120px " >
                    <table>
                        <tr>
                            <td>书名：</td>
                            <td><c:out value="${allBooks[Book.id].bookName}"/></td>
                        </tr>
                        <tr>
                            <td>作者：</td>
                            <td><c:out value="${allBooks[Book.id].author}"/></td>
                        </tr>
                        <tr>
                            <td>出版社：</td>
                            <td><c:out value="${allBooks[Book.id].publish}"/></td>
                        </tr>
                    </table>
                </td>
            </tr>
         </c:forEach>
        </table>
    </div>
    <form action="/userIndex" >
    <tr>
        <td colspan="2"><input id="btn" type="submit" value="返回" />
        </td>
    </tr>
    </form>
</div>
</body>
</html>
