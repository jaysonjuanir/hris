<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.person.dto.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>


<html>
	<head>
		<title>Person</title>
	</head>
	<body>
		<div>
			<div class="row">
				
				<c:forEach var = "err" items = "${errors}">
					<div class="column column-6"><span style="color:red">${err}</span></div>
				</c:forEach>
				
				<c:set var="person" value="${person}"/>
				<c:set var="name" value="${person.getName()}"/>
				<c:set var="address" value="${person.getAddress()}"/>
				<form action="${pageContext.request.contextPath}/MainPage" method="post">
				<input type="hidden" name="personId" value="${person.id}">
				<fmt:formatDate pattern="MM/dd/yyy" value="${person.birthday}" var="birthday"/>
				<fmt:formatDate pattern="MM/dd/yyy" value="${person.date_hired}" var="date_hired"/>
				<div class="column column-6" align="center">
					<fieldset style="padding:1%">
						<legend>Full Name:</legend>
						<table>
							<div>
								<tr>
									<td>
										<span class="required">*</span></div>First Name:
									</td>
									<td>
										<input type="text" name="firstName" value="${name.person_first_name}">
									</td>
								</tr>
								
								<tr>
									<td>
										<span class="required">*</span></div>Middle Name:
									</td>
									<td>
										<input type="text" name="middleName" value="${name.person_middle_name}">
									</td>
								</tr>
								<tr>
									<td>
										<span class="required">*</span></div>Last Name:
									</td>
									<td>
										<input type="text" name="lastName" value="${name.person_last_name}">
									</td>
								</tr>
								<tr>
									<td>
										Suffix:
									</td>
									<td>
										<input type="text" name="suffix" value="${name.person_suffix}">
									</td>
								</tr>
								<tr>
									<td>
										Title:
									</td>
									<td>
										<input type="text" name="title" value="${name.person_title}">							
									</td>
								</tr>
							
							</div>
						</table>
					</fieldset>
				</div>
				
				<div class="column column-6" align="center">
					<fieldset style="padding:1%">
						<legend>Other Information:</legend>
						<table>
							<div>
								<tr>
									<td>
										<span class="required">*</span></div>Birthday
									</td>
									<td>
										<input type="text" name="birthday" value="${birthday}" placeholder="12/30/1900">
									</td>
								</tr>
								
								<tr>
									<td>
										<span class="required">*</span>Employed:
									</td>
									<td>
										<input type="radio" name="employed" value="yes" ${person.getEmployed() ? 'checked' : ''}> Yes
										<input type="radio" name="employed" value="no" ${person.getEmployed() ? '' : 'checked'}> Not Employed
										
									</td>
									
								</tr>
								<tr>
									<td>
										Date Hired:
									</td>
									<td>
										<input type="text" name="dateHired" value="${date_hired}" placeholder="12/30/1900"><span class="required">*(if employed)</span>
									</td>
								</tr>
								<tr>
									<td>
										Roles:
									</td>
									<td>
									
										<c:set var="devChecked" value=""/>
										<c:set var="qaChecked" value=""/>
										<c:set var="baChecked" value=""/>
										
										<c:forEach var="role" items="${person.roles}">
											<c:if test="${role.role_type.equals('dev')}">
												<c:set var="devChecked" value="checked"/>
											</c:if>
											<c:if test="${role.role_type.equals('ba')}">
												<c:set var="baChecked" value="checked"/>
											</c:if>
											<c:if test="${role.role_type.equals('qa')}">
												<c:set var="qaChecked" value="checked"/>
											</c:if>
										</c:forEach>
										<input type="checkbox" name="role" value="dev" ${devChecked}/>
										Developer:<br/>
										<input type="checkbox" name="role" value="qa" ${qaChecked}/>
										Quality Assurance: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="required">*(if employed)</span><br/>
										<input type="checkbox" name="role" value="ba" ${baChecked}/>
										Business Analyst:
										
									</td>
								</tr>
								<tr>
									<td>
										<span class="required">*</span></div>GWA:
									</td>
									<td>
										<input type="text" name="gwa" value="${person.person_GWA}">
									</td>
								</tr>
								<tr>
									<td>
										Gender:
									</td>
									<td>
										<c:set var="isMale" value=""/>
										<c:set var="isFeMale" value=""/>
										<c:choose>
											<c:when test="${person.gender.toString().equals('FEMALE')}">
												<c:set var="isMale" value=""/>
												<c:set var="isFeMale" value="checked"/>
											</c:when>
											<c:otherwise>
												<c:set var="isMale" value="checked"/>
												<c:set var="isFeMale" value=""/>
											</c:otherwise>
										</c:choose>
										<input type="radio" name="gender" value="male" ${isMale}> Male 
										<input type="radio" name="gender" value="female" ${isFeMale}> female
									</td>
								</tr>
							</div>
						</table>
					</fieldset>
				</div>
				
				<div class="column column-6" align="center">
					<fieldset style="padding:1%">
						<legend>Address:</legend>
						<table>
							<div>
								<tr>
									<td>
										<span class="required">*</span></div>Street Number:
									</td>
									<td>
										<input type="text" name="streetNumber" value="${address.address_street_number}">
									</td>
								</tr>
								<tr>
									<td>
										<span class="required">*</span></div>Barangay:
									</td>
									<td>
										<input type="text" name="barangay" value="${address.address_barangay}">
									</td>
								</tr>
								<tr>
									<td>
										<span class="required">*</span></div>City:
									</td>
									<td>
										<input type="text" name="city" value="${address.address_city}">
									</td>
								</tr>
								<tr>
									<td>
										<span class="required">*</span></div>Zipcode:
									</td>
									<td>
										<input type="text" name="zipcode" value="${address.address_zipcode}">
									</td>
								</tr>
							</div>
						</table>
					</fieldset>
				</div>
				
				
				<div class="column column-6" align="center">
					<fieldset style="padding:1%">
						<legend>Contact:</legend>
						<table>
							<div>
								<c:set var="emailChecked" value=""/>
								<c:set var="mobileChecked" value=""/>
								<c:set var="landlineChecked" value=""/>
								<c:set var="emailValue" value=""/>
								<c:set var="mobileValue" value=""/>
								<c:set var="landlineValue" value=""/>
								<c:set var="emailid" value=""/>
								<c:set var="mobileid" value=""/>
								<c:set var="landlineid" value=""/>
								
								<c:forEach var="contact" items="${person.getPerson_contact()}">
								
									<c:if test="${contact.contact_type=='email'}">
										<c:set var="emailChecked" value="checked"/>
										<c:set var="emailValue" value="${contact.contact_value}"/>
										<c:set var="emailid" value="${contact.id}"/>
									</c:if>
									<c:if test="${contact.contact_type=='mobile'}">
										<c:set var="mobileChecked" value="checked"/>
										<c:set var="mobileValue" value="${contact.contact_value}"/>
										<c:set var="mobileid" value="${contact.id}"/>
									</c:if>
									<c:if test="${contact.contact_type=='landline'}">
										<c:set var="landlineChecked" value="checked"/>
										<c:set var="landlineValue" value="${contact.contact_value}"/>
										<c:set var="landlineid" value="${contact.id}"/>
									</c:if>
								</c:forEach>
								<tr>
									<td>
										<input type="checkbox" onclick="document.getElementById('email').disabled=!this.checked;" name="contacts" value="email"  ${emailChecked}/>
									</td>
									<td>
										E-mail:
									</td>
									<td>
										<input type="hidden" name="emailId" value="${emailid}">
										<input type="text" name="email" id = "email"  value="${emailValue}">
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" onclick="document.getElementById('mobile').disabled=!this.checked;" name="contacts" value="mobile" ${mobileChecked}/>
									</td>
									<td>
										Mobile:
									</td>
									<td>
										<input type="hidden" name="mobileId" value="${mobileid}">
										<input type="text" name="mobile" id = "mobile" value="${mobileValue}" >
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" onclick="document.getElementById('landline').disabled=!this.checked;" name="contacts" value="landline" ${landlineChecked}/>
									</td>
									<td>
										Landline:
									</td>
									<td>
										<input type="hidden" name="landlineId" value="${landlineid}">
										<input type="text" name="landline" id="landline" value="${landlineValue}" >
									</td>
								</tr>
							</div>
						</table>
					</fieldset>
				</div>
				<div align = "center">
					<c:choose>
						<c:when test="${empty id}">
							<input type="submit" value="add" align= "center"/>
						</c:when>
						<c:otherwise>
							<input type="submit" value="save" align= "center"/>
						</c:otherwise>
					</c:choose>
				 
				</div>
				</form>
				<div align = "center">
				<form action="${pageContext.request.contextPath}/MainPage" method="get">
				 <input type="submit" value="cancel" align= "center"/>
				</form>
				</div>
				
			</div>
			
		</div>
		
		<style>
			.required{
			color:red;
		}
		</style>
	</body>
</html>