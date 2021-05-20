<%--
  Created by IntelliJ IDEA.
  User: Sakura
  Date: 2019/12/12
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.Sakura.util.DBUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Sakura.model.User" %>
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
        <input id="sname" name="sname" placeholder="按姓名查询">
        <input type="submit" value="查询">
        <input type="button" value="增加学生信息" οnclick="window.location.href='stuAddForm.jsp'">
    </form>
    <table border="1" cellspacing="0" align="center">
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>地区</th>
            <th>专业</th>
            <th>班级</th>
            <th>民族</th>
            <%--  colspan属性用于将指定的横向单元格合并  --%>
            <th colspan="2">操作</th>
        </tr>

        <%
            DBUtils db = new DBUtils();
            String sname = request.getParameter("sname");
            String sql = null;
            if (sname == null) {
                sql = "select * from student";
            } else {
                sql = "select * from student where sname like '%" + sname + "%'";
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
                    <a href="stuModForm.jsp?sid=${stu.id}&sname=${stu.username}&email=${stu.email}"
                       style="text-decoration: none">修改</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>