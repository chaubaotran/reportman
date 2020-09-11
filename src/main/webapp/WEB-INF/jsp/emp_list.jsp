<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>

	<div class="container-fluid">		
		<div class="row">			
			<%@ include file="fragments/topbar.jsp"%>				
		</div>
	
		<div class="row my-2">						
			<%@ include file="fragments/sidebar.jsp"%>				
			
			<div class="col-10">			
				<div class="d-flex">
					<h2><strong>研修生一覧</strong></h2>
				</div>	
				
				<div class="table-wrapper-scroll-y my-custom-scrollbar mt-5">
					<p　class="my-3" style="color: red">* 未確認日報が有する研修生は赤字で表示されます</p>					
					
					<table class="table table-hover mt-4">
						<thead>
							<tr>
								<th style="width: 25%;">名前</th>
								<th style="width: 25%;">日報数</th>
								<th style="width: 25%;">未確認数</th>
								<th style="width: 25%;"><i class="fas fa-cogs"></i></th>
							</tr>	
						</thead>
							
					    <tbody>
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
									<a <c:if test="${employee.unreadNumber > 0}">style="color: red"</c:if> href="${report}">日報一覧</a>
									<span class="mx-2">|</span>
									<a <c:if test="${employee.unreadNumber > 0}">style="color: red"</c:if> href="${reportMonthStatus}">毎月状況</a>
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
