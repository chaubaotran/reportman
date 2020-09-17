<%@ page contentType="text/html;charset=UTF-8"%>

<div class="col-3 col-md-2 side-bar">
	<ul class="nav flex-column horizontal-bar">
		<sec:authorize access="hasRole('EMPLOYEE')">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/report/create">新規作成</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/report/list/?id=${user.id}">日報一覧</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/report/month/status/?id=${user.id}">毎月状況</a>
			</li>
		</sec:authorize>

		<sec:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/employee/list">研修生一覧</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasAnyRole('ADMIN')">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/account/list">アカウント一覧</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasAnyRole('ADMIN')">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/account/create">アカウント作成</a>
			</li>
		</sec:authorize>
	</ul>
</div>		
