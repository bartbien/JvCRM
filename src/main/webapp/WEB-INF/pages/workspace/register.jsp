<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/res/container/css/core.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/container/css/account.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/res/container/js/register.js"></script>

<jsp:include page="../headers/login.jsp" />
<div id="line"></div>

<div id="body">
	<fieldset id="form-container">
	
		<legend id="legend">
			<b>Sign up form:</b>
		</legend>

		<div>
			<!-- wrong login data -->
			<c:if test="${not empty error}">
				<div class="error">${error}</div>
			</c:if>

			<!-- <form name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'> -->

			<form class="account-form" name="signUpForm" action="${pageContext.request.contextPath}/adduser" method='POST'onsubmit="return checkForm(this);">
				<div class="account-info">
					<label> Username </label> 
					<input class="input-fields" type="text" name="username" required="true">
					<label> Password </label>
					<input class="input-fields" type="password" name="password" required="true">
					<label> Password again </label>
					<input class="input-fields"	type="password" name="passwordRepeat" required="true">
				</div>

				<div class="account-login-btn">
					<input class="blue-style-btn" type="submit" name="submit" value="Sign up">
				</div>

				<!-- Cross-site request forgery (a one-click attack or session riding ) -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

				<div class="account-register-back-btn">
					<input class="blue-style-btn" type="button" value="Back to login" onclick="location.replace('<%=request.getContextPath()%>/login')" />
				</div>
			</form>
		</div>
	</fieldset>
</div>