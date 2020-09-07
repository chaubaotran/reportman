<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>
	
	<body>	
		<div class="container-fluid">
			<div class="row">			
				<%@ include file="fragments/topbar.jsp"%>				
			</div>
		
			<div class="row my-2">						
				<%@ include file="fragments/sidebar.jsp"%>				
				<div class="col-10">	
	
					<div class="d-flex">
						<h3><strong>日報一覧</strong></h3>	
						<div class="d-flex flex-column ml-auto">
							<span>研修生: ${empName}</span>
						</div>					
						
					</div>	
		
					<div class="d-flex justify-content-end">
						<form:form class="mt-4" method="GET" action="${pageContext.request.contextPath}/employee/report/list/filter/">
							<span>フィルター:</span>
							
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
							
							<input name="id" value="${user.id}" type="hidden" />
							
							<input type="submit" value="Filter" id="filter-btn" disabled>				
						</form:form>		
					</div>
					<div class="table-wrapper-scroll-y my-custom-scrollbar">		
						<table class="table table-hover">
							<thead>
								<tr>
									<th>日付</th>
									<th>課題</th>
									<th><i class="fas fa-cogs"></i></th>
								</tr>
							</thead>
										
							<tbody>
								<c:forEach items="${reports}" var="report">									
									
									<c:set var="unread" value="false" />
									<c:forEach var="unReadReport" items="${unReadReports}">
									  <c:if test="${report eq unReadReport}">
									    <c:set var="unread" value="true" />
									  </c:if>
									</c:forEach>
									
									<c:url var="readLink" value="${pageContext.request.contextPath}/employee/report">
										<c:param name="id" value="${report.id}" />			
										<c:param name="unread" value="${unread}" />				
									</c:url>
									
									<c:if test="${unread eq true}">
   										<tr style="color: red;">
											<td><c:out value="${report.date}" /></td>
											<td><c:out value="${report.task}" /></td>
											<td>
												<a style="color: red;" href="${readLink}">読む</a>
											</td>
										</tr>	
								  	</c:if>
								  	
								  	<c:if test="${unread eq false}">
   										<tr>
											<td><c:out value="${report.date}" /></td>
											<td><c:out value="${report.task}" /></td>
											<td>
												<a href="${readLink}">読む</a>
											</td>
										</tr>	
								  	</c:if>

								</c:forEach>	
							</tbody>    					   
						</table>
					</div>
					
					<c:set var = "reports" scope = "session" value = "${reports}"/>
					<c:if test = "${reports == null || reports.size() == 0}">
						<c:out value="該当する日報は見つかりません" />
				    </c:if>
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
	}
	
	function toggleMenu() {
		var menu = document.querySelector(".drop-down-menu");
		menu.classList.toggle("active");
	}
	
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