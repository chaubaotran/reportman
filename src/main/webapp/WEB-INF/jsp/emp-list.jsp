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
					<div class="d-flex">
						<h3><strong>研修生一覧</strong></h3>
						<span class="ml-auto">ユーザー: ${user.userName}</span>
					</div>	
									
					<table class="table table-hover">
						<thead>
							<tr>
								<th>名前</th>
								<th><i class="fas fa-cogs"></i></th>
							</tr>	
						</thead>
							
					    <tbody>
						    <c:forEach items="${employees}" var="employee">
								<c:url var="report" value="${pageContext.request.contextPath}/employee/report/list">
								<c:param name="id" value="${employee.id}" />	
								<c:param name="empName" value="${employee.userName}" />						
							</c:url>
							<tr>
								<td><c:out value="${employee.userName}" /></td>
								<td>
									<a href="${report}">日報一覧</a>
								</td>
							</tr>
							</c:forEach>		
					    </tbody>							   
					</table>
				</div>
			</div>
		</div>

<%@ include file="fragments/footer.jsp"%>
