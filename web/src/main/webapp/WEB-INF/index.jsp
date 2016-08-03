<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Perfect Harmony - Home</title>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- SCRIPTS -->
		<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/effects.js"></script>
		<script src="${pageContext.request.contextPath}/dist/js/smooth-scroll.js"></script>

		<!-- Latest compiled and minified CSS -->
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
		<!-- Custom CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hris.css" type="text/css" />
		<!-- Favicon -->
		<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.png">
	</head>

	<body id="page-top">
		<!-- NAVIGATION -->
		<nav class="navbar transparent navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header page-scroll">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle Navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a data-scroll class="pull-left header-link" href="#page-top">
						<img class="header-logo" src="images/header-icon1.png">
					</a>
				</div>

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="hidden active">
							<a data-scroll href="#page-top"></a>
						</li>
						<li>
							<a data-scroll href="#page-top">
								<span>Home</span>
							</a>
						</li>
						<li>
							<a data-scroll href="#bulletin">
								<span>Bulletin</span>
							</a>
						</li>
						<li>
							<a data-scroll href="#contact">
								<span>Contact Us</span>
							</a>
						</li>
						<li>
							<a data-scroll href="#about">
								<span>About</span>
							</a>
						</li>
						<li>
							<a data-toggle="modal" data-target="#loginModal">
								<span>Login</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- HEADER -->
		<section id="home-top" class="header hris-section">
			<div class="container">
				<div class="row">
					<h1 class="text-center big"><i>Perfect Harmony</i></h1> 
					<h3 class="text-center">"SING YOUR FEELINGS"</h3>
					<h3 class="text-center">KAMIAS ST. QUEZON CITY</h3>
				</div>
			</div>
		</section>
		<!-- BULLETIN-->
		<section id="bulletin" class="hris-section">
			<div class="container" id="offset-top">
				<div class="row">
					<h1>Bulletin</h1>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<a class="btn btn-lg btn-outline" href="">Learn More</a>
					</div>
				</div>
			</div>
		</section>
		<!-- ABOUT -->
		<section id="about" class="hris-section">
			<div class="container" id="offset-top">
				<div class="row">
					<h1>About</h1>
					<img class="header-logo" src="images/header-icon1.png">
				</div>
				
				<div class="row">
					<h3>Vision:</h3>
					<p>A leading Karaoke bar in Valenzuela that is vibrant center of enjoyment and interactive entertainment that establish a best quality of service for our customers.</p>
				</div>
				<div class="row">
					<h3>Mission:</h3>
					<p>To provide a place for customer’s satisfaction by giving them a high quality of entertainment while founding a triumph relationship to our beloved customers</p>
				</div>
				

				<div class="row">
					<div class="col-lg-12">
						<a class="btn btn-lg btn-outline" href="">Learn More</a>
					</div>
				</div>
			</div>
		</section>
		<!-- CONTACT US -->
		<section id="contact" class="contact-section hris-section">
			<div class="container" id="offset-top">
				<div class="row">
					<h2 class="text-white">Contact Us</h2>
				</div>
				<div class="row"><hr></div>
				<div class="row">
					<div class="col-lg-5 col-md-5 col-sm-5">
						<div class="row">
							<div class="col-lg-12">
								<ul class="contact-list text-left">
									<strong>Valenzuela City, Philippines</strong>
									<li>Pamantasan ng Lungsod ng Valenzuela</li>
									<li>Contact Person:</li>
									<li>Mobile Number: </li>
								</ul>
							</div>
						</div>
					</div>

					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="row">
							<p class="text-center text-white">Need to get in touch? Please fill out our form below and we'll contact you as soon as possible.</p>
						</div>
						<div class="row">
							<h1>(Login First to send message)</h1>
						</div>
					</div>
				</div>
				<div class="row">
					<hr>
				</div>
				<div class="row">
					<small class="pull-right">Perfect Harmony. Sing your feelings © 2016</small>
					<small class="pull-left">
						<span class="glyphicon glyphicon-envelope"></span>
						<a href="">Pamantasan ng Lungsod ng Valenzuela</a>
					</small>
				</div>
			</div>
		</section>
		

		<!-- Login Modal -->
		<div id="loginModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Login</h4>
		      </div>
		      <div class="modal-body">
		        <form role="form" action="${pageContext.request.contextPath}/HomePage" method="post">
							<div class="form-group">
							  <label for="email" style="color : black;">Username:</label>
							  <input type="text" class="form-control" id="email" name = "user"/>
							</div>
							<div class="form-group">
							  <label for="pwd" style="color : black;">Password:</label>
							  <input type="password" class="form-control" id="pwd" name = "pass"/>
							</div>
							<div class="checkbox">
							  <label><input type="checkbox"> Remember me</label>
							</div>
							<input type="submit" class="btn btn-success" value="Submit"/>
						</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	</body>
</html>