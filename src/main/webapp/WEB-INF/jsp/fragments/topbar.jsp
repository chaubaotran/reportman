<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="../../resources/css/topbar.css">

<nav class="navbar top-bar">

	<a class="navbar-brand" href="#">レポーマン</a>
	
	<div class="toggle-btn">
		<span onclick="toggleMenu()"><i class="fas fa-bars"></i></span>
	</div>
	
	<div class="drop-down-menu mr-2">
		<nav class="nav flex-column">
			<a class="nav-link" href="${pageContext.request.contextPath}/account/edit/?id=${user.id}">アカウント編集</a>
			<form:form action="${pageContext.request.contextPath}/logout" 
			method="POST">
				<input type="submit" value="ログアウト" class="logout-link" />										
			</form:form>		  
		</nav>
	</div>		
	
</nav>			

<script>

	var menu = document.querySelector(".drop-down-menu");
	var toggleBtn = document.querySelector(".toggle-btn");
	
	function toggleMenu() {
		menu.classList.toggle("active");
	}
	
	document.addEventListener("click", function(e) {
		if (!menu.contains(e.target) && !toggleBtn.contains(e.target)) {
			menu.classList.remove("active");
		}			
	})
	
	
</script>	