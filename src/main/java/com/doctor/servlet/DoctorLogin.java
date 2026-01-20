package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String email = req.getParameter("email");
	    String password = req.getParameter("password");

	    HttpSession session = req.getSession();
	    DoctorDao dao = new DoctorDao(DBConnect.getConn());
	    Doctor doctor = dao.login(email, password);

	    System.out.println("Doctor login attempt: " + email);

	    if (doctor != null) {
	        session.setAttribute("doctObj", doctor);
	        System.out.println("Doctor login success: " + doctor.getFullName());
	        resp.sendRedirect(req.getContextPath() + "/doctor/index.jsp");  // Absolute path
	    } else {
	        session.setAttribute("errorMsg", "Invalid email & password");
	        resp.sendRedirect(req.getContextPath() + "/doctor_login.jsp");
	    }
	}

}
