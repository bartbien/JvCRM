<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Login Page</title>

<!-- container css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/res/container/css/core.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/res/container/css/account.css" />
<!-- container css -->

</head>
<body onload='document.loginForm.username.focus();'>

	<div id="main">
		<div id="container">

			<div id="header">
				<h3>Spring + Hibernate + Annotation = mini CRM system</h3>
			</div>

			<div id="line"></div>

			<div id="body">
				<fieldset id="form-container">
					<legend id="legend">
						<b>Sign in form:</b>
					</legend>

					<div>
						<!-- wrong login data -->
						<c:if test="${not empty error}">
							<div class="error">${error}</div>
						</c:if>

						<!-- user created successfully -->
						<c:if test="${not empty userCreated}">
							<div class="msg">${userCreated}</div>
						</c:if>

						<!-- logged out -->
						<c:if test="${not empty msg}">
							<div class="msg">${msg}</div>
						</c:if>

						<!--  j_spring_security_check is a Servlet where the 
							actual authentication is made and you must map the action of your login form to this Servlet. -->

						<!-- <form name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'> -->

						<form class="account-form" name="loginForm" action="<c:url value='/login' />" method='POST'>
							<fieldset class="account-info">
								<label> 
									Username 
									<input class="input-fields" type="text" name="username" required="true">
								</label> 
								<label> 
									Password 
									<input class="input-fields" type="password" name="password" required="true">
								</label>
							</fieldset>
							
							<div class="account-login-btn">
								<input class="blue-style-btn" type="submit" name="submit" value="Login">
							</div>
							
							<!-- Cross-site request forgery (a one-click attack or session riding ) -->
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							
							<div class="account-register-btn">
								<input class="blue-style-btn" type="button" value="Sign up" onclick="location.replace('<%=request.getContextPath()%>/register')" />
							</div>
						</form>
					</div>

				</fieldset>
			</div>
		</div>


		<div id="footer">
			<div id="footer-inline-list">
				<ul>
					<li>� 2014 Bart Bien</li>
					<li><a href="http://www.phoenixjcam.com" target="_blank">phoenixjcam.com</a></li>
					<li><a href="https://github.com/bartbien" target="_blank">github.com/bartbien</a></li>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>

