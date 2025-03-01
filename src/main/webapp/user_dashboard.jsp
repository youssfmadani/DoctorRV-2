<%@page import="conn.db.DBconnect"%>
<%@page import="conn.dao.Appointmentdaw"%>
<%@page import="conn.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <%@include file="component/css.jsp"%>
</head>
<body>
<%@include file="component/navbar.jsp"%>

<div class="container p-3">
    <h2 class="text-center">Your Appointments</h2>
    <c:if test="${not empty errorMsg}">
        <p class="fs-4 text-center text-danger">${errorMsg}</p>
        <c:remove var="errorMsg" scope="session" />
    </c:if>
    <c:if test="${not empty succMsg}">
        <p class="fs-4 text-center text-success">${succMsg}</p>
        <c:remove var="succMsg" scope="session" />
    </c:if>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>#</th>
            <th>Full Name</th>
            <th>Gender</th>
            <th>Age</th>
            <th>Appointment Date</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Diseases</th>
            <th>Speciality</th>
            <th>Address</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Retrieve userId from session
            Object userIdObj = session.getAttribute("userId");
            int userId = (int) userIdObj;

            // Fetch appointments
            Appointmentdaw dao = new Appointmentdaw(DBconnect.getConn());
            List<Appointment> list = dao.getAppointmentsByUserId(userId);
            int count = 1;

            for (Appointment ap : list) {
        %>
        <tr>
            <td><%= count++ %></td>
            <td><%= ap.getFullName() %></td>
            <td><%= ap.getGender() %></td>
            <td><%= ap.getAge() %></td>
            <td><%= ap.getAppoinDate() %></td>
            <td><%= ap.getEmail() %></td>
            <td><%= ap.getPhNo() %></td>
            <td><%= ap.getDiseases() %></td>
            <td><%= ap.getSpec() %></td>
            <td><%= ap.getAddress() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>