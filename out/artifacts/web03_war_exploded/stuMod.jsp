<%--
  Created by IntelliJ IDEA.
  User: Sakura
  Date: 2019/10/26
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.Sakura.util.DBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息修改页面</title>
</head>
<body>
<%
    //获取表单中的数据
    String id = request.getParameter("id");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    //创建一个操作数据库的对象
    DBUtils dbu = new DBUtils();
    //组装SQL语句
    String sql = "update student set username='"+username+"',email'"+email+"'  where id="+id;
    try {
        if (dbu.studentUpdate(sql)){
            response.sendRedirect("index.jsp");
        }else {
            request.getRequestDispatcher("stuModForm.jsp").forward(request,response);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>