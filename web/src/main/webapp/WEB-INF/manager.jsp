<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<c:set var="employee" value="${employee}" />
	<c:set var="employeeName" value="${employee.getName()}"/>
	<c:set var="employeeAddress" value="${employee.getAddress()}"/>
	<c:set var="employeeContact" value="${employee.getContact()}"/>
	<c:set var="employeePosition" value="${employee.getPosition()}"/>
	<c:set var="employeeMessages" value="${employee.getMessages()}"/>
	<c:set var="employeeAction" value="${employee.getActions()}"/>
	<head>
		<title>${employeeName} - Perfect Harmony</title>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- SCRIPTS -->
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/effects.js"></script>
		<script src="dist/js/smooth-scroll.js"></script>

		<!-- Latest compiled and minified CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!-- Custom CSS -->
		<link rel="stylesheet" href="css/hris.css" type="text/css" />
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
							<a data-scroll href="#home">
								<span>Home</span>
							</a>
						</li>
						<li>
							<a data-scroll href="#bulletin">
								<span>Bulletin</span>
							</a>
						</li>
						<li>
							<a data-scroll href="#about">
								<span>About</span>
							</a>
						</li>
						<li>
							<a data-scroll href="#contact">
								<span>Contact Us</span>
							</a>
						</li>
						<li>
							<a data-toggle="modal" data-target="#loginModal">
								<span>Logout</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- HEADER -->
		<section class="header hris-section" style="background-image : url('images/manager-bg.jpg')">
			<div class="container">
				<div class="row">
					<h2 class="text-left" style="margin-top:0px; color:black;">Welcome ${employeeName}</h2> 
				</div>
			</div>
		</section>
		<!-- BULLETIN -->
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
							<form id="contact-form" method="post" action="" role="form">
								<div class="messages"></div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<!-- <label for="form_name">First Name</label> -->
              					<input id="form_name" type="text" name="name" class="form-control" placeholder="First name *" required="required" data-error="First name is required.">
            						<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<!-- <label for="form_lastname">Last Name</label> -->
              					<input id="form_lastname" type="text" name="surname" class="form-control" placeholder="Last name *" required="required" data-error="Last name is required.">
            						<div class="help-block with-errors"></div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<!-- <label for="form_email">Email</label> -->
              					<input id="form_email" type="email" name="email" class="form-control" placeholder="Email address *" required="required" data-error="Email address is required.">
            						<div class="help-block with-errors"></div>
											</div>
										</div>
										
									</div>

									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<!-- <label for="form_message">Message</label> -->
              					<textarea id="form_message" name="message" class="form-control" rows="8" placeholder="Message *" required="required" data-error="Email address is required." style="resize:none;"></textarea>
            						<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-lg-12">
											<input type="submit" class="btn btn-success btn-send pull-right" value="Submit">
										</div>
									</div>
							</form>
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
		
		<div id="loginModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Logout</h4>
		      </div>
		      <div class="modal-body">
					<a class="btn btn-success" href="${pageContext.request.contextPath}/Manager?action=logout">Yes</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
		      </div>
		      <div class="modal-footer">
		        
		      </div>
		    </div>
		  </div>
		</div>
	</body>
</html>