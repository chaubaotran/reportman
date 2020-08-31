<%@ page contentType="text/html;charset=UTF-8"%>
<%@	taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/report-create.css">
		<script src="https://kit.fontawesome.com/49bcf1dc87.js"></script>		
		<title>レポーマン</title>
	</head>
	
	<body>
	
		<div class="container-fluid">
		
			<div class="row">			
				<%@ include file="fragments/topbar.jsp"%>				
			</div>
		
			<div class="row my-2">						
				<%@ include file="fragments/sidebar.jsp"%>	
				
					

				<!-- Registration Form -->
				<form:form action="${pageContext.request.contextPath}/account/create/processing" 
					  	   modelAttribute="crmUser"
					  	   class="form-horizontal"
					  	   method="POST">

				    <!-- Place for messages: error, alert etc ... -->
				    <div class="form-group">
				        <div class="col-xs-15">
				            <div>
							
								<!-- Check for registration error -->
								<c:if test="${registrationError != null}">
							
									<div class="alert alert-danger col-xs-offset-1 col-xs-10">
										${registrationError}
									</div>
	
								</c:if>
																		
				            </div>
				        </div>
				    </div>
				    
				    <form:input path="id" type="hidden" />

					<!-- User name -->
					<div class="mb-4">
						<label>User name</label>
						<form:input path="userName" placeholder="username (*)" class="form-control" />
						<form:errors path="userName" cssClass="error" />
						
					</div>

					<!-- Password -->
					<div class="mb-4">
						<label>Password</label>
						<form:password path="password" placeholder="password (*)" class="form-control" />
						<form:errors path="password" cssClass="error" />
					</div>
					
					<!-- Confirm Password -->
					<div class="mb-4">
						<label>Confirm password</label>
						<form:password path="matchingPassword" placeholder="confirm password (*)" class="form-control" />
						<form:errors path="matchingPassword" cssClass="error" />
					</div>				
					
					<!-- First name -->
					<div class="mb-4">
						<label>First name</label>
						<form:input path="firstName" placeholder="first name (*)" class="form-control" />
						<form:errors path="firstName" cssClass="error" />
					</div>
					
					<!-- Last name -->
					<div class="mb-4">
						<label>Last name</label>
						<form:input path="lastName" placeholder="last name (*)" class="form-control" />
						<form:errors path="lastName" cssClass="error" />
					</div>
					
					<!-- Email -->
					<div class="mb-4">
						<label>Email</label>
						<form:input path="email" placeholder="email (*)" class="form-control" />
						<form:errors path="email" cssClass="error" />
					</div>
					
					<!-- Roles -->
					<div class="mb-4">
						<label>Roles</label>
						<br>
						<form:radiobuttons  items="${roles}" path="roles" class="mx-3" />
					</div>
	
					<!-- Register Button -->
					<div style="margin-top: 10px" class="form-group">						
						<div class="col-sm-6 controls">
							<button type="submit" class="btn btn-primary">Register</button>
						</div>
					</div>
					
				</form:form>
				
<%@ include file="fragments/footer.jsp"%>