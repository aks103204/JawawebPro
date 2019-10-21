<%@ page import="java.util.*" %>
<%@ page import="com.test.model.User" %>
<%@ page import="com.test.model.Customer" %><%--
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
        //获取cookie
        $(function() {
          //  $("#queryAll").click(function () {
                var username = getCookie("username");
                var QUERYALL_URL = "http://localhost:8080/customer/queryAll/" + username;
                $.ajax({
                    contentType: "application/json",
                    url: QUERYALL_URL,
                    dataType: "text json",
                    type: "post",
                    statusCode: {
                        200: function (data) {
                            var str="";
                            $(data).each(function(i,value){
                                str+="<tr><td>"+value.id+"</td>"+
                                    "<td>"+value.name+"</td>"+
                                    "<td>"+value.address+"</td>"+
                                    "<td>"+value.phone+"</td>"+
                                    "<td>"+
                                    "<input type='button'  onclick='edit("+value.id+")' value='编辑'/>"+
                                    "<input type='button'  onclick='del("+value.id+")' value='删除'/>"+
                                    "</td></tr>";

                            });
                            $("#msg").append(str);
                        }, 404: function () {
                            alert("查询失败！");
                            window.location = "main.jsp";
                        }
                    }

               });
       //     });
            $("#returnTomain").click(function() {
                    window.location="main.jsp";
            });
            $("#queryLike").click(function() {
                $('table tbody').html('');
                var pname =$("#pname").val();
                var username = getCookie("username");
                var QUERYLIKE_URL="http://localhost:8080/customer/queryLike/"+pname+"/"+username;
                $.ajax({
                    contentType: "application/json",
                    url:QUERYLIKE_URL,
                    type:"post",
                    statusCode:{
                        200:function(data){

                            var str="";
                            $(data).each(function(i,value){
                                str+="<tr><td>"+value.id+"</td>"+
                                    "<td>"+value.name+"</td>"+
                                    "<td>"+value.address+"</td>"+
                                    "<td>"+value.phone+"</td>"+
                                    "<td>"+
                                    "<input type='button'  onclick='edit("+value.id+")' value='编辑'/>"+
                                    "<input type='button'  onclick='del("+value.id+")' value='删除'/>"+
                                    "</td></tr>";
                            });
                            $("#msg").append(str);
                        },
                        404:function(){
                            alert("无相似字段商品！");
                            window.location = "main.jsp";
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

        function del(id){
            var DELETE_URL = "http://localhost:8080/customer/delete/" + id;
            $.ajax({
                type:"post",
                url:DELETE_URL,
                statusCode:{
                    200:function(){
                        alert("删除成功！");
                        window.location="query.jsp";
                    },
                    404:function(){
                        alert("删除失败!");
                        window.location="query.jsp";
                    }
                }
            });
        }
        function edit(id) {
            window.location="update.jsp?id="+id;
        }
    </script>
</head>
<body>
    <script>
        $(function() {
            if(getCookie("username")==null){
                $("#span1").html("游客");
            }else{
                $("#span1").html(getCookie("username"));
            }
        });
        //document.getElementById('span1').innerText="span的文本";

    </script>
    <tr>
        <td>
            <b><i><font size="2" color="BLACK">欢迎<span id="span1" name="span1"></span></font></i></b>
            &nbsp;
        </td>
    </tr>
    <input type="button" id="returnTomain" value="返回">
    <center>
        <table border="1" id="msg">
            <tbody>
            <tr>
                <th width="10" >编号</th>
                <th width="50" id="name">商品名</th>
                <th width="80" id="addr">发货地址</th>
                <th width="150" id="phone">手机号</th>
                <th width="80" colspan="2">操作</th>
            </tr>
            </tbody>



            <%--<%--%>

            <%--for(Customer p:list){--%>
            <%--%>--%>
            <%--<tr>--%>
            <%--<td><%=p.getId()%></td>--%>
            <%--<td><%=p.getName()%></td>--%>
            <%--<td><%=p.getAddress()%></td>--%>
            <%--<td><%=p.getPhone()%></td>--%>
            <%--<td><a href="#"onclick="fun(<%=p.getId()%>)">删除</a> </td>--%>
            <%--<td><a href="update.jsp?id=<%=p.getId()%>">更新</a> </td>--%>
            <%--</tr>--%>
            <%--<%--%>
            <%--}--%>
            <%--%>--%>
        </table>
        <form >
            查找名称 <input type="text" name="pname" id="pname">
            <input type="button" value="查询"id="queryLike">
        </form>
    </center>


</body>
</html>
