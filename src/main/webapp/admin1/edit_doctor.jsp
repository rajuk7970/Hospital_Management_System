<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.SpecialistDao, com.db.DBConnect, com.entity.Specialist"%>
<%@ page import="com.dao.DoctorDao, com.entity.Doctor"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor</title>
<%@ include file="../component/allcss.jsp"%>
<style>
.paint-card {
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}
</style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="container-fluid p-3">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Edit Doctor Details</p>

                        <c:if test="${not empty errorMsg}">
                            <p class="fs-3 text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty succMsg}">
                            <div class="fs-3 text-center text-success">${succMsg}</div>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <%
                            String id = request.getParameter("id");
                            DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                            Doctor doctor = dao2.getDoctorById(Integer.parseInt(id));
                            request.setAttribute("doctor", doctor);
                        %>

                        <form action="../updateDoctor" method="post">
                            <input type="hidden" name="id" value="${doctor.id}" />

                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" required name="fullname" class="form-control" value="${doctor.fullName}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">DOB</label>
                                <input type="date" required name="dob" class="form-control" value="${doctor.dob}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Qualification</label>
                                <input type="text" required name="qualification" class="form-control" value="${doctor.qualification}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Specialist</label>
                                <select required name="specialist" class="form-control">
                                    <option>-- Select --</option>
                                    <%
                                        SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                                        List<Specialist> list = dao.getAllSpecialist();
                                        String selectedSpecialist = doctor != null ? doctor.getSpecialist() : "";
                                        for (Specialist s : list) {
                                    %>
                                    <option value="<%=s.getSpecialistName()%>" <%= s.getSpecialistName().equals(selectedSpecialist) ? "selected" : "" %> >
                                        <%=s.getSpecialistName()%>
                                    </option>
                                    <% } %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" required name="email" class="form-control" value="${doctor.email}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Mob No</label>
                                <input type="text" required name="mobno" class="form-control" value="${doctor.mobNo}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" required name="password" class="form-control" value="${doctor.password}">
                            </div>

                            <button type="submit" class="btn btn-primary col-12">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
