<%@ page contentType="text/html;charset=UTF-8"%>

<nav class="navbar top-bar">
	<a class="navbar-brand" href="#">レポーマン</a>	
		
	<div class="toggle-btn"  onclick="toggleMenu()">
		<div class="d-flex flex-column text-center"><i class="fas fa-user"></i>${user.userName}</div>
	</div>	
	<div class="drop-down-menu mr-2">
		<nav class="nav flex-column">
			<a class="nav-link" href="${pageContext.request.contextPath}/account/edit/?id=${user.id}">アカウント編集</a>
			
			<a class="nav-link" href="${pageContext.request.contextPath}/account/password/edit/?id=${user.id}">パスワード変更</a>
			
			<form:form action="${pageContext.request.contextPath}/logout" method="POST">
				<input type="submit" value="ログアウト" class="logout-link" />										
			</form:form>		  
		</nav>
	</div>	
</nav>			

