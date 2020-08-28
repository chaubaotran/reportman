<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta content="text/html; charset=UTF-8"/>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<title>reportman</title>
	</head>
	
	<body>

	    <div class="container">    		    	
	    	<div class="row">
	    		<div class="col col-6">
	    			<h2>Log in</h2>
		    
			    	<form action="${contextPath}/authenticateTheUser" method="POST">
			    	
			    		<!-- Place for messages: error, alert etc ... -->
					    <div class="form-group">
					        <div class="col-xs-15">
					            <div>						
									<!-- Check for login error -->						
									<c:if test="${param.error != null}">								
										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											Invalid email and password.
										</div>
									</c:if>
										
									<!-- Check for logout -->
									<c:if test="${param.logout != null}">								            
										<div class="alert alert-success col-xs-offset-1 col-xs-10">
											You have been logged out.
										</div>						    
									</c:if>							
					            </div>
					        </div>
					    </div>
			            
			            <!-- Login form ... -->        
						<div class="form-group">
							<label>Email address</label>
							<input type="email" class="form-control" name="email">
						</div>
						
						<div class="form-group">
							<label>Password</label>
							<input type="password" class="form-control" name="password">
						</div>
						
						<input type="hidden"
							   name="${_csrf.parameterName}"
							   value="${_csrf.token}" />
						
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>	    	
	    		</div>
	    	</div>      
	    </div>

		<script src="webjars/jquery/3.5.1/jquery.min.js"></script>
		<script src="webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>		
		<script src="webjars/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
	</body>
</html>

