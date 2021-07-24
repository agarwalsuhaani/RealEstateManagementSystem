<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Magic Cement</title>
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
<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/bunglow1.jpg" alt="Los Angeles" width="1100" height="500">
      <div class="carousel-caption">
        <h3>SK Villa</h3>
        <p>Residential Property</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="images/bunglow2.jpg" alt="Chicago" width="1100" height="500">
      <div class="carousel-caption">
        <h3>Agarwal Villa</h3>
        <p>Residential Property</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="images/comm1.jpg" alt="New York" width="1100" height="500">
      <div class="carousel-caption">
        <h3>Phoenix Towers</h3>
        <p>Commercial Property</p>
      </div>   
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

<section class="my-5">
	<div class="py-3">
		<h2 class="text-center">About Us</h2>
	</div>
	<div class="container-fluid">
	<div class="row">
		<div class="col-lg-6 col-md-6 col-12">
			<img src="images/key.jpg" class="img-fluid aboutimg" >
		</div>
			<div class="col-lg-6 col-md-6 col-12">
				<h2 class="display-4">Magic Cement</h2>
				<p class="py-3">
					Magic Cement is a place where you will find the property of your dreams. The property you aspire for can be anything 
					be it Industrial, Commercial, House, Land.
					You can also trust us to sell your property to millions of people in the world.
				</p>
				<a href="about.jsp" class="btn btn-success">Know More</a>
			</div>
		</div>
	</div>
</section>
<section class="my-5">
	<div class="py-3">
		<h2 class="text-center">Buy</h2>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-4 col-md-3 col-12">
				<div class="card" >
					  <img class="card-img-top" src="images/1.jpg" alt="Card image" class="img-fluid cardimg" >
					  <div class="card-body">
					    <h5 class="card-title">Central Park</h5>
					    <p class="card-text">Residential Plot</p>
					    <a href="Display.jsp?pid=1" class="btn btn-success">See Profile</a>
 						</div>	
				</div>
			</div>
			<div class="col-lg-4 col-md-3 col-12">
				<div class="card" >
					  <img class="card-img-top" src="images/2.jpg" alt="Card image" class="img-fluid cardimg">
					  <div class="card-body">
					    <h4 class="card-title">Verde Towers</h4>
					    <p class="card-text">Commercial Property</p>
					    <a href="Display.jsp?pid=2" class="btn btn-success">See Profile</a>
 						</div>	
				</div>
			</div>
			<div class="col-lg-4 col-md-3 col-12">
				<div class="card" >
					  <img class="card-img-top" src="images/3.jpg" alt="Card image" class="img-fluid cardimg" >
					  <div class="card-body">
					    <h4 class="card-title">KJ Villa</h4>
					    <p class="card-text">Residential Property</p>
					    <a href="Display.jsp?pid=3" class="btn btn-success">See Profile</a>
 						</div>	
				</div>
			</div>
		</div>
	</div>
</section>



<section class="my-5">
	<div class="py-5">
		<h2 class="text-center">Contact Us</h2>
	</div>
	<div class="w-50 m-auto">
		<form action="contact.jsp">
			<div class="form-group">
				<label>Name</label>
				<input type="text" name="name" autocomplete="off" class="form-control" placeholder="Enter your Name" required>
			</div>
			<div class="form-group">
				<label>Contact Number</label>
				<input type="text" name="contact" autocomplete="off" class="form-control" placeholder="Enter your Contact Number" required>
			</div>
			<div class="form-group">
				<label>Email Id</label>
				<input type="text" name="email" autocomplete="off" class="form-control" placeholder="Enter Email Id" required>
			</div>
			<div class="form-group">
				<label>Comments</label>
				<textarea class="form-control" autocomplete="off" placeholder="Comments" required></textarea>
			</div>
			<button type="submit" class="btn btn-success">Submit</button>
		</form>
	</div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>