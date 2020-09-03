<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>

</style>
	
	<body>
	
		<div class="container-fluid">
		
			<div class="row">			
				<%@ include file="fragments/topbar.jsp"%>				
			</div>
		
			<div class="row my-2">						
				<%@ include file="fragments/sidebar.jsp"%>				
				
				<div class="col-10 report-create">			
					<div class="d-flex">
						<h3><strong>アカウント一覧</strong></h3>
						<span class="ml-auto">ユーザー: ${user.userName}</span>
					</div>	
					
					<div class="my-3 float-right"><a href="${pageContext.request.contextPath}/account/create">新規作成</a></div>
									
					<table class="table table-hover">
						<thead>
							<tr>
								<th>ユーザー名</th>
								<th>ファーストネーム</th>
								<th>ファミリーネーム</th>
								<th>メール</th>
								<th>ロール</th>
								<th><i class="fas fa-cogs"></i></th>
							</tr>	
						</thead>
							
					    <tbody>
						    <c:forEach items="${users}" var="user">
								<c:url var="accountEdit" value="${pageContext.request.contextPath}/account/edit">
								<c:param name="id" value="${user.id}" />				
							</c:url>
							<tr>
								<td><c:out value="${user.userName}" /></td>
								<td><c:out value="${user.firstName}" /></td>
								<td><c:out value="${user.lastName}" /></td>
								<td><c:out value="${user.email}" /></td>
								<td>
									<c:forEach items="${user.roles}" var="role">
										<c:if test="${role.name == 'ROLE_EMPLOYEE'}">
											<c:out value="研修生"></c:out>
										</c:if>
										<c:if test="${role.name == 'ROLE_MANAGER'}">
											<c:out value="指導者"></c:out>
										</c:if>
									    <c:if test="${role.name == 'ROLE_ADMIN'}">
											<c:out value="アドミン"></c:out>
										</c:if>
									</c:forEach>
								</td>
								
								<td>
									<a href="${accountEdit}">編集</a>
								</td>
							</tr>
							</c:forEach>		
					    </tbody>							   
					</table>
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
