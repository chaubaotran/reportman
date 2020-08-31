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
					<div class="d-flex flex-column">
						<span class="ml-auto">ユーザー: ${user.userName}</span>
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
						
					<a href="${backToList}">${emp.userName}の日報一覧に戻る</a>
					
				</form:form>
				
			
			</div>
		</div>
	</div>
	
<script>
	window.onload = function() {
	  var textareas = Array.from(document.querySelectorAll(".form-control"));
	  var date = document.querySelector("#report-date");
	  textareas.forEach(item => {
		  item.setAttribute("readonly", true);
	  })
	  date.setAttribute("readonly", true);
	}
</script>

<%@ include file="fragments/footer.jsp"%>
	
	

