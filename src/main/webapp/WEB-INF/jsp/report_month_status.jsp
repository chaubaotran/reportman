<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>

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
				<h5 class="ml-auto">Employee (研修生): ${empName}</h5>
				<h5>Year/month (年月)：${year}/${month}</h5>				
				
				<hr>
				
				<div>
					<form:form method="GET" action="${pageContext.request.contextPath}/report/month/status/filter">						
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
						<input name="id" value="${user.id}" type="hidden" />
						
						<input type="submit" value="Search" id="filter-btn" disabled>				
					</form:form>		
				</div>
				
				<div class="d-flex">
					<p class="mr-3"><i class="fas fa-check-circle"></i>Done (有)</p>
					<p><i class="fas fa-times"></i>Undone (無)</p>
				</div>
				
				<div class="my-custom-scrollbar">
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
					    		<c:set var="message" value="日報追加へ" />
					    		
						    	<c:if test="${loop.index < 10}">
						    		<c:set var="zero" value="0" />							    		
						    		<c:set var="temp" value="${zero}${index}" />
						    		<c:url var="reportCreate" value="${pageContext.request.contextPath}/report/create">
										<c:param name="reportDate" value="${year}-${month}-${temp}" />					
									</c:url>
						    		<c:forEach items="${reports}" var="report">					    					
							    		<c:choose>
								    		<c:when test="${report.date.substring(8).equals(temp)}">	
					    						<c:set var="check" value="true" />
					    						<c:set var="message" value="日報監督へ" />
					    						<c:url var="reportEdit" value="${pageContext.request.contextPath}/report/edit">
													<c:param name="reportId" value="${report.id}" />					
												</c:url>	    					
					    					</c:when>
								    		<c:otherwise></c:otherwise>								    		
							    		</c:choose>
						    		</c:forEach>	
					    		</c:if>
				    		
				    			<c:if test="${loop.index >= 10}">
				    				<c:url var="reportCreate" value="${pageContext.request.contextPath}/report/create">
											<c:param name="reportDate" value="${year}-${month}-${index}" />					
									</c:url>
					    			<c:forEach items="${reports}" var="report">					    				
					    				<c:choose>
					    					<c:when test="${report.date.substring(8).equals(index)}">	
					    						<c:set var="check" value="true" />
					    						<c:url var="reportEdit" value="${pageContext.request.contextPath}/report/edit">
													<c:param name="reportId" value="${report.id}" />					
												</c:url>				    					
					    					</c:when>
					    					<c:otherwise></c:otherwise>
					    				</c:choose>
					    			</c:forEach>
				    			</c:if>					
					    		
					    		<!-- Render icon  -->
						    	<td class="the-hover-one" data-toggle="tooltip" data-placement="bottom" title="${message}">
						    		<c:choose>
				    					<c:when test="${check eq true}">
											<a href="${reportEdit}" class="wrapper">
										    	<i class="fas fa-check-circle"></i>
											</a>
										</c:when>
										
										
				    					<c:otherwise>
				    						<a href="${reportCreate}" class="wrapper" >
										    	<i class="fas fa-times"></i>
											</a>	    						
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
					    		<c:set var="message" value="日報追加へ" /> 
					    		<c:url var="reportCreate" value="${pageContext.request.contextPath}/report/create">
									<c:param name="reportDate" value="${year}-${month}-${index}" />						
								</c:url>	 
			    				<c:forEach items="${reports}" var="report">		    					
				    				<c:choose>
				    					<c:when test="${report.date.substring(8).equals(index)}">	
				    						<c:set var="check" value="true" />
				    						<c:set var="message" value="日報監督へ" />
				    						<c:url var="reportEdit" value="${pageContext.request.contextPath}/report/edit">
												<c:param name="reportId" value="${report.id}" />					
											</c:url>				    					
				    					</c:when>
				    					<c:otherwise></c:otherwise>
				    				</c:choose>
				    			</c:forEach>	
				    			
						    	<!-- Render icon  -->
					    		<td class="the-hover-one" data-toggle="tooltip" data-placement="bottom" title="${message}">
						    		<c:choose>
				    					<c:when test="${check eq true}">				    						
					    					<a href="${reportEdit}" class="wrapper" >
										    	<i class="fas fa-check-circle"></i>
											</a>
										</c:when>
				    					<c:otherwise>
				    						<a href="${reportCreate}" class="wrapper" >
										    	<i class="fas fa-times"></i>
											</a>				    						
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
					    		<c:set var="message" value="日報追加へ" />	
					    		<c:url var="reportCreate" value="${pageContext.request.contextPath}/report/create">
									<c:param name="reportDate" value="${year}-${month}-${index}" />						
								</c:url>		    
			    				<c:forEach items="${reports}" var="report">		    					
				    				<c:choose>
				    					<c:when test="${report.date.substring(8).equals(index)}">	
				    						<c:set var="check" value="true" />
				    						<c:set var="message" value="日報監督へ" />
				    						<c:url var="reportEdit" value="${pageContext.request.contextPath}/report/edit">
												<c:param name="reportId" value="${report.id}" />					
											</c:url>				    					
				    					</c:when>
				    					<c:otherwise></c:otherwise>
				    				</c:choose>
				    			</c:forEach>	
				    			
						    	<!-- Render icon  -->
					    		<td class="the-hover-one" data-toggle="tooltip" data-placement="bottom" title="${message}">
						    		<c:choose>
				    					<c:when test="${check eq true}">				    						
					    					<a href="${reportEdit}" class="wrapper" >
										    	<i class="fas fa-check-circle"></i>
											</a>
										</c:when>
				    					<c:otherwise>
				    						<a href="${reportCreate}" class="wrapper" >
										    	<i class="fas fa-times"></i>
											</a>				    						
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
						    		<c:set var="message" value="日報追加へ" />
						    		<c:url var="reportCreate" value="${pageContext.request.contextPath}/report/create">
										<c:param name="reportDate" value="${year}-${month}-${index}" />						
									</c:url>
				    				<c:forEach items="${reports}" var="report">			    						
					    				<c:choose>
					    					<c:when test="${report.date.substring(8).equals(Integer.toString(monthDays))}">	
					    						<c:set var="check" value="true" />
					    						<c:set var="message" value="日報監督へ" />
					    						<c:url var="reportEdit" value="${pageContext.request.contextPath}/report/edit">
													<c:param name="reportId" value="${report.id}" />					
												</c:url>				    					
					    					</c:when>
					    					<c:otherwise></c:otherwise>
					    				</c:choose>
					    				
					    			</c:forEach>
					    			
					    			<!-- Render icon  -->
						    		<td class="the-hover-one" data-toggle="tooltip" data-placement="bottom" title="${message}">
							    		<c:choose>
					    					<c:when test="${check eq true}">				    						
						    					<a href="${reportEdit}" class="wrapper" >
											    	<i class="fas fa-check-circle"></i>
												</a>
											</c:when>
					    					<c:otherwise>
					    						<a href="${reportCreate}" class="wrapper" >
											    	<i class="fas fa-times"></i>
												</a>				    						
					    					</c:otherwise>
					    				</c:choose>					    			    	
							    	</td>
						    </tr>			
					    </c:if>						   
					</table>
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