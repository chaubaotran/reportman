<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>

	<div class="col-11">
		
		<!-- show current date  --> 
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<fmt:formatDate pattern="yyyy-MM-dd" value="${today}" />
	
		<h2>日報一覧</h2>	
		
		<form:form method="GET" action="${pageContext.request.contextPath}/employee/report/list/filter/">
			<p>フィルター</p>
			
			<label>年</label>
			<select name="year" id="year-filter" onchange="enableFilter()">
				<option value="None" selected>無</option>
				<option value="2020">2020</option>
				<option value="2019">2019</option>
				<option value="2018">2018</option>
			</select>
			<label>月</label>
			<select name="month" id="month-filter" onchange="enableFilter()">
				<option value="None" selected>無</option>
				<option value="01">01</option>
				<option value="02">02</option>
				<option value="03">03</option>
				<option value="04">04</option>
				<option value="05">05</option>
				<option value="06">06</option>
				<option value="07">07</option>
				<option value="08">08</option>
				<option value="09">09</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			
			<input name="id" value="${id}" type="hidden" />
			
			<input type="submit" value="Filter" id="filter-btn" disabled>
			
		</form:form>
		
		<a href="${pageContext.request.contextPath}/employee/report/list/?id=${id}">Show all</a>
		
		<table class="table table-hover">
			<tr>
				<th>日付</th>
				<th>課題</th>
				<th></th>
			</tr>		
		    
			<c:forEach items="${reports}" var="report">
				<c:url var="readLink" value="${pageContext.request.contextPath}/employee/report">
				<c:param name="id" value="${report.id}" />							
			</c:url>
			<tr>
				<td><c:out value="${report.date}" /></td>
				<td><c:out value="${report.task}" /></td>
				<td>
					<a href="${readLink}">Read</a>
				</td>
			</tr>
			</c:forEach>			   
		</table>
		
		<c:set var = "reports" scope = "session" value = "${reports}"/>
		<c:if test = "${reports == null || reports.size() == 0}">
			<c:out value="該当する日報は見つかりません" />
	    </c:if>
	</div>

</div>
</div>

<script>

	function enableFilter() {	
		var yearFilter = document.querySelector("#year-filter");
		var monthFilter = document.querySelector("#month-filter");
		var filterBtn = document.querySelector("#filter-btn");
		
		if (yearFilter.value !== "None" && monthFilter.value !== "None") {
			filterBtn.removeAttribute("disabled");
		}
	}

</script>

<%@ include file="fragments/footer.jsp"%>