<%@page import="com.Sakura.model.User"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="User" scope="page" class="com.Sakura.model.User"/>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="./login.css" type="text/css">
</head>
<body>
    <form action="login_do" method="POST" class="myform">
       <p class="register">
           <%	Object msg=request.getAttribute("message");
            if(msg!=null){
                out.println(msg);}
        %>
        <%
            Object o=session.getAttribute("user");
            if(o!=null){
                User user=(User)o;
                out.println("当前用户为:"+user.getusername()+"</br>");
            }
        %></p>
        <h1>用户登录</h1>
        <p>
            <label >用户名:</label>
            <input type="text" name="username" class="input">
        </p>
        <p>
            <label>密码:</label>
            <input type="password" name="password" class="input">
        </p>
        <p class="btn">
            <input type="submit" value="登录">
        </p>
        <p class="register">还没有账号? <a href="register.jsp">立即注册</a></p>
    </form>

</body>
</html>
