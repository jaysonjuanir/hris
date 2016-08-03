<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<c:set var="bulletin" value="${bulletin}" />
	
	
	<head>
		<title>Bulletin - Perfect Harmony</title>
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
							<a  href="${pageContext.request.contextPath}/Manager#contact">
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
		
		
		
		<section class="header hris-section" id="contact" >
			<c:forEach var = "err" items = "${errors}">
					<div class="column column-6"><h4 style="color:red">${err}</h4></div>
			</c:forEach>
			
			<div class="column column-6"><h4 style="color:green">${message}</h4></div>
			
			<div class="container">
				<div class="row">
		      <div class="col-md-12">
			      <h2><b>BULLETIN LIST</b></h2>
				  <a class="righButton" data-toggle="modal" data-target="#addBulletinModal">
					  Add Bulletin
				  </a>
			      <hr>
			      <div class="table-responsive">
	            <table id="mytable" class="table table-condensed table-bordered">
			          <theads>
			          	<tr>
	                 	<th class="col-md-3 text-center">Bulletin Type</th>
	                 	<th class="col-md-3 text-center">Bulletin Subject</th>
						<th class="col-md-3 text-center">Bulletin Message</th>
						<th class="col-md-3 text-center">Employee Name</th>
						<th class="col-md-3 text-center">Edit</th>
						<th class="col-md-3 text-center">Delete</th>
			          	</tr>
                </thead>
		  					<tbody>
							<c:forEach var="bul" items="${bulletin}">
				  				<tr>
								
									
									  <td class="col-md-3 text-center">${bul.getBulletinType()}</td>
									  <td class="col-md-3 text-center">${bul.getBulletinSubject()}</td>
									  <td class="col-md-3 text-center">${bul.getMessage()}</td>
									  <td class="col-md-3 text-center">${bul.getEmployeeName()}</td>
									  <td class="col-md-3 text-center"><p data-toggle="tooltip" title="Edit"><a  class="btn btn-success btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit${bul.getId()}" ><span class="glyphicon glyphicon-pencil"></span></a></p></td>
									  <td class="col-md-3 text-center"><p data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete${bul.getId()}" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
									  
									  <!--UPDATE EMPLOYEE MODAL-->
										<div id="edit${bul.getId()}" class="modal fade" role="dialog">
										  <div class="modal-dialog">
											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h4 class="modal-title custom_align" id="Heading">Add Employee</h4>
												</div>

												<!--modal body-->
												<div class="modal-body">
													<form action="${pageContext.request.contextPath}/Manager" method="post" id="update${bul.getId()}">
													<div class="form-group">
														<input class="form-control " type="text" name="bulletinType" placeholder="Bulletin Type" value="${bul.getBulletinType()}">
													</div>
													<div class="form-group">
														<input class="form-control " type="text" name="bulletinSubject" placeholder="Bulletin Subject" value="${bul.getBulletinSubject()}">
													</div>
													<div class="form-group">
														<input class="form-control " type="text" name="bulletinMessage" placeholder="Bulleting Message" value="${bul.getMessage()}">
													</div>
													<div class="form-group">
														<input class="form-control " type="text" name="employeeName" placeholder="Employee Name" value="${bul.getEmployeeName()}">
													</div>
													
													<input type="hidden" name="id" value="${bul.getId()}">
													<input type="hidden" name="action" value="updateBulletin">
													</form>
												</div>
												
												<!--modal footer-->
												<div class="modal-footer ">
												<button form = "update${bul.getId()}" type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Update Bulletin</button>
												</div>
											</div>
										  </div>
										</div>
									  
									  <!--DELETE MODAL-->
										  <div class="modal fade" id="delete${bul.getId()}" tabindex="-1" role="dialog" aria-labelledby="delete" aria-hidden="true">
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
													<form action="${pageContext.request.contextPath}/Manager" method="post" id="form${bul.getId()}">
													  <input type="hidden" name="id" value="${bul.getId()}"/><br/>
													  <input type="hidden" name="action" value="deleteBulletin"/><br/>
													</form>
													<button form="form${bul.getId()}" type="sumbit" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span>Yes</button>
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
					<small class="pull-right">Perfect Harmony. Sing your feelings &copy;2016</small>
					<small class="pull-left">
						<span class="glyphicon glyphicon-envelope"></span>
						<a href="">Pamantasan ng Lungsod ng Valenzuela</a>
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
		
		<div id="addBulletinModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title custom_align" id="Heading">Add Bulletin</h4>
				</div>

				<!--modal body-->
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/Manager" method="post" id="addBulletin${bul.getId()}">
					<div class="form-group">
						<input class="form-control " type="text" name="bulletinType" placeholder="Bulletin Type" value="${bul.getBulletinType()}">
					</div>
					<div class="form-group">
						<input class="form-control " type="text" name="bulletinSubject" placeholder="Bulletin Subject" value="${bul.getBulletinSubject()}">
					</div>
					<div class="form-group">
						<input class="form-control " type="text" name="bulletinMessage" placeholder="Bulleting Message" value="${bul.getMessage()}">
					</div>
					<div class="form-group">
						<input class="form-control " type="text" name="employeeName" placeholder="Employee Name" value="${emp.getName()}" readonly>
					</div>
					<input type="hidden" name="action" value="addBulletin">
					</form>
				</div>
				
				<!--modal footer-->
			<div class="modal-footer ">
				<button form="addBulletin" type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Add Employee</button>
				</div>
		    </div>
		  </div>
		</div>
		
	</body>
</html>