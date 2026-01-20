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

<!-- Redirect to login if doctor not logged in -->
<c:if test="${empty doctObj}">
    <c:redirect url="../doctor_Login.jsp" />
</c:if>

<%@include file="navbar.jsp" %>

<div class="container p-4">
    
    <!-- Change Password Section -->
    <div class="row justify-content-center mb-4">
        <div class="col-md-6">
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
                    <form action="../doctorChangePassword" method="post">
                        <div class="mb-3">
                            <label>Enter New Password</label>
                            <input type="text" name="newPassword" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Enter Old Password</label>
                            <input type="text" name="oldPassword" class="form-control" required>
                        </div>
                        <input type="hidden" value="${doctObj.id}" name="uid">
                        <button class="btn btn-success col-md-12">Change Password</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Doctor Form Section -->
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card paint-card">
           <p class="text-center fs-3 mt-3">Edit Profile</p>
            <c:if test="${not empty succMsgd}">
                    <p class="text-center text-success fs-5">${succMsgd}</p>
                    <c:remove var="succMsg" scope="session" />
                </c:if>

                <c:if test="${not empty errorMsgd}">
                    <p class="text-center text-danger fs-5">${errorMsgd}</p>
                    <c:remove var="errorMsg" scope="session" />
                </c:if>
                <div class="card-body">
                    <form action="../doctorUpdateProfile" method="post">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" name="fullName" class="form-control" required value="${doctObj.fullName }">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">DOB</label>
                            <input type="date" name="dob" class="form-control" required value="${doctObj.dob}">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Qualification</label>
                            <input type="text" name="qualification" class="form-control" required value="${doctObj.qualification }">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Specialist</label>
                            <select name="spec" class="form-control" required  value="${doctObj.specialist}">
                                <option>${doctObj.specialist }</option>
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
                            <input type="text" name="email" class="form-control" required readonly value="${doctObj.email}">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mob No</label>
                            <input type="text" name="mobno" class="form-control" required value="${doctObj.mobNo}">
                        </div>
                        
                        <input type ="hidden" name ="id" value="${doctObj.id }">
                        <button type="submit" class="btn btn-primary col-md-12">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
