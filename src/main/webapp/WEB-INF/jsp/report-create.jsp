<%@ page contentType="text/html;charset=UTF-8"%>
<%@	taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
		<link rel="stylesheet" href="../resources/css/report-create.css">
		<script src="https://kit.fontawesome.com/49bcf1dc87.js"></script>		
		<title>レポーマン</title>
	</head>
	
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
							<h3><strong>新規作成</strong></h3>
							<span class="ml-auto">ユーザー: ${user.userName}</span>
						</div>	
						
						<p class="message">${successMessage}</p>		
								
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
	
	

