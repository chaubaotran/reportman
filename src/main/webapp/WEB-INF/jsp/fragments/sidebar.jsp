<%@ page contentType="text/html;charset=UTF-8"%>

<div class="col-3 col-md-2 side-bar">
	<ul class="nav flex-column horizontal-bar">
		<sec:authorize access="hasRole('EMPLOYEE')">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/report/create">Create new<br />(新規作成)</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/report/list/?id=${user.id}">List of reports<br />(日報一覧)</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/report/month/status/?id=${user.id}">Monthly status<br />(毎月状況)</a>
			</li>
		</sec:authorize>

		<sec:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/employee/list">List of employees<br />(研修生一覧)</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasAnyRole('ADMIN')">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/account/list">List of accounts<br />(アカウント一覧)</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasAnyRole('ADMIN')">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/account/create">Create new account<br />(アカウント作成)</a>
			</li>
		</sec:authorize>
		
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/manual">Manual<br />(マニュアル)</a>
		</li>
	</ul>
</div>		
