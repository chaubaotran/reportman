<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>

	<div class="container-fluid">
		<div class="row">			
			<%@ include file="fragments/topbar.jsp"%>				
		</div>
		
		<div class="row main-frame">						
			<%@ include file="fragments/sidebar.jsp"%>	
			
			<div class="col-9 col-md-10 status">	
				<h2><strong>Monthly status (毎月の日報状況)</strong></h2>
				<h5>Employee (研修生): ${empName}</h5>
				<h5>Year/month (年月)：${year}/${month}</h5>					
				<hr>		
				<form:form method="GET" action="${pageContext.request.contextPath}/employee/report/month/status/filter">						
					<label>Year (年)</label>
					<select name="year" id="year-filter" onchange="enableFilter()">
						<option value="None" selected></option>
						<option value="2020">2020</option>
						<option value="2019">2019</option>
						<option value="2018">2018</option>
					</select>
					<label>Month (月)</label>
					<select name="month" id="month-filter" onchange="enableFilter()">
						<option value="None" selected></option>
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
					
					<input name="empName" value="${empName}" type="hidden" />
					<input name="empId" value="${empId}" type="hidden" />
					
					<input type="submit" value="Search" id="filter-btn" disabled>				
				</form:form>	
				
				<div class="d-flex">
					<div class="my-2">
						<i class="fas fa-check-circle mr-1"></i>Done (有)
						<i class="fas fa-times mr-1"></i>Undone (無)
					</div>		
				</div>
						
				<div class="table-wrapper-scroll-y my-custom-scrollbar">
					<table class="table">				    	
					    <tr>
					    	<c:forEach begin="1" end="10" varStatus="loop">
					    		<c:if test="${loop.index < 10}"><td>0${loop.index}</td></c:if>
					    		<c:if test="${loop.index >= 10}"><td>${loop.index}</td></c:if>
					    	</c:forEach>
					    </tr>
					    
					    <tr>
					    	<c:forEach begin="1" end="10" varStatus="loop">
					    		
					    		<!-- Check if has report or not  -->
					    		<c:set var="check" value="false" />
					    		<c:set var="index" value="${Integer.toString(loop.index)}" />
					    		
						    	<c:if test="${loop.index < 10}">
						    		<c:set var="zero" value="0" />							    		
						    		<c:set var="temp" value="${zero}${index}" />
						    		<c:forEach items="${reports}" var="report">					    					
							    		<c:choose>
								    		<c:when test="${report.date.substring(8).equals(temp)}">	
					    						<c:set var="check" value="true" />
					    						<c:url var="reportEdit" value="${pageContext.request.contextPath}/employee/report">
													<c:param name="id" value="${report.id}" />
													<c:param name="unread" value="${!report.read}" />					
												</c:url>	    					
					    					</c:when>
								    		<c:otherwise></c:otherwise>								    		
							    		</c:choose>
						    		</c:forEach>	
					    		</c:if>
				    		
				    			<c:if test="${loop.index >= 10}">
					    			<c:forEach items="${reports}" var="report">					    				
					    				<c:choose>
					    					<c:when test="${report.date.substring(8).equals(index)}">	
					    						<c:set var="check" value="true" />
					    						<c:url var="reportEdit" value="${pageContext.request.contextPath}/employee/report">
													<c:param name="id" value="${report.id}" />
													<c:param name="unread" value="${!report.read}" />					
												</c:url>	   			    					
					    					</c:when>
					    					<c:otherwise></c:otherwise>
					    				</c:choose>
					    			</c:forEach>
				    			</c:if>					
					    		
					    		<!-- Render icon  -->
						    	<td class="the-hover-one">
						    		<c:choose>
				    					<c:when test="${check eq true}">
											<a href="${reportEdit}" class="wrapper"  data-toggle="tooltip" data-placement="bottom" title="日報監督へ">
										    	<i class="fas fa-check-circle"></i>
											</a>
										</c:when>
				    					<c:otherwise>
				    						<i class="fas fa-times"></i>				    						
				    					</c:otherwise>
				    				</c:choose>					    			    	
						    	</td>
					    	</c:forEach>
					    </tr> 
					    
					    <tr>
					    	<c:forEach begin="11" end="20" varStatus="loop">
					    		<td>${loop.index}</td>
					    	</c:forEach>
					    </tr>
					    
					     <tr>
					    	<c:forEach begin="11" end="20" varStatus="loop">
					    		<!-- Check if has report or not  -->
					    		<c:set var="index" value="${Integer.toString(loop.index)}" />
					    		<c:set var="check" value="false" />				
			    				<c:forEach items="${reports}" var="report">		    					
				    				<c:choose>
				    					<c:when test="${report.date.substring(8).equals(index)}">	
				    						<c:set var="check" value="true" />
				    						<c:url var="reportEdit" value="${pageContext.request.contextPath}/employee/report">
												<c:param name="id" value="${report.id}" />
												<c:param name="unread" value="${!report.read}" />					
											</c:url>	   			    					
				    					</c:when>
				    					<c:otherwise></c:otherwise>
				    				</c:choose>
				    			</c:forEach>	
				    			
						    	<!-- Render icon  -->
					    		<td  class="the-hover-one">
						    		<c:choose>
				    					<c:when test="${check eq true}">				    						
					    					<a href="${reportEdit}" class="wrapper" data-toggle="tooltip" data-placement="bottom" title="日報監督へ" >
										    	<i class="fas fa-check-circle"></i>
											</a>
										</c:when>
				    					<c:otherwise>
				    						<i class="fas fa-times"></i>		    						
				    					</c:otherwise>
				    				</c:choose>					    			    	
						    	</td>
					    	</c:forEach>
					    </tr>
					    
					    <tr>
					    	<c:forEach begin="21" end="${monthDays <= 30 ? monthDays : 30}" varStatus="loop">
					    		<td>${loop.index}</td>
					    	</c:forEach>
					    </tr>
					    
					    <tr>
					    	<c:forEach begin="21" end="${monthDays <= 30 ? monthDays : 30}" varStatus="loop">	
					    		<!-- Check if has report or not  -->
					    		<c:set var="index" value="${Integer.toString(loop.index)}" />
					    		<c:set var="check" value="false" />				    
			    				<c:forEach items="${reports}" var="report">		    					
				    				<c:choose>
				    					<c:when test="${report.date.substring(8).equals(index)}">	
				    						<c:set var="check" value="true" />
				    						<c:url var="reportEdit" value="${pageContext.request.contextPath}/employee/report">
												<c:param name="id" value="${report.id}" />
												<c:param name="unread" value="${!report.read}" />					
											</c:url>	   			    					
				    					</c:when>
				    					<c:otherwise></c:otherwise>
				    				</c:choose>
				    			</c:forEach>	
				    			
						    	<!-- Render icon  -->
					    		<td class="the-hover-one">
						    		<c:choose>
				    					<c:when test="${check eq true}">				    						
					    					<a href="${reportEdit}" class="wrapper"　 data-toggle="tooltip" data-placement="bottom" title="${日報監督へ}" >
										    	<i class="fas fa-check-circle"></i>
											</a>
										</c:when>
				    					<c:otherwise>				    						
									    	<i class="fas fa-times"></i>															    						
				    					</c:otherwise>
				    				</c:choose>					    			    	
						    	</td>
					    	</c:forEach>
					    </tr>						
					    <c:if test="${monthDays > 30}">				    
					    	<tr>
						    	<td>${monthDays}</td>
						    </tr>
						    
						    <tr>
						    		<!-- Check if has report or not  -->
						    		<c:set var="check" value="false" />	
				    				<c:forEach items="${reports}" var="report">			    						
					    				<c:choose>
					    					<c:when test="${report.date.substring(8).equals(Integer.toString(monthDays))}">	
					    						<c:set var="check" value="true" />
					    						<c:url var="reportEdit" value="${pageContext.request.contextPath}/employee/report">
													<c:param name="id" value="${report.id}" />
													<c:param name="unread" value="${!report.read}" />					
												</c:url>				    					
					    					</c:when>
					    					<c:otherwise></c:otherwise>
					    				</c:choose>
					    				
					    			</c:forEach>
					    			
					    			<!-- Render icon  -->
						    		<td class="the-hover-one">
							    		<c:choose>
					    					<c:when test="${check eq true}">				    						
						    					<a href="${reportEdit}" class="wrapper"  data-toggle="tooltip" data-placement="bottom" title="${日報監督へ}">
											    	<i class="fas fa-check-circle"></i>
												</a>
											</c:when>
					    					<c:otherwise>
										    	<i class="fas fa-times"></i>			    						
					    					</c:otherwise>
					    				</c:choose>					    			    	
							    	</td>
						    </tr>			
					    </c:if>						   
					</table>
				</div>
								
				<div class="d-flex mt-2" style="max-width: 800px;">	
					<a class="nav-link pl-0" href="${pageContext.request.contextPath}/employee/list"><i class="fas fa-chevron-circle-left mr-2"></i>${empName}の研修生一覧へ</a>	
								
					<c:url var="report" value="${pageContext.request.contextPath}/employee/report/list">
						<c:param name="id" value="${empId}" />	
						<c:param name="empName" value="${empName}" />						
					</c:url>
					
					<a class="nav-link ml-auto" href="${report}">${empName}の日報一覧へ<i class="fas fa-chevron-circle-right ml-2"></i></a>	
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