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
					<a  class="pull-left header-link" href="${pageContext.request.contextPath}/Manager">
						<img class="header-logo" src="images/header-icon1.png">
					</a>
				</div>

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="hidden active">
							<a data-scroll href="#page-top"></a>
						</li>
						<li>
							<a  href="${pageContext.request.contextPath}/Manager">
								<span>Home</span>
							</a>
						</li>
						<li>
							<a  href="${pageContext.request.contextPath}/Manager#bulletin">
								<span>Bulletin</span>
							</a>
						</li>
						<li>
							<a  href="${pageContext.request.contextPath}/Manager#about">
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
		
		
		
		<section class="header hris-section" id="contact" >
			<c:forEach var = "err" items = "${errors}">
					<div class="column column-6"><h4 style="color:red">${err}</h4></div>
			</c:forEach>
			
			<div class="column column-6"><h4 style="color:green">${message}</h4></div>
			
			<div class="container">
				<div class="row">
		      <div class="col-md-12">
			      <h2><b>EMPLOYEE LIST</b></h2>
				  <a class="righButton" data-toggle="modal" data-target="#addEmployeeModal">
					  Add Employee
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
						  <th class="col-md-3 text-center">Edit</th>
						<th class="col-md-3 text-center">Delete</th>
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
									  <td class="col-md-3 text-center"><p data-toggle="tooltip" title="Edit"><a  class="btn btn-success btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit${emp.getId()}" ><span class="glyphicon glyphicon-pencil"></span></a></p></td>
									  <td class="col-md-3 text-center"><p data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete${emp.getId()}" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
									  
									  <!--UPDATE EMPLOYEE MODAL-->
										<div id="edit${emp.getId()}" class="modal fade" role="dialog">
										  <div class="modal-dialog">
											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h4 class="modal-title custom_align" id="Heading">Add Employee</h4>
												</div>

												<!--modal body-->
												<div class="modal-body">
													<form action="${pageContext.request.contextPath}/Manager" method="post" id="update${emp.getId()}">
													<div class="form-group">
														<input class="form-control " type="text" name="firstName" placeholder="First Name" value="${emp.getName().getFirstName()}">
													</div>
													<div class="form-group">
														<input class="form-control " type="text" name="middleName" placeholder="Middle Name" value="${emp.getName().getMiddleName()}">
													</div>
													<div class="form-group">
														<input class="form-control " type="text" name="lastName" placeholder="Surname" value="${emp.getName().getLastName()}">
													</div>
													<div class="form-group">
														<input class="form-control " type="text" name="streetName" placeholder="Street Name" value="${emp.getAddress().getStreetName()}">
													</div>
													<div class="form-group">
														<input class="form-control " type="text" name="barangay" placeholder="Barangay" value="${emp.getAddress().getBarangay()}">
													</div>
													<div class="form-group">
														<input class="form-control " type="text" name="city" placeholder="City" value="${emp.getAddress().getCity()}">
													</div>
													<div class="form-group">
														<input class="form-control " type="text" name="contact" placeholder="Contact" value="${emp.getContact()}">
													</div>
													<div class="form-group">
														<input class="form-control " type="text" name="position" placeholder="Position" value="${emp.getPosition()}">
													</div>
													<input type="hidden" name="id" value="${emp.getId()}">
													<input type="hidden" name="action" value="update">
													</form>
												</div>
												
												<!--modal footer-->
												<div class="modal-footer ">
												<button form = "update${emp.getId()}" type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Add Employee</button>
												</div>
											</div>
										  </div>
										</div>
									  
									  <!--DELETE MODAL-->
										  <div class="modal fade" id="delete${emp.getId()}" tabindex="-1" role="dialog" aria-labelledby="delete" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<!--modal header-->
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
													<h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
													</div>
													<!--modal body-->
												<div class="modal-body">
														<div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
													</div>
													<!--modal footer-->
												  <div class="modal-footer ">
													<form action="${pageContext.request.contextPath}/Manager" method="post" id="form${emp.getId()}">
													  <input type="hidden" name="id" value="${emp.getId()}"/><br>
													  <input type="hidden" name="action" value="delete"/><br>
													</form>
													<button form="form${emp.getId()}" type="sumbit" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span>Yes</button>
													<button  type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>No</button>
													</div>
											  </div><!-- end of modal-content --> 
												</div> <!-- end of modal-dialog --> 
										  </div> <!-- end of modal --> 
									
				  				</tr>
								</c:forEach>
			  				</tbody>      
							</table>
							<div class="clearfix"></div>
	          </div> <!--end of div table-->
		      </div> <!--end of column-->
				</div> <!--end of row-->
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
			</div> <!--end of container-->
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
		<div id="addEmployeeModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title custom_align" id="Heading">Add Employee</h4>
				</div>

				<!--modal body-->
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/Manager" method="post" id="addEmployee">
					<div class="form-group">
						<input class="form-control " type="text" name="firstName" placeholder="First Name" value="${emp.getName().getFirstName()}">
					</div>
					<div class="form-group">
						<input class="form-control " type="text" name="middleName" placeholder="Middle Name" value="${emp.getName().getMiddleName()}">
					</div>
					<div class="form-group">
						<input class="form-control " type="text" name="lastName" placeholder="Surname" value="${emp.getName().getLastName()}">
					</div>
					<div class="form-group">
						<input class="form-control " type="text" name="streetName" placeholder="Street Name" value="${emp.getAddress().getStreetName()}">
					</div>
					<div class="form-group">
						<input class="form-control " type="text" name="barangay" placeholder="Barangay" value="${emp.getAddress().getBarangay()}">
					</div>
					<div class="form-group">
						<input class="form-control " type="text" name="city" placeholder="City" value="${emp.getAddress().getCity()}">
					</div>
					<div class="form-group">
						<input class="form-control " type="text" name="contact" placeholder="Contact" value="${emp.getContact()}">
					</div>
					<div class="form-group">
						<input class="form-control " type="text" name="position" placeholder="Position" value="${emp.getPosition()}">
					</div>
					
					
					<h4 class="modal-title custom_align" id="Heading">Username and Password</h4>
					<div class="form-group">
						<input class="form-control " type="text" name="username" placeholder="Username" value="${emp.getName().getFirstName()}">
					</div>
					<div class="form-group">
						<input class="form-control " type="password" name="password" placeholder="Password" value="${emp.getName().getFirstName()}">
					</div>
					<div class="form-group">
						<input class="form-control " type="password" name="password2" placeholder="Repeat Password" value="${emp.getName().getFirstName()}">
					</div>
					<input type="hidden" name="action" value="add">
					</form>
				</div>
				
				<!--modal footer-->
				<div class="modal-footer ">
				<button form="addEmployee" type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Add Employee</button>
				</div>
		    </div>
		  </div>
		</div>
		
	</body>
</html>