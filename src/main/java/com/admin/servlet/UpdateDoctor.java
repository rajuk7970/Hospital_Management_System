package com.admin.servlet;

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

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String fullName = req.getParameter("fullname");
            String dob = req.getParameter("dob");   // yyyy-mm-dd format
            String qualification = req.getParameter("qualification");
            String specialist = req.getParameter("specialist");
            String email = req.getParameter("email");
            String mobNo = req.getParameter("mobno");
            String password = req.getParameter("password");

            int id = Integer.parseInt(req.getParameter("id"));

            Doctor d = new Doctor();
            d.setId(id);
            d.setFullName(fullName);
            d.setDob(dob);
            d.setQualification(qualification);
            d.setSpecialist(specialist);
            d.setEmail(email);
            d.setMobNo(mobNo);
            d.setPassword(password);

            DoctorDao dao = new DoctorDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.updateDoctor(d)) {
                session.setAttribute("succMsg", "Doctor updated Successfully");
            } else {
                session.setAttribute("errorMsg", "Something went wrong on server");
            }
            resp.sendRedirect("admin1/view_doctor.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
