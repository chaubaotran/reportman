<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="fragments/header.jsp"%>
	
	<div class="container text-center mt-5">
			<h4>申し訳ございません。
				<c:if test="${error == 404}">お探しのページが見つかりません。</c:if>
				<c:if test="${error == 500}">サーバーの内部エラー。</c:if>
				<c:if test="${error == 503}">Service unavailable</c:if>
				<c:if test="${error == 403}">Access to the requested resource is forbidden</c:if>
			</h4>
			<a href="javascript:history.back()">Back to previous page</a>
	</div>

<%@ include file="fragments/footer.jsp"%>