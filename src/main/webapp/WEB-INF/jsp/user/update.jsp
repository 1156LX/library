<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 2018/11/13
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <title>修改个人信息</title>
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
		height: 500px;
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
	#btn{
		position: absolute;
		left:600px;
		bottom: 100px;
		background: #E2B2BE;
		width: 80px;
		height: 30px;
		border: 2px solid black;
		border-radius: 5px;

	}
	#btn:hover{
		color: red;
	}
	.text{
		background:rgba(255,255,255,0);
		border-left-width:0px;
		border-top-width:0px;
		border-right-width:0px;
		border-bottom:black solid 1px;
		margin-top: 30px;
		height: 30px;
	}
	</style>
</head>

<body background="<%=basePath%>img/other.jpg">
<div align="center" id="center">

    <h1>修改个人信息</h1>
    <form action="/user/update " method="post"enctype="multipart/form-data">
        <table>
            <tr>
                
                <td>用户名：<input class="text" type="text" name="username" />
                </td>
            </tr>
            <tr>
                
                <td>邮箱：<input class="text" type="text" name="email" />
                </td>
            </tr>
            <tr>
                
                <td>手机号码：<input class="text" type="text" name="phone" />
                </td>
            </tr>
            <tr>
                
                <td>头像：<input class="text" type="file" name="file" />
                </td>
            </tr>
            <tr>
                <td colspan="2"><input id="btn" type="submit" value="确定" />
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
