<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>

	<div class="container-fluid">
		<div class="row">			
			<%@ include file="fragments/topbar.jsp"%>				
		</div>
		
		<div class="row main-frame">						
			<%@ include file="fragments/sidebar.jsp"%>	

			<div class="col-9 col-md-10">
				
				<h2><strong>日報一覧</strong></h2>
				<h5>研修生: ${user.userName}</h5>
				
				<hr>
				
				<div class="my-3">
					<form:form method="GET" action="${pageContext.request.contextPath}/report/list/filter/">
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
								<c:url var="editLink" value="${pageContext.request.contextPath}/report/edit">
								<c:param name="reportId" value="${report.id}" />							
							</c:url>
							
							<tr>
								<td><c:out value="${report.date}" /></td>
								<td><c:out value="${report.task}" /></td>
								<td>
									<a href="${editLink}">編集</a>
								</td>
							</tr>
							</c:forEach>	
					    </tbody>					   
					</table>
				</div>
				
				<c:set var = "reports" scope = "session" value = "${reports}"/>
				<c:if test = "${reports == null || reports.size() == 0}">
					<p>${message}</p>
					<a href="${pageContext.request.contextPath}/report/create">日報追加へ</a>
			    </c:if>
			</div>
		</div>
	</div>
	
	<script>	
		window.onload = function() {
			var path = window.location.pathname;
			var menu = document.querySelector(".drop-down-menu");
			var toggleBtn = document.querySelector(".toggle-btn");
						
			/* Make sidebar active item stand out */
			var navLinks = Array.from(document.querySelectorAll(".nav-link"));
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
		
		function enableFilter() {	
			var yearFilter = document.querySelector("#year-filter");
			var monthFilter = document.querySelector("#month-filter");
			var filterBtn = document.querySelector("#filter-btn");
			
			if (yearFilter.value !== "None" && monthFilter.value !== "None") {
				filterBtn.removeAttribute("disabled");
			}
		}
		
		function toggleMenu() {
			var menu = document.querySelector(".drop-down-menu");		
			menu.classList.toggle("active");
		}	
	</script>


<%@ include file="fragments/footer.jsp"%>
