<%@ page import="com.dao.SpecialistDao"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.entity.Specialist"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@include file="../component/allcss.jsp" %>
</head>
<body>

<!-- Redirect if doctor is not logged in -->
<c:if test="${empty doctObj}">
    <c:redirect url="../doctor_Login.jsp" />
</c:if>

<%@include file="navbar.jsp" %>

<div class="container p-4">
    <div class="row">

        <!-- 🔵 Left Column - Change Password -->
        <div class="col-md-4">
            <div class="card paint-card">
                <p class="text-center fs-3 mt-3">Change Password</p>

                <c:if test="${not empty succMsg}">
                    <p class="text-center text-success fs-5">${succMsg}</p>
                    <c:remove var="succMsg" scope="session" />
                </c:if>

                <c:if test="${not empty errorMsg}">
                    <p class="text-center text-danger fs-5">${errorMsg}</p>
                    <c:remove var="errorMsg" scope="session" />
                </c:if>

                <div class="card-body">
                    <form action="userChangePassword" method="post">
                        <div class="mb-3">
                            <label>Enter New Password</label>
                            <input type="text" name="newPassword" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Enter Old Password</label>
                            <input type="text" name="oldPassword" class="form-control" required>
                        </div>
                        <input type="hidden" value="${userObj.id}" name="uid">
                        <button class="btn btn-success col-md-12">Change Password</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- 🔵 Right Column - Add Doctor -->
        <div class="col-md-8">
            <div class="card paint-card">
                <div class="card-body">
                    <form action="../addDoctor" method="post">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" name="fullName" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">DOB</label>
                            <input type="date" name="dob" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Qualification</label>
                            <input type="text" name="qualification" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Specialist</label>
                            <select name="spec" class="form-control" required>
                                <option>--select--</option>
                                <%
                                    SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                                    List<Specialist> list = dao.getAllSpecialist();
                                    for (Specialist s : list) {
                                %>
                                <option><%= s.getSpecialistName() %></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="text" name="email" class="form-control" required readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mob No</label>
                            <input type="text" name="mobno" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary col-md-12">Submit</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
