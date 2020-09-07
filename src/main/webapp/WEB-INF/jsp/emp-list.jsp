<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>
	
	<body>
	
		<div class="container-fluid">
		
			<div class="row">			
				<%@ include file="fragments/topbar.jsp"%>				
			</div>
		
			<div class="row my-2">						
				<%@ include file="fragments/sidebar.jsp"%>				
				
				<div class="col-10 report-create">			
					<div class="d-flex">
						<h3><strong>研修生一覧</strong></h3>
					</div>	
					<div class="table-wrapper-scroll-y my-custom-scrollbar">					
						<table class="table table-hover mt-4">
							<thead>
								<tr>
									<th>名前</th>
									<th><i class="fas fa-cogs"></i></th>
								</tr>	
							</thead>
								
						    <tbody>
							    <c:forEach items="${employees}" var="employee">
									<c:url var="report" value="${pageContext.request.contextPath}/employee/report/list">
									<c:param name="id" value="${employee.id}" />	
									<c:param name="empName" value="${employee.userName}" />						
								</c:url>
								<tr>
									<td><c:out value="${employee.userName}" /></td>
									<td>
										<a href="${report}">日報一覧</a>
									</td>
								</tr>
								</c:forEach>		
						    </tbody>							   
						</table>
					</div>
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
