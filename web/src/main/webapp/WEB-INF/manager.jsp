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
			<div class="container" style="position: relative;top: 50%;left: 50%;transform: translateX(-50%) translateY(-50%);">
				<div class="row">
					<h2 class="text-left" style="margin-top:0px; color:black;">Welcome ${employeeName}</h2> 
				</div>
			</div>
		</section>
		
		<div class="container">
				<div class="row">
		      <div class="col-md-12">
			      <h2><b>EMPLOYEE LIST</b></h2>
				  <br/>
				  <a class="righButton" href="${pageContext.request.contextPath}/Manager?action=editEmployee" role="button">
					  Edit Employee
				  </a>
			      <hr>
			      <div class="table-responsive">
	            <table id="mytable" class="table table-condensed table-bordered">
			          <theads>
			          	<tr>
	                 	<th class="col-md-3 text-center">First Name</th>
	                 	<th class="col-md-3 text-center">Middle Name</th>
						  <th class="col-md-3 text-center">Last Name</th>
						  <th class="col-md-3 text-center">Address</th>
						  <th class="col-md-3 text-center">Contact</th>
						  <th class="col-md-3 text-center">Position</th>
			          	</tr>
                </thead>
		  					<tbody>
							<c:forEach var="emp" items="${employees}">
				  				<tr>
								
									
									  <td class="col-md-3 text-center">${emp.getName().getFirstName()}</td>
									  <td class="col-md-3 text-center">${emp.getName().getMiddleName()}</td>
									  <td class="col-md-3 text-center">${emp.getName().getLastName()}</td>
									  <td class="col-md-3 text-center">${emp.getAddress()}</td>
									  <td class="col-md-3 text-center">${emp.getContact()}</td>
									  <td class="col-md-3 text-center">${emp.getPosition()}</td>
				  				</tr>
								</c:forEach>
			  				</tbody>      
							</table>
							<div class="clearfix"></div>
	          </div> <!--end of div table-->
		      </div> <!--end of column-->
				</div> <!--end of row-->
			</div> <!--end of container-->
		
		
		<!-- BULLETIN -->
		<section id="bulletin" class="hris-section">
			<div class="container" id="offset-top">
				<div class="row">
				<div class="col-md-12">
					<h2><b>Bulletin</b></h2>
					<br/>
					<a class="righButton" href="${pageContext.request.contextPath}/Manager?action=editBulletin" role="button" data-slide="prev" >
					  Edit Bulletin
					</a>
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
					
			</div>
		</section>
		
		<div class="container">
				<div class="row">
		      <div class="col-md-12">
			      <h2><b>MESSAGE LIST</b></h2>
				  <br/>
				  
			      <hr>
			      <div class="table-responsive">
	            <table id="mytable" class="table table-condensed table-bordered">
			          <theads>
			          	<tr>
	                 	<th class="col-md-3 text-center">Sender</th>
	                 	<th class="col-md-3 text-center">Message</th>
			          	</tr>
                </thead>
		  					<tbody>
							<c:forEach var="msg" items="${messages}">
				  				<tr>
								
									
									  <td class="col-md-3 text-center">${msg.getSender()}</td>
									  <td class="col-md-3 text-center">${msg.getMessage()}</td>
				  				</tr>
								</c:forEach>
			  				</tbody>      
							</table>
							<div class="clearfix"></div>
	          </div> <!--end of div table-->
		      </div> <!--end of column-->
				</div> <!--end of row-->
			</div> <!--end of container-->
		
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
					<p>To provide a place for customer's satisfaction by giving them a high quality of entertainment while founding a triumph relationship to our beloved customers</p>
				</div>
				

				<div class="row">
					<hr>
				</div>
				<div class="row">
					<small class="pull-right">Perfect Harmony. Sing your feelings &copy; 2016</small>
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
					<a class="btn btn-success" href="${pageContext.request.contextPath}/Manager?action=logout">Yes</a>
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
							<form action="${pageContext.request.contextPath}/Manager" method="post" id="changeUser">
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
					</div>
					<div class="modal-footer">
					<button form="changeUser" type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Submit</button>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>