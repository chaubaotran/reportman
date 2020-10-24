<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>

	<div class="container-fluid">		
		<div class="row">			
			<%@ include file="fragments/topbar.jsp"%>				
		</div>
		
		<div class="row main-frame">						
			<%@ include file="fragments/sidebar.jsp"%>				
			
			<div class="col-9 col-md-10">			
				<div class="d-flex" style="max-width: 800px;">
					<h2><strong>List of employees (研修生一覧)</strong></h2>			
					
					<form class="search-form ml-auto" action="${contextPath}/employee/find" method="GET">
						<input type="text" name="userName" class="form-control form-control-sm" placeholder="User name">
						<button type="submit" class="btn btn-sm"><i class="fas fa-search"></i></button>
					</form>
				</div>	
				
				<div class="table-wrapper-scroll-y my-custom-scrollbar mt-3">
					<p style="color: red">* Employee with unread reports is printed red (未確認日報が有する研修生は赤字で表示されます)</p>					
					
					<table class="table table-hover mt-4">
						<thead>
							<tr>
								<th style="width: 25%;">Name (名前)</th>
								<th style="width: 25%;">Reports number (日報数)</th>
								<th style="width: 25%;">Unread number (未確認数)</th>
								<th style="width: 25%;"><i class="fas fa-cogs"></i></th>
							</tr>	
						</thead>
							
					    <tbody>					    
						    <c:choose>
						    	<c:when test="${employees != null && employees.size() != 0}">					    	
								    <c:forEach items="${employees}" var="employee">
										<c:url var="report" value="${pageContext.request.contextPath}/employee/report/list">
											<c:param name="id" value="${employee.id}" />	
											<c:param name="empName" value="${employee.userName}" />						
										</c:url>
										
										<c:url var="reportMonthStatus" value="${pageContext.request.contextPath}/employee/report/month/status">
											<c:param name="id" value="${employee.id}" />		
											<c:param name="empName" value="${employee.userName}" />					
										</c:url>
										
									<tr  <c:if test="${employee.unreadNumber > 0}">style="color: red"</c:if>>
										<td><c:out value="${employee.userName}" /></td>
										<td><c:out value="${employee.reportNumber}" /></td>
										<td><c:out value="${employee.unreadNumber}" /></td>
										<td>
											<a <c:if test="${employee.unreadNumber > 0}">style="color: red"</c:if> href="${report}">View reports list</a>
											<br />
											<a <c:if test="${employee.unreadNumber > 0}">style="color: red"</c:if> href="${reportMonthStatus}">View monhly status</a>
										</td>
									</tr>
									</c:forEach>	
								</c:when>	
							</c:choose>
					    </tbody>							   
					</table>
					
					<c:if test="${message != null}">
						<p>${message}</p>
					</c:if> 
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
