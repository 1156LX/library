<%--
  Created by IntelliJ IDEA.
  User: john
  Date: 2018/11/12
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>用户登录</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>

</head>
<style>
  body{
        font-family: 华文新魏;
        width:100%;
         height:100%;
         background-size: cover;
     }
    h1{text-align: center;}
	#cen{
		width:350px ;
        height: 270px;
        margin: 50px auto;
        background:rgba(223,196,201,0.3);
        top: 100px;
        left: 300px;
        padding-top: 20px;
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
	.wen{
		font-size: 20px;
	}
	#chose input{
		margin-left: 50px;
		margin-top: 20px;
	}
	#loginbtn{
		margin:20px auto;
		width: 100px;
		display: block;
		font-size: 20px;
		font-family: 华文新魏;
		border-left:#939393 solid 1px;
		border-top-width:0px;
		border-right:#939393 solid 1px;
		border-bottom-width: 0px;
		background:rgba(255,255,255,0);

	}
	#loginbtn:hover{
		color: #0072EB;
	}
	#a{
		text-decoration: none; display: block;margin-left:107px;color: #B2798F;
	}
	#a:hover{
		color: #0072EB;
	}
</style>

<body background="<%=basePath%>img/login.jpg">
<h1>欢迎登录图书管理系统</h1>
<div align="center" id="cen">
 
    <form onsubmit="return false" >
        <table>
            <tr>
               
                <td class="wen">用户名：<input class="text" type="text" name="username" id="username" />
                </td>
            </tr>
            <tr>
                
                <td class="wen">密&nbsp&nbsp码：<input class="text" type="password" name="password" id="password"/>
                </td>
            </tr>
            <tr>
                <td colspan="2"><button id="loginbtn">登 陆</button>
                <a id="a" href="reg">注册</a>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
<script>
    $(function () {
        $("#loginbtn").on("click", function () {
            var username = $("#username").val();
            var password = $("#password").val();
            var selectR = $('input:radio:checked');
            if (username == "" || password == "") {
                alert("输入正确信息");
                return;
            }
            $.ajax({
                url: "/dologin",
                type: "post",
                dataType: "json",
                data: {
                    username: username,
                    password: password
                },
                success:function (result)
                {
                    console.log(result);
                    if(result==1)
                        window.location.href = "userIndex";
                    else
                        alert("用户名或密码错误");
                }

            })

        })
    })
</script>
	


</html>
