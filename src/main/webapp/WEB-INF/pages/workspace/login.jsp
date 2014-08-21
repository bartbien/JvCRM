<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/res/container/css/account.css" />

<jsp:include page="../headers/login.jsp" />
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
				<div class="account-info">
					<label>Username</label> 
					<input class="input-fields" type="text" name="username" required="true" autofocus="autofocus">
					<label>Password</label>
					<input class="input-fields" type="password" name="password" required="true">
				</div>
				
				<div class="account-login-btn">
					<input class="blue-style-btn" type="submit" name="submit" value="Login">
				</div>
				
				<div class="account-register-btn">
					<input class="blue-style-btn" type="button" value="Sign up" onclick="location.replace('<%=request.getContextPath()%>/register')" />
				</div>
			</form>
		</div>
	</fieldset>
</div>
