<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: YedeBas
  Date: 2019/9/27
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script>
        //删除cookie
        $(function(){
            var delCookie = function (name) {
            var exp = new Date();
            exp.setTime(exp.getTime() - 1);
            //获取cookie是否存在
            var value = getCookie(name);
            if (value != null) {
                document.cookie = name + "=" + value + ";expires="+ exp.toUTCString();
            }
        }
            var getCookie = function (name) {
                //获取当前所有cookie
                var strCookies = document.cookie;
                //截取变成cookie数组
                var array = strCookies.split(';');
                //循环每个cookie
                for (var i = 0; i < array.length; i++) {
                    //将cookie截取成两部分
                    var item = array[i].split("=");
                    //判断cookie的name 是否相等
                    if (item[0] == name) {
                        return item[1];
                    }
                }
                return null;
            }
            $("#logout").click(function() {
                delCookie("username");
                window.location = "login.jsp";
            });
        });
    </script>
</head>
<body>
<input type="button" id="logout" name="logout" value="退出登录"/>
<center>
    <h2>
        <a href="query.jsp" target="show">已买商品</a>
        <a href="insert.jsp" target="show">添加商品</a>
    </h2>

    <iframe name="show" height="800" width="800" frameborder="0"
            scrolling="no"></iframe>

</center>
</body>
</html>
