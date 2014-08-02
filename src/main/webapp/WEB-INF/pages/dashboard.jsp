<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
	<h1>TTitle : ${title}</h1>
	<h1>Message : ${message}</h1>
	
	<c:if test="${not empty email}">
		<h1>Email : ${email}</h1>
	</c:if>

	<c:url value="/logout" var="logoutUrl" />
	
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>

	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<h2>
			Welcome : ${pageContext.request.userPrincipal.name} | 
			<a href="javascript:formSubmit()"> Logout</a>
		</h2>
	</c:if>
	
	<form name='email' action="${pageContext.request.contextPath}/email"  method="get">
		<table>
				<tr>
					<td>User name:</td>
					<td>
						<input type='text' name='username' required="true">
					</td>
				</tr>
				<tr>
					<td colspan='2'>
						<input name="submit" type="submit" value="Get email" />
					</td>
				</tr>
			</table>
	</form>

</body>
</html>