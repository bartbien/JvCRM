<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header">
	<div id="header-user-panel">
		<c:url value="/logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				User: ${pageContext.request.userPrincipal.name} &nbsp &nbsp <a
					href="javascript:formSubmit()" id="header-link"> Logout</a>
			</h2>
		</c:if>
	</div>
</div>