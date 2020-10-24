<%@ page contentType="text/html;charset=UTF-8"%>

<nav class="navbar top-bar">
	<a class="navbar-brand" href="#">Reportman</a>	
		
	<div class="toggle-btn"  onclick="toggleMenu()">
		<div class="d-flex flex-column text-center"><i class="fas fa-user"></i>${user.userName}</div>
	</div>	
	<div class="drop-down-menu mr-2">
		<nav class="nav flex-column">
			<a class="nav-link" href="${pageContext.request.contextPath}/account/edit/?id=${user.id}">Edit account (アカウント編集)</a>
			
			<a class="nav-link" href="${pageContext.request.contextPath}/account/password/edit/?id=${user.id}">Edit password (パスワード変更)</a>
			
			<sec:authorize access="hasAnyRole('MANAGER', 'EMPLOYEE')">
				<a class="nav-link" href="${contextPath}/account/new">Create new account (アカウント作成)</a> 
			</sec:authorize>
			
			<form:form action="${pageContext.request.contextPath}/logout" method="POST">
				<input type="submit" value="Logout (ログアウト)" class="logout-link" />										
			</form:form>		  
		</nav>
	</div>	
</nav>			

