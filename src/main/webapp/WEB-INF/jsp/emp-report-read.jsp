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
								
				<form:form action="addNewReport" method="POST" modelAttribute="report">
					<div class="d-flex flex-column">
						<span class="ml-auto">研修生: ${emp.userName}</span>
					</div>	
					<form:input type="hidden" path="id" />
					
					<div class="form-group">
						<label>日付*</label>	
						<br>
						<form:input class="my-auto" type="date" path="date" id="report-date" />
					</div>
					<div class="form-group">
					    <label>課題*</label>		    
					    <form:textarea class="form-control" path="task" rows="3" />
					    <form:errors path="task" class="error" />
					</div>
					
					<div class="form-group">
					    <label>詳細内容*</label>		    
					    <form:textarea class="form-control" path="detail" rows="3" />
					    <form:errors path="detail" class="error" />
					</div>
					
					<div class="form-group">
					    <label>進歩の良し悪し*</label>		     
					    <form:textarea class="form-control" path="result" rows="3" />
					    <form:errors path="result" class="error" />
					</div>
					
					<div class="form-group">
					    <label>所感*</label>
					    <form:textarea class="form-control" path="feeling" rows="3" />
					    <form:errors path="feeling" class="error" />
					</div>
					
					<c:url var="backToList" value="${pageContext.request.contextPath}/employee/report/list">
			            <c:param name="id" value="${emp.id}"/>
			            <c:param name="empName" value="${emp.userName}"/>
			        </c:url>											
				</form:form>
			
				<p class="mt-5"><a href="${backToList}">${emp.userName}の日報一覧に戻る</a></p>
			
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
	
	

