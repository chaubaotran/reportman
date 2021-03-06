<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>

    <div class="container">    		    	
    	<div class="row">
    		<div class="col mt-5 form-frame">   			
	    
		    	<form class="mx-auto" style="max-width: 400px;" action="${contextPath}/authenticateTheUser" method="POST">
		    		<h2>Log in</h2>		    	
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
							<div class="alert alert-primary col-xs-offset-1 col-xs-10">
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
					
					<div class="mt-3">
						<a href="${contextPath}/account/new">Create new account</a> 	
					</div>	
				</form>
					   
							
    		</div>
    	</div>      
    </div>

				
<%@ include file="fragments/footer.jsp"%>

