<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta content="text/html; charset=UTF-8"/>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
		
		<title>レポーマン</title>
	</head>
	
	<body>

	    <div class="container">    		    	
	    	<div class="row">
	    		<div class="col mt-5">
	    			<h2>Log in</h2>
		    
			    	<form action="${contextPath}/authenticateTheUser" method="POST">
			    	
			    		<!-- Place for messages: error, alert etc ... -->
					    <div class="form-group">					
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

		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	</body>
</html>

