<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="CSS/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="navbar.jsp" %>
<section class="my-5">
	<div class="py-5">
		<h2 class="text-center">About Us</h2>
	</div>
	<div class="container-fluid">
	<div class="row">
		<div class="col-lg-6 col-md-6 col-12">
			<img src="images/key.jpg" class="img-fluid aboutimg" >
		</div>
			<div class="col-lg-6 col-md-6 col-12">
				<h2 class="display-4">Magic Cement</h2>
				<p class="py-4">
					Magic Cement is a place where you will find the property of your dreams. The property you aspire for can be anything 
					be it Industrial, Commercial, House, Land.
					You can also trust us to sell your property to millions of people in the world.
					We connect owners with clients and also connect clients with the agents across the world.
					You can book an appointment for site visit by just a click of a button.
				</p>
				<a href="contact.jsp" class="btn btn-success">Contact Us</a>
				<a href="AddProperty.jsp" class="btn btn-success">Sell your Property</a>
				<a href="Explore.jsp" class="btn btn-success">Buy a Property</a>
			</div>
		</div>
	</div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>