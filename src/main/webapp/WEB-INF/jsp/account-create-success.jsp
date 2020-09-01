<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>
	<body>
	
		<div class="container-fluid">
		
			<div class="row">			
				<%@ include file="fragments/topbar.jsp"%>				
			</div>
		
			<div class="row my-2">						
				<%@ include file="fragments/sidebar.jsp"%>				
				
				<div class="col-10">

					<h2>User registered successfully!</h2>
				
					<hr>
					
					<a href="${pageContext.request.contextPath}/login">Login with new user</a>
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