<%--
  Created by IntelliJ IDEA.
  User: Sakura
  Date: 2019/10/26
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息修改页面</title>
    <style>
        .divcenter {
            width: 850px;
            height: 400px;
            background-color: papayawhip;
            /* margin: auto;使div块居中显示 */
            margin: auto;
        }
    </style>
</head>
<body>
<div class="divcenter">
    <div style="height: 10px"></div>
    <%--  使用<form>标签创建表单，在表单中使用<table>标签进行页面布局，使用<input>标签搜集用户输入的数据  --%>
    <form action="stuMod.jsp" style="text-align: center">
        <table align="center">
            <tr>
                <td colspan="2" style="text-align: center">
                </td>
            </tr>
            <tr>
                <td>id：</td>
                <%-- readonly属性规定字段只能读，不能编辑修改--%>
                <td><input id="id" name="id" value="<%=request.getParameter("id")%>" required readonly></td>
            </tr>
            <tr>
                <td>用户名：</td>
                <%--  required 属性规定必需在提交表单之前填写输入字段  --%>
                <td><input id="username" name="username" value="<%=request.getParameter("username")%>" required></td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input id="email" name="email" value="<%=request.getParameter("email")%>"></td>
            </tr>
        </table>
        <table align="center">
            <tr style="text-align: center">
                <td>
                    <input type="submit" value="确认修改">
                </td>
                <td>
                    <input type="button" value="返回" οnclick="onclick="window.location.href = 'http://localhost:8080/web02/personCenter.jsp">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>