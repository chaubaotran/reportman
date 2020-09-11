<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>
	
	<div class="container-fluid">
		<div class="d-flex flex-column justify-content-center text-center mt-5">		
			<h3>Access Denied - You are not authorized to access this resource.</h3>
			
			<a href="${pageContext.request.contextPath}/login" style="text-decoration: none; color: #000;">Login with different account</a>		
			
			<button onclick="goBack()" style="border: none; background: none; padding: 0;">Go back to previous page</button>		
		</div>	
	</div>
	
	<script>
		function goBack() {
		  window.history.back();
		}
	</script>

<%@ include file="fragments/footer.jsp"%>