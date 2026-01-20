package com.doctor.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/doctorLogout")
public class DoctorLogout extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	

	jakarta.servlet.http.HttpSession  session =req.getSession();
			session.removeAttribute("doctObj");
			session.setAttribute("succMsg","Doctor Logout Successfully");
			resp.sendRedirect("doctor_login.jsp");
	
	

}
}