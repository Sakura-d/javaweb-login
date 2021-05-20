
<%@ page import="com.Sakura.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Sakura.util.DBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息显示页面</title>
    <style>
        td, th {
            /* white-space: nowrap; 文本不换行显示 */
            white-space: nowrap;
            width: 70px;
            height: 35px;
            /*text-align: center;文本居中显示*/
            text-align: center;
        }

        /* div块居中显示 */
        .divcenter {
            width: 850px;
            height: 400px;
            background-color: #9bfaff;
            /* overflow: auto;当内容溢出时添加滚动条 */
            overflow: auto;
            /* margin: auto;使div块居中显示 */
            margin: auto;
        }
    </style>
</head>
<body>
<div class="divcenter">
    <%-- style="text-align: center; 使form表单居中显示 --%>
    <form action="student.jsp" style="text-align: center;margin-top: 10px">
        <input id="username" name="username" placeholder="按用户名查询">
        <input type="submit" value="查询">
        <input type="button" value="增加用户信息" οnclick="window.location.href='stuAddForm.jsp'">
    </form>
    <table border="1" cellspacing="0" align="center">
        <tr>
            <th>id</th>
            <th>用户名</th>
            <th>邮箱</th>
            <%--  colspan属性用于将指定的横向单元格合并  --%>
            <th colspan="2">操作</th>
        </tr>

        <%
            DBUtils db = new DBUtils();
            String username = request.getParameter("username");
            String sql = null;
            if (username == null) {
                sql = "select * from web";
            } else {
                sql = "select * from web where username like '%" + username + "%'";
            }
            List<User> lst = db.getUser(sql);
            request.setAttribute("stuLst", lst);
        %>
        <c:forEach items="${stuLst}" var="stu">
            <tr id="${stu.id}">
                <td>${stu.id}</td>
                <td>${stu.username}</td>
                <td>${stu.email}</td>

                <td><a href="studel.jsp?sid=${stu.id}" style="text-decoration: none">删除</a></td>
                <td>
                    <a href="stuModForm.jsp?id=${stu.id}&username=${stu.usersname}&email=${stu.email}"
                       style="text-decoration: none">修改</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>