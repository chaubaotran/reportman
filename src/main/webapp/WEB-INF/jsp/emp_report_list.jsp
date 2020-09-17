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
				<h5>研修生: ${empName}</h5>
				
				<hr>			
					
				<form:form method="GET" action="${pageContext.request.contextPath}/employee/report/list/filter/">
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
					
					<input name="id" value="${empId}" type="hidden" />
					<input name="empName" value="${empName}" type="hidden" />
					<input name="allNumber" value="${allNumber}" type="hidden" />
					<input name="unReadNumber" value="${unReadNumber}" type="hidden" />
					
					<input type="submit" value="Filter" id="filter-btn" disabled>				
				</form:form>	
				
				<c:url var="showOnlyUnread" value="${pageContext.request.contextPath}/employee/report/list/unread">
					<c:param name="id" value="${empId}" />			
					<c:param name="empName" value="${empName}" />			
					<c:param name="allNumber" value="${allNumber}" />			
					<c:param name="unReadNumber" value="${unReadNumber}" />	
				</c:url>
				
				<c:url var="showAll" value="${pageContext.request.contextPath}/employee/report/list">
					<c:param name="id" value="${empId}" />			
					<c:param name="empName" value="${empName}" />			
				</c:url>
				
				<h4>
					<a href="${showAll}"><span class="badge badge-dark">日報数：${allNumber}</span></a>
					<a href="${showOnlyUnread}"><span class="badge badge-danger">未確認数：${unReadNumber}</span></a>
				</h4>	
					
				
				<div class="table-wrapper-scroll-y my-custom-scrollbar">		
					<table class="table table-hover">
						<thead>
							<tr>
								<th style="width: 40%">日付</th>
								<th style="width: 40%">課題</th>
								<th style="width: 20%"><i class="fas fa-cogs"></i></th>
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
			    
			    <div class="d-flex mt-2" style="max-width: 800px;">
			    	<a class="nav-link pl-0" href="${pageContext.request.contextPath}/employee/list"><i class="fas fa-chevron-circle-left mr-2"></i>${empName}の研修生一覧へ</a>
			    				
					<c:url var="report" value="${pageContext.request.contextPath}/employee/report/month/status">
						<c:param name="id" value="${empId}" />	
						<c:param name="empName" value="${empName}" />						
					</c:url>
					
					<a class="nav-link ml-auto" href="${report}">${empName}の毎月状況へ<i class="fas fa-chevron-circle-right ml-2"></i></a>
				</div>
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