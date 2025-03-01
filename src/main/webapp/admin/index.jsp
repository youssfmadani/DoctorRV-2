<%@page import="java.sql.*" %>
<%@page import="conn.db.DBconnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin | Home</title>
	<%@include file="../component/css.jsp" %>
	<style>
		.paint-card {
			box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
		}
	</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<%-- Redirect if admin is not logged in --%>
<c:if test="${empty adminObj}">
	<c:redirect url="../adminlogin.jsp"/>
</c:if>

<%-- Database Connection & Fetching Data --%>
<%
	int doctorCount = 0, userCount = 0, appointmentCount = 0, specialistCount = 0;
	try {
		Connection con = DBconnect.getConn();
		Statement stmt = con.createStatement();

		ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM doctor");
		if (rs.next()) doctorCount = rs.getInt(1);

		rs = stmt.executeQuery("SELECT COUNT(*) FROM user_dtls");
		if (rs.next()) userCount = rs.getInt(1);

		rs = stmt.executeQuery("SELECT COUNT(*) FROM appointment");
		if (rs.next()) appointmentCount = rs.getInt(1);

		rs = stmt.executeQuery("SELECT COUNT(*) FROM specialist");
		if (rs.next()) specialistCount = rs.getInt(1);
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<div class="container p-5">
	<p class="text-center fs-3">Admin Dashboard</p>
	<c:if test="${not empty errorMsg}">
		<p class="fs-3 text-center text-danger">${errorMsg}</p>
		<c:remove var="errorMsg" scope="session"/>
	</c:if>
	<c:if test="${not empty succMsg}">
		<div class="fs-3 text-center text-primary" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
	</c:if>

	<div class="row">
		<div class="col-md-4">
			<div class="card paint-card">
				<div class="card-body text-center text-primary">
					<i class="fas fa-user-md fa-3x"></i><br>
					<p class="fs-4 text-center">Doctor <br><%= doctorCount %></p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card paint-card">
				<div class="card-body text-center text-primary">
					<i class="fas fa-user-circle fa-3x"></i><br>
					<p class="fs-4 text-center">User <br><%= userCount %></p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card paint-card">
				<div class="card-body text-center text-primary">
					<i class="far fa-calendar-check fa-3x"></i><br>
					<p class="fs-4 text-center">Total Appointment <br><%= appointmentCount %></p>
				</div>
			</div>
		</div>
		<div class="col-md-4 mt-2">
			<div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
				<div class="card-body text-center text-primary">
					<i class="far fa-calendar-check fa-3x"></i><br>
					<p class="fs-4 text-center">Specialist <br><%= specialistCount %></p>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Add Specialist Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="../addspecialist" method="post">
					<div class="form-group">
						<label>Enter Specialist Name</label>
						<input type="text" name="specName" class="form-control" required>
					</div>
					<div class="text-center mt-3">
						<button type="submit" class="btn btn-primary">Add</button>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>
