<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.entity.*, com.dao.*, com.db.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Appointment List</title>

    <%@ include file="component/allcss.jsp" %>

    <style>
        .paint-card {
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .backImg {
            background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
                url("img/hospital.jpg");
            height: 20vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>

<body>
    <%@ include file="component/navbar.jsp" %>
    
    <c:if test="${empty userObj }">
    <c:redirect url= "user_login.jsp"></c:redirect>
    </c:if>

    <div class="container-fluid backImg p-5">
        <p class="text-center fs-2 text-white"></p>
    </div>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-9">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 fw-bold text-center text-success">Appointment List</p>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Age</th>
                                    <th scope="col">Appoint Date</th>
                                    <th scope="col">Diseases</th>
                                    <th scope="col">Doctor Name</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                User user = (User) session.getAttribute("userObj");
                                if (user == null) {
                                    response.sendRedirect("login.jsp");
                                    return;
                                }

                                AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                                DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                                List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());

                                for (Appointment ap : list) {
                                    Doctor d = dao2.getDoctorById(ap.getDoctorId());
                                %>
                                <tr>
                                    <td><%= ap.getFullName() %></td>
                                    <td><%= ap.getGender() %></td>
                                    <td><%= ap.getAge() %></td>
                                    <td><%= ap.getAppointDate() %></td>
                                    <td><%= ap.getDiseases() %></td>
                                    <td><%= d.getFullName() %></td>
                                    <td>
                                        <%
                                        if ("Pending".equals(ap.getStatus())) {
                                        %>
                                            <a href="#" class="btn btn-sm btn-warning">Pending</a>
                                        <%
                                        } else {
                                        %>
                                            <a href="#" class="btn btn-sm btn-success"><%= ap.getStatus() %></a>
                                        <%
                                        }
                                        %>
                                    </td>
                                </tr>
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-md-3 p-3">
                <img alt="Doctor Image" src="img/doct1.jpg" class="img-fluid">
            </div>
        </div>
    </div>
</body>
</html>
