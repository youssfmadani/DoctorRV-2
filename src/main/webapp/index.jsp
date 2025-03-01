<%@page import="conn.db.DBconnect" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<%@include file="component/css.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>


</head>
<body>
	<%@include file="component/navbar.jsp"%>
	


	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="image/ind.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			
		</div>
		
	</div>

	<div class="container p-3">
		<p class="text-center fs-2 ">About  our Hospital</p>

		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Time-Saving</p>
								<p>Our online booking system eliminates the need for time-consuming phone calls or visits to your doctor's office. You can easily book, cancel or reschedule your appointment anytime, anywhere.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Flexible Options</p>
								<p>Our system provides you with a range of options to suit your needs. You can choose the doctor you want to see, select the type of appointment, and even specify the reason for your visit.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Customizable Features</p>
								<p>We understand that every patient's needs are unique, so our system allows you to customize your appointments to suit your requirements. You can add notes or special requests, and even request a telemedicine appointment if you prefer.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Secure and Confidential</p>
								<p>Our online system uses state-of-the-art security measures to ensure the confidentiality of your personal information. You can be confident that your data is safe and protected at all times</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<img alt="" src="image/acc1.svg" class="img-fluid" width="400px" height="600px">
			</div>

		</div>
	</div>

	<hr>

	




</body>
</html>