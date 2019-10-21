<%--
  Created by IntelliJ IDEA.
  User: YedeBas
  Date: 2019/9/28
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script >
        $(function(){
            //获取cookie
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
            $("#insert").click(function(){
                var name=$("#name").val();
                var addr=$("#addr").val();
                var phone=$("#phone").val();
                var username=getCookie("username");
                alert(username);
                if((name=="" || name.length<0)||(phone=="" || phone.length<0)){
                    alert("必须输入货物名称和联系方式");
                    return;
                }
                var INSERT_URL="http://localhost:8080/customer/insert/"+name+"/"+addr+"/"+phone+"/"+username;
                $.ajax({
                    contentType: "application/json",
                    url:INSERT_URL,
                    type:"PUT",
                    statusCode:{
                        200:function(data){
                          alert("商品添加成功！")
                            window.location="main.jsp";
                        },
                        404:function(){
                            alert("商品添加失败！");
                            window.location="main.jsp";
                        }
                    }

                });
            });
        });
    </script>
</head>
<body>
<center>
    <form >

        <table border="1">
            <tr>
                <th>商品名</th>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <th>发货地址</th>
                <td><input type="text" name="addr" id="addr"></td>
            </tr>
            <tr>
                <th>电话</th>
                <td><input type="text" name="phone" id="phone"></td>
            </tr>

        </table>
        <input type="button" value="提交" id="insert">&nbsp;&nbsp; <input
            type="reset" value="重置">
    </form>
</center>
</body>
</html>
