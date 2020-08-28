<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="fragments/header.jsp"%>
	<style>
		.error {
			color: red;
		}
	</style>
	
	<div class="container">
		
		<div class="row d-flex justify-content-center">
			<div class="col-12 col-md-6">
			
			${user.id }
			
				<form:form action="addNewReport" method="POST" modelAttribute="report">
					<form:input type="hidden" path="id" />
					
					<form:input type="date" path="date" id="report-date" />
					
					<div class="form-group">
					    <label>課題</label>		    
					    <form:textarea class="form-control" path="task" rows="3" />
					    <form:errors path="task" class="error" />
					</div>
					
					<div class="form-group">
					    <label>詳細内容</label>		    
					    <form:textarea class="form-control" path="detail" rows="3" />
					    <form:errors path="detail" class="error" />
					</div>
					
					<div class="form-group">
					    <label>進歩の良し悪し</label>		     
					    <form:textarea class="form-control" path="result" rows="3" />
					    <form:errors path="result" class="error" />
					</div>
					
					<div class="form-group">
					    <label>所感</label>
					    <form:textarea class="form-control" path="feeling" rows="3" />
					    <form:errors path="feeling" class="error" />
					</div>
									  	
				  	<input type="submit" class="btn btn-primary btn-sm" value="提出" onClick="return confirmSubmit()" />
				  	<p>${successMessage}</p>
				</form:form>
				
			
			</div>
		</div>
	</div>

	<script>
	
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
	
	  
	document.getElementById("report-date").value = getTodayDate();
	document.getElementById("report-date").setAttribute("max", getTodayDate());
	
	
	function confirmSubmit() {
		var agree=confirm("Are you sure you wish to submit this report? Once submitted, report cannot be deleted");
		if (agree)
		 return true ;
		else
		 return false ;
	}
	
	</script>
	
<%@ include file="fragments/footer.jsp"%>
	
	

