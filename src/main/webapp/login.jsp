<%--
  Created by IntelliJ IDEA.
  User: YedeBas
  Date: 2019/9/29
  Time: 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script>
        function show() {
        location.href = "register.jsp";
    }
        $(function(){
            //添加cookie
            var addCookie = function (name, value) {
                document.cookie = name + "=" + value;
            }

            $("#login").click(function(){
                var username=$("#username").val();
                var password=$("#password").val();
                alert(username);
                if((username=="" || username.length<0)||(password=="" || password.length<0)){
                    alert("必须输入用户名和密码");
                    return;
                }
                var LOGIN_URL="http://localhost:8080/user/login"
                var d={
                    "username":username,
                    "password":password
                }
                var s=JSON.stringify(d);
                $.ajax({
                    contentType: "application/json",
                    url:LOGIN_URL,
                    data:s,
                    dataType:"text json",
                    type:"post",
                    statusCode:{
                        200:function(data){
                          addCookie("username",username);
                            window.location="main.jsp";
                        },
                        404:function(){
                            alert("登陆失败，请重新登陆！");
                            window.location="login.jsp";
                        }
                    }

                });
            });


        });

    </script>
</head>
<body>
<center>
        用户名:<input type="text" name="username" id="username" value=""><br>
        密&nbsp;&nbsp;&nbsp;码:<input type="text" name="password" id="password" value=""><br>
        <input type="button" value="登录" id="login">&nbsp;&nbsp;&nbsp; <input
            type="button" value="注册" id="register" onclick="show()">
</center>
</body>
</html>
