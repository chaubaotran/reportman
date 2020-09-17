<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>
	
	<div class="container text-center mt-5">
			<h4>Access Denied - You are not authorized to access this resource.</h4>
			<a href="${pageContext.request.contextPath}/login">Login with different account</a>
			
			<span class="mx-2">|</span>
			
			<a href="javascript:history.back()">Back to previous page</a>
	</div>

<%@ include file="fragments/footer.jsp"%>