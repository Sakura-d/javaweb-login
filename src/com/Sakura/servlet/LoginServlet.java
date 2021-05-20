package com.Sakura.servlet;
/**
 * @
 */

import com.Sakura.util.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/login_do")
public class LoginServlet extends HttpServlet {
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		 boolean r1= DBUtils.verifyAccount(username, password);
		if(r1==false){

			request.setAttribute("message", "<font color='red'> 登陆失败，用户名或密码错误</font>");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else{
			request.getSession();
			request.getRequestDispatcher("personCenter.jsp").forward(request, response);
		}
		
	}

}
