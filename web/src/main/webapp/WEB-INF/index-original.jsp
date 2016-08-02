<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.person.dto.*"%>
<%@ page import="com.person.model.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>


<html>
	<head>
		<title>Main Page</title>
	</head>
	<body>
		<div>
			<div class="row">
				<div class="column column-6" align="center">
					
					<table>
					
						<tr>
							<th>View</th>
							<th>Full Name</th>
							<th>Address</th>
							<th>Contact</th>
							<th>Position</th>
						</tr>
						
						<c:forEach var="employee" items="${employees}" >
							<c:set var="employeeId" value='${employee.getId()}' />
							<c:set var="employeeName" value='${employee.getName()}' />
							<c:set var="employeeAddress" value='${employee.getAddress()}' />
							<c:set var="employeePosition" value='${employee.getPosition()}' />
							<c:set var="employeeContact" value='${employee.getContact()}' />
							
							<tr>
								<td>
									<form class="buttons" action="${pageContext.request.contextPath}/PersonServlet" method="get">
										<input type="hidden" name="id" value = "${employeeId}"> 
										<input type="submit" value="Edit" />
									</form>
								</td>
								<td><c:out value="${employeeName}"/></td>
								<td><c:out value="${employeeAddress}"/></td>
								<td><c:out value="${employeeContact}"/></td>
								<td><c:out value="${employeePosition}"/></td>
							</tr>
						</c:forEach>
					</table>
				
				
				</div>
			</div>
			
		</div>
		
		<style>
			table {
				border-collapse: collapse;
				width:90%;
			}

			table, th, td {
				border: 1px solid black;
			}
			td{
				text-align:center;
			}
			.buttons{
				align-items: center;
				
			}
		</style>
	</body>
</html>