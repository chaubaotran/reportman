<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>

	<div class="col-11">
		
		<!-- show current date  --> 
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<fmt:formatDate pattern="yyyy-MM-dd" value="${today}" />
	
		<h2>研修生一覧</h2>	
						
		<table class="table table-hover">
			<tr>
				<th>Name</th>
				<th></th>
			</tr>		
		    
			<c:forEach items="${employees}" var="employee">
				<c:url var="report" value="${pageContext.request.contextPath}/employee/report/list">
				<c:param name="id" value="${employee.id}" />							
			</c:url>
			<tr>
				<td><c:out value="${employee.userName}" /></td>
				<td>
					<a href="${report}">日報一覧</a>
				</td>
			</tr>
			</c:forEach>			   
		</table>
	</div>

</div>
</div>


<%@ include file="fragments/footer.jsp"%>
