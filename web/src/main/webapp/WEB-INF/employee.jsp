<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

	<c:set var="employee" value="${employee}" />
	<c:set var="employeeName" value="${employee.getName()}"/>
	<c:set var="employeeAddress" value="${employee.getAddress()}"/>
	<c:set var="employeeContact" value="${employee.getContact()}"/>
	<c:set var="employeePosition" value="${employee.getPosition()}"/>
	
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
	
		<!-- variable initialization -->
		
	
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
		<section id="home" class="header hris-section" style="background-image : url('images/employee-bg.jpg')">
			<c:forEach var = "err" items = "${error}">
					<div class="column column-6"><h4 style="color:red">${err}</h4></div>
			</c:forEach>
			
			<div class="column column-6"><h4 style="color:green">${message}</h4></div>
			<div class="container">
				<div class="row">
					<span></span>
					<h2 class="text-left" style="margin-top:0px; color:black;">Welcome ${employeeName} </h2> 	
					
					<h4 class="text-left" style="margin-top:0px; color:black;">Full Name: ${employeeName} </h4>
					
					<h4 class="text-left" style="margin-top:0px; color:black;">Address: ${employeeAddress} </h4>
					
					<h4 class="text-left" style="margin-top:0px; color:black;">Contact Number: ${employeeContact} </h4>
					
					<h4 class="text-left" style="margin-top:0px; color:black;">Position: ${employeePosition} </h4>
				</div>
			</div>
		</section>
		<!-- BULLETIN-->
		<section id="bulletin" class="hris-section">
			<div class="container" id="offset-top">
				<div class="row">
					<h1>Bulletin</h1>
					<hr>
					<!--ANNOUNCEMENTS CAROUSEL-->
					<div id="announcementCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
						  <li data-target="#announcementCarousel" data-slide-to="0" class="active"></li>
						  <li data-target="#announcementCarousel" data-slide-to="1"></li>
						  <li data-target="#announcementCarousel" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
						  <div class="item active">
						    <div class="row alert alert-success" style ="border:1px solid orange;">
						    	<h3>Announcements!</h3>
								
								<c:forEach var="blog" items="${bulletin}" >
									<c:if test="${blog.getBulletinType().equals('announcement')}">
										<div class="col-xs-6">
											<h4 class=""> <b>Posted By: ${blog.getEmployeeName()}</b> </h4>
											<span class="text-center big" ><b>Title:</b> ${blog.getBulletinSubject()}</span>
										</div>
										<br/>
										<br/>
										<div class="text-center">
											
											<p>${blog.getMessage()}</p>
										</div>
										<hr>
									</c:if>
								</c:forEach>
						    </div>
						  </div>

						  <div class="item">
						    <div class="row alert alert-warning" style ="border:1px solid orange;" >
						    	<h3>Updates</h3>
						    	<c:forEach var="blog" items="${bulletin}" >
									<c:if test="${blog.getBulletinType().equals('update')}">
										<div class="col-xs-6">
											<h4 class=""> <b>Posted By: ${blog.getEmployeeName()}</b> </h4>
											<span class="text-center big" ><b>Title:</b> ${blog.getBulletinSubject()}</span>
										</div>
										<br/>
										<br/>
										<div class="text-center">
											<p>${blog.getMessage()}</p>
										</div>
										<hr>
									</c:if>
									
								</c:forEach>
						    </div>
						  </div>

						  <div class="item">
						    <div class="row alert alert-danger" style ="border:1px solid orange;">
						    	<h3>News</h3>
						    	<c:forEach var="blog" items="${bulletin}" >
									<c:if test="${blog.getBulletinType().equals('news')}">
										<div class="col-xs-6">
											<h4 class=""> <b>Posted By: ${blog.getEmployeeName()}</b> </h4>
											<span class="text-center big" ><b>Title:</b> ${blog.getBulletinSubject()}</span>
										</div>
										<br/>
										<br/>
										<div class="text-center">
											<p>${blog.getMessage()}</p>
										</div>
										<hr>
									</c:if>
									
								</c:forEach>
						    </div>
						  </div>

						</div>
						
						<!-- Left and right controls -->
						<a class="left carousel-control" href="#announcementCarousel" role="button" data-slide="prev">
						  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						  <span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#announcementCarousel" role="button" data-slide="next">
						  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						  <span class="sr-only">Next</span>
						</a>
						
					</div>
				</div>
					
					
			</div>
		</section>
		<!-- ABOUT-->
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
							<form id="contact-form" method="post" action="${pageContext.request.contextPath}/Employee" role="form">
								<div class="messages"></div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<!-- <label for="form_name">First Name</label> -->
              					<input id="form_name" type="text" name="firstName" class="form-control" placeholder="First name *" value="${employeeName.getFirstName()}" required="required" data-error="First name is required.">
            						<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<!-- <label for="form_lastname">Last Name</label> -->
              					<input id="form_lastname" type="text" name="lastName" class="form-control" placeholder="Last name *" value="${employeeName.getLastName()}" required="required" data-error="Last name is required.">
            						<div class="help-block with-errors"></div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<!-- <label for="form_message">Message</label> -->
              					<textarea id="form_message" name="thismessage" class="form-control" rows="8" placeholder="Message *" required="required" data-error="Email address is required." style="resize:none;"></textarea>
            						<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-lg-12">
											<input type="hidden" name="action" value="sendMessage">
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
						<a href="http://plv.edu.ph/" target="_blank">Pamantasan ng Lungsod ng Valenzuela</a>
						<span>&nbsp;&bull;&nbsp;</span>
						<a href="#" data-toggle="modal" data-target="#changeUserModal">Change password</a>
					</small>
					<small class="pull-left">
						
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
					<a class="btn btn-success" href="${pageContext.request.contextPath}/Employee?action=logout">Yes</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
		      </div>
		      <div class="modal-footer">
		        
		      </div>
		    </div>
		  </div>
		</div>
		
		<div id="changeUserModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Change Password</h4>
		      </div>
		      <div class="modal-body">
				<!--modal body-->
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/Employee" method="post" id="changeUser">
					<div class="form-group">
						<input class="form-control " type="password" name="oldPass" placeholder="Enter Old Password">
					</div>
					<div class="form-group">
						<input class="form-control " type="password" name="newPass" placeholder="Enter New Password">
					</div>
					<div class="form-group">
						<input class="form-control " type="password" name="newPass2" placeholder="Confirm New Password">
					</div>
					<input type="hidden" name="action" value="changePass">
					<input type="hidden" name="id" value="${employee.getId()}">
					</form>
		      </div>
		      <div class="modal-footer">
		        <button form="changeUser" type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Submit</button>
		      </div>
		    </div>
		  </div>
		</div>
	</body>
</html>