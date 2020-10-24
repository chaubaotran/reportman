<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>
	
	<div class="container-fluid">
		<div class="row">			
			<%@ include file="fragments/topbar.jsp"%>				
		</div>
	
		<div class="row main-frame">						
			<%@ include file="fragments/sidebar.jsp"%>		
					
			<div class="col-9 col-md-10 form-frame">	
				<form:form action="editReport" method="POST" modelAttribute="report">
					<div class="d-flex">
						<h2><strong>Edit report (日報編集)</strong></h2>
						<span class="ml-auto">Employee (研修生): ${user.userName}</span>
					</div>	
					<p class="message">${successMessage}</p>		
							
					<div class="form-group">
						<label>Date (日付)*</label>	
						<br>
						<form:input class="my-auto" type="date" path="date" id="report-date" />
					</div>
					<div class="form-group">
					    <label>Task (課題)*</label>		    
					    <form:textarea class="form-control" path="task" rows="3" />
					    <form:errors path="task" class="error" />
					</div>
					
					<div class="form-group">
					    <label>Details (詳細内容)*</label>		    
					    <form:textarea class="form-control" path="detail" rows="3" />
					    <form:errors path="detail" class="error" />
					</div>
					
					<div class="form-group">
					    <label>Progress (進歩の良し悪し)*</label>		     
					    <form:textarea class="form-control" path="result" rows="3" />
					    <form:errors path="result" class="error" />
					</div>
					
					<div class="form-group">
					    <label>Emotion (所感)*</label>
					    <form:textarea class="form-control" path="feeling" rows="3" />
					    <form:errors path="feeling" class="error" />
					</div>
								
					<form:input type="hidden" path="id" />	
					
				  	<input type="submit" class="btn btn-primary" value="Edit" onClick="return confirmSubmit()" />		
				</form:form>		
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
			
			/* Make report date readonly */
			document.getElementById("report-date").setAttribute("readonly", true);
		}
		
		function confirmSubmit() {
			var agree=confirm("Are you sure you wish to submit this report? You can change the content later.");
			if (agree)
			 return true ;
			else
			 return false ;
		}	
		
		function toggleMenu() {
			var menu = document.querySelector(".drop-down-menu");
			menu.classList.toggle("active");
		}	
	</script>
	
<%@ include file="fragments/footer.jsp"%>
	
	

