<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign up</title>

<!-- container css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/res/container/css/core.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/res/container/css/account.css" />
<!-- container css -->

<script type="text/javascript"
	src="<%=request.getContextPath()%>/res/container/js/register.js"></script>

</head>

<body onload='document.signUpForm.username.focus();'>

	<div id="main">
		<div id="container">

			<div id="header">
				<h3>Spring + Hibernate + Annotation = mini CRM system</h3>
			</div>

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

						<form class="account-form" name="signUpForm" action="${pageContext.request.contextPath}/adduser" method='POST' onsubmit="return checkForm(this);">
							<fieldset class="account-info">
								<label> 
									Username 
									<input class="input-fields" type="text" name="username" required="true">
								</label> 
								<label> 
									Password 
									<input class="input-fields" type="password" name="password" required="true">
								</label>
								<label> 
									Password again
									<input class="input-fields" type="password" name="passwordRepeat" required="true">
								</label>
							</fieldset>
							
							<div class="account-login-btn">
								<input class="blue-style-btn" type="submit" name="submit" value="Sign up">
							</div>
							
							<!-- Cross-site request forgery (a one-click attack or session riding ) -->
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							
							<div class="account-register-btn">
								<input class="blue-style-btn" type="button" value="Back to login" onclick="location.replace('<%=request.getContextPath()%>/login')" />
							</div>
						</form>
					</div>

				</fieldset>
			</div>
		</div>


		<div id="footer">
			<div id="footer-inline-list">
				<ul>
					<li>© 2014 Bart Bien</li>
					<li><a href="http://www.phoenixjcam.com" target="_blank">phoenixjcam.com</a></li>
					<li><a href="https://github.com/bartbien" target="_blank">github.com/bartbien</a></li>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>