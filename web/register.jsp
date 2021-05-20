<%@page import="com.Sakura.model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Page</title>
    <link rel="stylesheet" href="./login.css" type="text/css">
    <link rel="shortcut icon" type="image/icon" href="./img/favicon.ico"/>
<title>Insert title here</title>
</head>
<body>

<form action="register_do" method="POST" class="myform">
    <p class="register"><%
        Object o=session.getAttribute("user");
        if(o!=null){
            User user=(User)o;
            out.println("当前用户为:"+user.getusername()+"</br>");
        }
    %></p>
    <%Object msg=request.getAttribute("message");
        if(msg!=null){
            out.println(msg);}
    %>
    <h1>用户注册</h1>
    <p>
        <label>用户名:</label>
        <input type="text" name="username" class="input">
    </p>
    <p>
        <label >密码:</label>
        <input type="password" name="password" class="input">
    </p>
    <p>
        <label >邮箱</label>
        <input type="email" name="email" class="input">
    </p>

    <p class="btn">
        <input type="submit" value="注册">
    </p>
    <p class="register">已有账号? <a href="index.jsp">立即登录</a></p>
</form>
</body>
</html>