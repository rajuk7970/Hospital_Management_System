<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.entity.Doctor" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashboard</title>
<%@ include file="../component/allcss.jsp"%>
<style>
.paint-card {
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}
</style>
</head>
<body>

	<!-- Redirect to login if doctor not logged in -->
	<c:if test="${empty sessionScope.doctObj}">
		<c:redirect url="../doctor_login.jsp" />
	</c:if>

	<%@ include file="navbar.jsp"%>

	<div class="container p-5">

		<p class="text-center fs-3">Doctor Dashboard</p>



		<%
		Doctor d = (Doctor) session.getAttribute("doctObj");
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		%>


		<!-- Display welcome message with doctor full name -->
		<c:if test="${not empty sessionScope.doctObj}">
			<p class="text-center fs-4 text-success">Welcome, Dr.
				${sessionScope.doctObj.fullName}</p>
		</c:if>

		<!-- Example cards -->
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4">
							Doctor <br>
							<%=dao.countDoctor()%>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4">
							Total Appointment <br>
							<%=dao.countAppointmentByDoctorId(d.getId())%>
						</p>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>
