<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<nav class="navbar">
	<a class="navbar-brand" href="#">Navbar</a>
	<span class="toggle-btn" onclick="toggleMenu()"><i class="fas fa-bars"></i></span>
		<div class="drop-down-menu">
			<nav class="nav flex-column">
				<a class="nav-link" href="${pageContext.request.contextPath}/account/edit/?id=${user.id}">アカウント編集</a>

			</nav>
		</div>	
</nav>			

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
</script>	