<%@ page import="conn.entity.User" %>
<%@ page import="conn.entity.Appointment" %>
<%@ page import="conn.dao.Appointmentdaw" %>
<%@ page import="conn.db.DBconnect" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Appointments</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><i class="fas fa-clinic-medical"></i> We Help</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="index.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <h2>Your Appointments</h2>

            <c:if test="${not empty errorMsg}">
                <div class="alert alert-danger" role="alert">${errorMsg}</div>
            </c:if>
            <c:if test="${not empty succMsg}">
                <div class="alert alert-success" role="alert">${succMsg}</div>
            </c:if>

            <table class="table table-bordered mt-4">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Age</th>
                    <th>Date</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Specialist</th>
                    <th>Address</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    User loggedInUser = (User) session.getAttribute("user");
                    if (loggedInUser != null) {
                        int userId = loggedInUser.getId();
                        Appointmentdaw appointmentDAO = new Appointmentdaw(DBconnect.getConn());
                        List<Appointment> appointments = appointmentDAO.getAppointmentsByUserId(userId);

                        if (appointments != null && !appointments.isEmpty()) {
                            for (Appointment appointment : appointments) {
                %>
                <tr>
                    <td><%= appointment.getId() %></td>
                    <td><%= appointment.getFullName() %></td>
                    <td><%= appointment.getGender() %></td>
                    <td><%= appointment.getAge() %></td>
                    <td><%= appointment.getAppoinDate() %></td>
                    <td><%= appointment.getEmail() %></td>
                    <td><%= appointment.getPhNo() %></td>
                    <td><%= appointment.getSpec() %></td>
                    <td><%= appointment.getAddress() %></td>
                    <td>
                        <a href="cancel_appointment.jsp?id=<%= appointment.getId() %>" class="btn btn-danger btn-sm">Cancel</a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="10" class="text-center">No appointments found.</td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="10" class="text-center">Please log in to view your appointments.</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>