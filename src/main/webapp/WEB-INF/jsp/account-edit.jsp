<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>
	
	<body>
	
		<div class="container-fluid">
		
			<div class="row">			
				<%@ include file="fragments/topbar.jsp"%>				
			</div>
		
			<div class="row my-2">						
				<%@ include file="fragments/sidebar.jsp"%>	
				
					

				<!-- Registration Form -->
				<form:form action="${pageContext.request.contextPath}/account/edit/processing" 
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
						<label>New password (old password is allowed)</label>
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
					<%-- <sec:authorize access="hasAnyRole('ADMIN')"> --%>
						<div class="mb-4">
							<label>Roles</label>
							<br>
							<form:radiobuttons items="${roles}" path="roles" class="mx-3 role" />
						</div>
					<%-- </sec:authorize> --%>
	
					<!-- Register Button -->
					<div class="form-group">
						<button type="submit" class="btn btn-primary">Change</button>
					</div>
					
				</form:form>
				
				<input id="authentication" type=hidden value="${authentication}" />
				
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
		
		if (document.querySelector("#authentication").value !== "[ROLE_ADMIN]") {
			document.querySelectorAll(".role").forEach(item => {
				if (!item.checked) {
					item.setAttribute("disabled", true);
				}
				
			});
			
		}
		
	}
	
	function toggleMenu() {
		var menu = document.querySelector(".drop-down-menu");
		menu.classList.toggle("active");
	}
</script>
				
<%@ include file="fragments/footer.jsp"%>