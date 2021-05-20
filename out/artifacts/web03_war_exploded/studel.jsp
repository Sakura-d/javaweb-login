<%--
  Created by IntelliJ IDEA.
  User: Sakura
  Date: 2019/10/26
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.Sakura.util.DBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除学生信息</title>
</head>
<body>
<%
    String sid = request.getParameter("sid");
    String sql = "delete from student where sid = "+sid;
    DBUtils dbu = new DBUtils();
    if (dbu.studentUpdate(sql)){
        System.out.println("删除语句为:"+sql);
        System.out.println(sid+"号学生已成功删除");
        response.sendRedirect("student.jsp");
    }else {
        out.println(sql);
        out.println(sid+"号学生删除失败");
    }
%>
</body>
</html>