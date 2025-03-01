<%@ page import="conn.entity.User" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include FontAwesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><i class="fas fa-clinic-medical"></i> We Help</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" href="dashboard.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="index.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main content -->
<div class="container mt-5">
    <div class="row">
        <div class="col-md-8">
            <h2 class="mb-4">Welcome, <%= session.getAttribute("user") != null ? ((User) session.getAttribute("user")).getFullname() : "User" %>!</h2>
            <p>Welcome to your dashboard. Here you can manage your account and interact with our services.</p>

            <h3>Your Details:</h3>
            <table class="table table-bordered">
                <tr>
                    <th>Full Name</th>
                    <td><%= session.getAttribute("user") != null ? ((User) session.getAttribute("user")).getFullname() : "" %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= session.getAttribute("user") != null ? ((User) session.getAttribute("user")).getEmail() : "" %></td>
                </tr>
            </table>
        </div>
        <div class="col-md-4">
            <h3>Actions</h3>
            <div class="list-group">
                <a href="user_appointment.jsp" class="list-group-item list-group-item-action">Add Appointment</a>
                <a href="view_appointments.jsp" class="list-group-item list-group-item-action">View Appointments</a>
            </div>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
