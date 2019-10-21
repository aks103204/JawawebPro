<%--
  Created by IntelliJ IDEA.
  User: YedeBas
  Date: 2019/9/29
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/tojson.js"></script>
    <script>
        $(function(){
            $("#add").click(function(){
                var username=$("#username").val();
                var password=$("#password").val();
                var repassword=$("#repassword").val();
                if(((username==""||username.length<0) || (password==""||password.length<0)||
                    (repassword==""||repassword.length<0))){
                    alert("注册新用户的时候，用户名和密码必须输入！");
                    return;
                }
                if(repassword!=password){
                    alert("两次输入的密码不一致!");
                    return;
                }
                var REGISTER_URL="http://localhost:8080/user/register/"+username+"/"+password;
                $.ajax({
                    contentType: "application/json",
                    url:REGISTER_URL,
                    type:"PUT",
                    statusCode:{
                        200:function(){
                            window.location="login.jsp";
                            alert("注册成功");
                        },
                        404:function(){
                            alert("该用户已经注册了！");
                        }
                    }

                });
            });
        });

    </script>
</head>
<body>
<center>
        用户名：<input type="text" name="username" id="username">
        <br>密&nbsp;&nbsp;&nbsp;码：<input type="text" name="password" id="password">
        重复密码：<input type="text" name="repassword" id="repassword"><br>
        <input type="button" value="注册" id="add">&nbsp;&nbsp;&nbsp;<input
            type="reset" value="重置">
</center>
</body>
</html>
