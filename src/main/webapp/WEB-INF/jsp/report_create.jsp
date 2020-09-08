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
						<div class="d-flex">
							<h3><strong>日報新規作成</strong></h3>
							<span class="ml-auto">研修生: ${user.userName}</span>
						</div>	
						
						<p class="message">${successMessage}</p>		
						<p class="error">${errorMessage}</p>	
								
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
									
						<form:input type="hidden" path="id" />	  	
					  	<input type="submit" class="btn btn-primary" value="提出" onClick="return confirmSubmit()" />		  	
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
		
		const getTodayDate = () => {
			var date = new Date();

			var day = date.getDate();
			var month = date.getMonth() + 1;
			var year = date.getFullYear();

			if (month < 10) month = "0" + month;
			if (day < 10) day = "0" + day;

			var today = year + "-" + month + "-" + day;     
			return today;
		}			
		
		/* Make sidebar active item stand out */
		navLinks.forEach(item => {
			if (item.getAttribute("href").startsWith(path)) {
				item.classList.add("active");
			} else {
				item.classList.remove("active");
			}
		})			
		/* Make report date max value is today */
		document.getElementById("report-date").value = getTodayDate();
		document.getElementById("report-date").setAttribute("max", getTodayDate());
	
		/* Make drop down menu disappear when user clicks outside */
		document.addEventListener("click", function(e) {
			if (!menu.contains(e.target) && !toggleBtn.contains(e.target)) {
				menu.classList.remove("active");
			}			
		})
	}
		
	function confirmSubmit() {
		var agree=confirm("Are you sure you wish to submit this report? Once submitted, report cannot be deleted");
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
	
	

