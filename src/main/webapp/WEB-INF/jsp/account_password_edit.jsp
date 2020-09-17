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
				<form:form style="max-width: 400px;" action="${pageContext.request.contextPath}/account/password/edit/processing" 
					  	   modelAttribute="crmUser"
					  	   class="form-horizontal"
					  	   method="POST">
					
					<div class="d-flex">
						<h2><strong>アカウント変更</strong></h2>
					</div>	

				    <!-- Place for messages: error, alert etc ... -->
				    <div class="form-group">
				        <div class="col-xs-15">
				            <div>							
								<!-- Check for registration error -->
								<c:if test="${errorMessage != null}">							
									<div class="alert alert-danger col-xs-offset-1 col-xs-10">
										${errorMessage}
									</div>	
								</c:if>								
								<c:if test="${successMessage != null}">
							
									<div class="alert alert-success col-xs-offset-1 col-xs-10">
										${successMessage}
									</div>	
								</c:if>																		
				            </div>
				        </div>
				    </div>
				    
				    <form:input path="id" type="hidden" />

					<!-- Old password -->
					<div class="mb-4">
						<label>現在パスワード</label>
						<form:errors path="currentPassword" cssClass="error" />	
						<form:password path="currentPassword" placeholder="current password (*)" class="form-control" />												
					</div>	
					
					<!-- New password -->
					<div class="mb-4">
						<label>新しいパスワード</label>
						<form:errors path="newPassword" cssClass="error" />
						<form:password path="newPassword" placeholder="new password (*)" class="form-control" />													
					</div>	
					
					<!-- Matching password -->
					<div class="mb-4">
						<label>確認</label>
						<form:errors path="matchingPassword" cssClass="error" />
						<form:password path="matchingPassword" placeholder="new password again (*)" class="form-control" />													
					</div>			
							
					<!-- Register Button -->
					<div class="form-group">
						<button type="submit" class="btn btn-primary">変更</button>
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