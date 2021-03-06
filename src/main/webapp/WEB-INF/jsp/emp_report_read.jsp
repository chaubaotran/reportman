<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>

	<div class="container-fluid">
		<div class="row">			
			<%@ include file="fragments/topbar.jsp"%>				
		</div>
	
		<div class="row main-frame">			
					
			<%@ include file="fragments/sidebar.jsp"%>		
					
			<div class="col-9 col-md-10 form-frame emp-report-read">								
				<form:form action="report/confirm" method="POST" modelAttribute="report">
					<form:input type="hidden" path="id" />
					<div class="d-flex">
						
						<c:if test="${unread eq true}">
							<h2><span class="badge badge-warning">Unread (未確認)</span></h2>
						</c:if>
						
						<c:if test="${unread eq false}">
							<h2><span class="badge badge-success">Read (確認済)</span></h2>
						</c:if>
						
						<p class="ml-auto">Employee (研修生): ${emp.userName}</p>
					</div>
					
					<c:if test="${message != null}">
						<p class="message">${message}</p>
					</c:if>											
					
					<div class="form-group">
						<label>Date (日付)*</label>	
						<br>
						<form:input class="my-auto" type="date" path="date" id="report-date" />
					</div>
					<div class="form-group">
					    <label>Task (課題)*</label>		    
					    <form:textarea class="form-control" path="task" rows="2" />
					    <form:errors path="task" class="error" />
					</div>
					
					<div class="form-group">
					    <label>Details (詳細内容)*</label>		    
					    <form:textarea class="form-control" path="detail" rows="2" />
					    <form:errors path="detail" class="error" />
					</div>
					
					<div class="form-group">
					    <label>Progess (進歩の良し悪し)*</label>		     
					    <form:textarea class="form-control" path="result" rows="2" />
					    <form:errors path="result" class="error" />
					</div>
					
					<div class="form-group">
					    <label>Emotion (所感)*</label>
					    <form:textarea class="form-control" path="feeling" rows="2" />
					    <form:errors path="feeling" class="error" />
					</div>
					
					<c:url var="backToList" value="${pageContext.request.contextPath}/employee/report/list">
			            <c:param name="id" value="${emp.id}"/>
			            <c:param name="empName" value="${emp.userName}"/>
			        </c:url>	
			        			        
			        <input type="submit" class="btn btn-primary confirm-btn" value="Confirm"  <c:if test="${unread == false}"><c:out value="disabled='disabled'"/></c:if> /> 					
				</form:form>
			
				<div class="d-flex" style="max-width: 800px;">
					<a class="nav-link" href="${backToList}"><i class="fas fa-chevron-circle-left mr-2"></i>${emp.userName}の日報一覧へ</a>
				
					<c:url var="report" value="${pageContext.request.contextPath}/employee/report/month/status">
						<c:param name="id" value="${emp.id}" />	
						<c:param name="empName" value="${emp.userName}" />						
					</c:url>
					
					<a class="nav-link ml-auto" href="${report}">${emp.userName}の毎月状況へ<i class="fas fa-chevron-circle-right ml-2"></i></a>		
					
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
			var textareas = Array.from(document.querySelectorAll(".form-control"));
		  	var date = document.querySelector("#report-date");
					
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
			
			/* Make textarea and date readonly */
			textareas.forEach(item => {
				  item.setAttribute("readonly", true);
			})
			  
		  	date.setAttribute("readonly", true);
			
		}
		
		function toggleMenu() {
			var menu = document.querySelector(".drop-down-menu");
			menu.classList.toggle("active");
		}
	</script>

<%@ include file="fragments/footer.jsp"%>
	
	

