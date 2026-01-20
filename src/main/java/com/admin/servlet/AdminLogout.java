package com.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminLogout")
public class AdminLogout  extends HttpServlet{


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		jakarta.servlet.http.HttpSession  session =req.getSession();
		session.removeAttribute("adminObj");
		session.setAttribute("succMsg","Admin Logout Successfully");
		resp.sendRedirect("admin_login.jsp");
	}
	

}
