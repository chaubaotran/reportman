<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
		
		<script src="https://kit.fontawesome.com/49bcf1dc87.js"></script>
		
		<title>reportman</title>
	</head>
	
	<body>

	<h2>Access Denied - You are not authorized to access this resource.</h2>

	<hr>
	
	<a href="${pageContext.request.contextPath}/login">Login with different account or</a>
	
	<button onclick="goBack()">Go back to previous page</button>

	<script>
		function goBack() {
		  window.history.back();
		}
	</script>
	
	<script src="webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="webjars/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
	</body>
</html>