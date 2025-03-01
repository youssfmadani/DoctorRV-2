<%@page import="conn.db.DBconnect"%>
<%@page import="conn.dao.Specialistdaw" %>
<%@page import="conn.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>User Appointment</title>
	<%@include file="component/css.jsp"%>
	<style>
		.paint-card {
			box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
		}
		.backImg {
			background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
			url("image/back.jpg") no-repeat center center/cover;
			height: 20vh;
			width: 100%;
		}
	</style>
</head>
<body>
<%@include file="component/navbar.jsp"%>

<div class="container-fluid backImg p-5"></div>

<div class="container p-3">
	<div class="row">
		<div class="col-md-6 p-5">
			<img src="image/rendez_vous.jpg" width="400" height="500" alt="Appointment Image">
		</div>

		<div class="col-md-6">
			<div class="card paint-card">
				<div class="card-body">
					<p class="text-center fs-3">User Appointment</p>

					<c:if test="${not empty errorMsg}">
						<p class="fs-4 text-center text-danger">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>

					<c:if test="${not empty succMsg}">
						<p class="fs-4 text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<form class="row g-3" action="AppointmentServlet" method="post">
						<div class="col-md-6">
							<label class="form-label">Full Name</label>
							<input type="text" class="form-control" name="fullname" required>
						</div>

						<div class="col-md-6">
							<label>Gender</label>
							<select class="form-control" name="gender" required>
								<option value="male">Male</option>
								<option value="female">Female</option>
							</select>
						</div>

						<div class="col-md-6">
							<label class="form-label">Age</label>
							<input type="number" class="form-control" name="age" required>
						</div>

						<div class="col-md-6">
							<label class="form-label">Appointment Date</label>
							<input type="date" class="form-control" name="appoint_date" required>
						</div>

						<div class="col-md-6">
							<label class="form-label">Email</label>
							<input type="email" class="form-control" name="email" required>
						</div>

						<div class="col-md-6">
							<label class="form-label">Phone Number</label>
							<input type="text" class="form-control" name="phno" maxlength="10" required>
						</div>

						<div class="col-md-6">
							<label class="form-label">Diseases</label>
							<input type="text" class="form-control" name="diseases" required>
						</div>

						<div class="col-md-6">
							<label class="form-label">Speciality</label>
							<select class="form-control" name="spec" required>
								<option value="">-- Select --</option>
								<%
									Specialistdaw dao = new Specialistdaw(DBconnect.getConn());
									List<Specialist> list = dao.getAllspecialist();
									for (Specialist s : list) {
								%>
								<option><%= s.getSpecialistName() %></option>
								<% } %>
							</select>
						</div>

						<div class="col-md-12">
							<label>Full Address</label>
							<textarea class="form-control" name="address" rows="3" required></textarea>
						</div>

						<div class="col-md-12 text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
