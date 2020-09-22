<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>
	
	<div class="container">		
		<div class="row mt-4">										
			<div class="col form-frame">			
				<!-- Registration Form -->
				<form:form action="${pageContext.request.contextPath}/account/new/processing" 
					  	   modelAttribute="crmUser"
					  	   class="form-horizontal mx-auto"
					  	   method="POST">
					  	   
					<div class="d-flex">
						<h2><strong>アカウント新規作成</strong></h2>
					</div>	
	
				    <!-- Place for messages: error, alert etc ... -->
				    <div class="form-group mt-3">
			            <div>							
							<!-- Check for registration error -->
							<c:if test="${registrationError != null}">							
								<div class="alert alert-danger">
									${registrationError}
								</div>	
							</c:if>		
							
							<c:if test="${successMessage != null}">							
								<div class="alert alert-success">
									${successMessage}
								</div>	
								
							</c:if>																		
			            </div>
				    </div>
				    
				    <form:input path="id" type="hidden" />
	
					<!-- User name -->
					<div class="mb-4">
						<label>ユーザー名<form:errors path="userName" cssClass="error" /></label>
						<form:input path="userName" placeholder="username (*)" class="form-control" />		
					</div>
	
					<!-- Password -->
					<div class="mb-4">
						<label>パスワード<form:errors path="password" cssClass="error" /></label>
						<form:password path="password" placeholder="password (*)" class="form-control" />						
					</div>
					
					<!-- Confirm Password -->
					<div class="mb-4">
						<label>確認<form:errors path="matchingPassword" cssClass="error" /></label>
						<form:password path="matchingPassword" placeholder="confirm password (*)" class="form-control" />						
					</div>				
					
					<!-- First name -->
					<div class="mb-4">
						<label>ファーストネーム<form:errors path="firstName" cssClass="error" /></label>
						<form:input path="firstName" placeholder="first name (*)" class="form-control" />						
					</div>
					
					<!-- Last name -->
					<div class="mb-4">
						<label>ラストネーム<form:errors path="lastName" cssClass="error" /></label>
						<form:input path="lastName" placeholder="last name (*)" class="form-control" />						
					</div>
					
					<!-- Email -->
					<div class="mb-4">
						<label>メール<form:errors path="email" cssClass="error" /></label>
						<form:input path="email" placeholder="email (*)" class="form-control" />						
					</div>
					
					<!-- Roles -->
					<div class="mb-4">
						<label>権限<form:errors path="roles" cssClass="error" /></label>
						<br>
						<form:radiobuttons  items="${roles}" path="roles" class="mx-3" />						
					</div>
	
					<!-- Register Button -->
					<div class="form-group">
						<button type="submit" class="btn btn-primary">登録</button>
					</div>
				</form:form>
				
				<div class="mt-3 mx-auto" style="max-width: 800px;">
					<a href="${pageContext.request.contextPath}/login"><i class="fas fa-arrow-circle-left mr-2"></i>ログイン画面へ</a>
				</div>					
			</div>
		</div>
	</div>
				
<%@ include file="fragments/footer.jsp"%>