<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../resources/css/header.css">
		
		<script src="https://kit.fontawesome.com/49bcf1dc87.js"></script>
		
		<title>reportman</title>
	</head>
	
	<body>
	
		<div class="container-fluid">
			<div class="row">
				<nav class="navbar">
					<a class="navbar-brand" href="#">Navbar</a>
					<span class="toggle-btn" onclick="toggleMenu()"><i class="fas fa-bars"></i></span>
					<div class="drop-down-menu">
						<nav class="nav flex-column">
						  <a class="nav-link" href="${pageContext.request.contextPath}/account/edit/?id=${user.id}">アカウント編集</a>
						  <form:form action="${pageContext.request.contextPath}/logout" 
									   method="POST">
								<input type="submit" value="ログアウト" />										
						</form:form>
						  
						</nav>
					</div>
					
				</nav>				
			</div>
			<div class="row">		
				<div class="col-1">
					<ul class="nav flex-column horizontal-bar">
						<li class="nav-item">
							<a class="nav-link pl-0" href="${pageContext.request.contextPath}/report/create">新規作成</a>
						</li>
						<li class="nav-item">
							<a class="nav-link pl-0" href="${pageContext.request.contextPath}/report/list/?id=${user.id}">日報一覧</a>
						</li>
						<li class="nav-item">
							<a class="nav-link pl-0" href="${pageContext.request.contextPath}/employee/list">研修生一覧</a>
						</li>
					</ul>
				</div>		
			
<script>

function toggleMenu() {
	var menu = document.querySelector(".drop-down-menu");	
	if (menu.style.opacity === "1") {
		menu.style.display = "none";
		menu.style.opacity = "0";
	} else {
		menu.style.display = "block";
		menu.style.opacity = "1";
	}
}

console.log(document.querySelector(".drop-down-menu").style.opacity);
	

</script>
			