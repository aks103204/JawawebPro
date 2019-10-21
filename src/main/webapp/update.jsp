<%--
  Created by IntelliJ IDEA.
  User: YedeBas
  Date: 2019/9/28
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script>
        $(function() {
            $("#update").click(function(){
                var id=<%=request.getParameter("id")%>;
                var name=$("#name").val();
                var addr=$("#addr").val();
                var phone=$("#phone").val();
                var username=getCookie("username");
                var UPDATE_URL = "http://localhost:8080/customer/update/"+id+"/"+name+"/"+addr+"/"+phone+"/"+username;
                $.ajax({
                    type:"post",
                    dataType:"text json",
                    url:UPDATE_URL,
                    statusCode:{
                        200:function(data){
                            alert("修改成功");
                            window.location="query.jsp";
                        },
                        404:function(){
                            alert("error");
                            window.location="query.jsp";
                        }
                    }
                });
            });
        });

    </script>
    <script>
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
    </script>
</head>
<body>
<center>
    <form >
        <table>
            <tr>
                <th>编号</th>
                <td><input type="text" name="id" id="id" readonly="readonly"
                           value="<%=request.getParameter("id")%>"></td>
            </tr>
            <tr>
                <th>姓名</th>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <th>地址</th>
                <td><input type="text" name="addr" id="addr"></td>
            </tr>
            <tr>
                <th>电话</th>
                <td><input type="text" name="phone" id="phone"></td>
            </tr>
        </table>
        <input type="button" value="提交" id="update">&nbsp;&nbsp;
        <input type="reset" value="重置">
    </form>
</center>
</body>
</html>
