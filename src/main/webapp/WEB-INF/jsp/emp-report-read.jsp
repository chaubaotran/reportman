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
								
				<form:form action="addNewReport" method="POST" modelAttribute="report">
					<form:input type="hidden" path="id" />
					
					<form:input type="date" path="date" id="report-date" />
					
					<div class="form-group">
					    <label>課題</label>		    
					    <form:textarea class="form-control" path="task" rows="3" />
					</div>
					
					<div class="form-group">
					    <label>詳細内容</label>		    
					    <form:textarea class="form-control" path="detail" rows="3" />
					</div>
					
					<div class="form-group">
					    <label>進歩の良し悪し</label>		     
					    <form:textarea class="form-control" path="result" rows="3" />
					</div>
					
					<div class="form-group">
					    <label>所感</label>
					    <form:textarea class="form-control" path="feeling" rows="3" />
					</div>
				</form:form>
				
			<c:url var="backToList" value="${pageContext.request.contextPath}/employee/report/list">
	            <c:param name="id" value="${emp.id}"/>
	        </c:url>
				
			<a href="${backToList}">Back to ${emp.userName}'s report list</a>
			</div>
		</div>
	</div>
	
<script>

	window.onload = function() {
	  var textarea = document.querySelectorAll(".form-control");
	  for(int i = 0 ; i < textarea.length(); i++) {
		  textarea[i].setAttribute("readonly", true);	  
	  }
	}

	
</script>
<%@ include file="fragments/footer.jsp"%>
	
	

