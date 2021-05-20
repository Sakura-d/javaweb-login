package com.Sakura.servlet;

import com.Sakura.util.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register_do")
public class RegisterServlet extends HttpServlet {
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		boolean issuccess= DBUtils.addUser(username, password, email);
		if(issuccess){
			request.setAttribute("message","注册成功,请登录");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else{
//			out.println("抱歉！注册失败，用户名已存在");
			request.setAttribute("message", "注册失败，用户名已存在");
			request.getRequestDispatcher("register.jsp").forward(request, response);
	}

	}
}
