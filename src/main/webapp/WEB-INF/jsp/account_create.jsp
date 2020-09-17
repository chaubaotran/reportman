<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>
	
	<div class="container-fluid">	
		
		<div class="row">			
			<%@ include file="fragments/topbar.jsp"%>				
		</div>		
		
		<div class="row main-frame">						
			<%@ include file="fragments/sidebar.jsp"%>	
			
			<div class="col-9 col-md-10 form-frame">			
				<!-- Registration Form -->
				<form:form action="${pageContext.request.contextPath}/account/create/processing" 
					  	   modelAttribute="crmUser"
					  	   class="form-horizontal"
					  	   method="POST">
					  	   
					<div class="d-flex">
						<h2><strong>アカウント新規作成</strong></h2>
					</div>	

				    <!-- Place for messages: error, alert etc ... -->
				    <div class="form-group mt-3">
			            <div>							
							<!-- Check for registration error -->
							<c:if test="${registrationError != null}">							
								<div class="alert alert-danger col-xs-offset-1 col-xs-10">
									${registrationError}
								</div>	
							</c:if>																		
			            </div>
				    </div>
				    
				    <form:input path="id" type="hidden" />

					<!-- User name -->
					<div class="mb-4">
						<label>User name <form:errors path="userName" cssClass="error" /></label>
						<form:input path="userName" placeholder="username (*)" class="form-control" />		
					</div>

					<!-- Password -->
					<div class="mb-4">
						<label>Password <form:errors path="password" cssClass="error" /></label>
						<form:password path="password" placeholder="password (*)" class="form-control" />						
					</div>
					
					<!-- Confirm Password -->
					<div class="mb-4">
						<label>Confirm password <form:errors path="matchingPassword" cssClass="error" /></label>
						<form:password path="matchingPassword" placeholder="confirm password (*)" class="form-control" />						
					</div>				
					
					<!-- First name -->
					<div class="mb-4">
						<label>First name <form:errors path="firstName" cssClass="error" /></label>
						<form:input path="firstName" placeholder="first name (*)" class="form-control" />						
					</div>
					
					<!-- Last name -->
					<div class="mb-4">
						<label>Last name <form:errors path="lastName" cssClass="error" /></label>
						<form:input path="lastName" placeholder="last name (*)" class="form-control" />						
					</div>
					
					<!-- Email -->
					<div class="mb-4">
						<label>Email <form:errors path="email" cssClass="error" /></label>
						<form:input path="email" placeholder="email (*)" class="form-control" />						
					</div>
					
					<!-- Roles -->
					<div class="mb-4">
						<label>Roles <form:errors path="roles" cssClass="error" /></label>
						<br>
						<form:radiobuttons  items="${roles}" path="roles" class="mx-3" />						
					</div>
	
					<!-- Register Button -->
					<div class="form-group">
						<button type="submit" class="btn btn-primary">Register</button>
					</div>
					
				</form:form>
			</div>
		</div>
	</div>
			
				
	<script>
		window.onload = function() {
			var path = window.location.pathname;
			var menu = document.querySelector(".drop-down-menu");
			var toggleBtn = document.querySelector(".toggle-btn");		
			var navLinks = Array.from(document.querySelectorAll(".nav-link"));
		
			
			/* Make sidebar active item stand out */
			navLinks.forEach(item => {
				if (item.getAttribute("href").startsWith(path)) {
					item.classList.add("active");
				} else {
					item.classList.remove("active");
				}
			})			
		
			/* Make drop down menu disappear when user clicks outside */
			document.addEventListener("click", function(e) {
				if (!menu.contains(e.target) && !toggleBtn.contains(e.target)) {
					menu.classList.remove("active");
				}			
			})
		}
		
		function toggleMenu() {
			var menu = document.querySelector(".drop-down-menu");
			menu.classList.toggle("active");
		}
	</script>
				
<%@ include file="fragments/footer.jsp"%>