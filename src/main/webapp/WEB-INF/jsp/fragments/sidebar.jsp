<%@ page contentType="text/html;charset=UTF-8"%>

<div class="col-1">
	<ul class="nav flex-column horizontal-bar">
		<li class="nav-item">
			<a class="nav-link pl-0" href="${pageContext.request.contextPath}/report/create">新規作成</a>
		</li>
		<li class="nav-item">
			<a class="nav-link pl-0" href="${pageContext.request.contextPath}/report/list/?id=${user.id}">日報一覧</a>
		</li>
	</ul>
</div>		