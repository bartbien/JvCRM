<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SignUp</title>

<script type="text/javascript">
	function checkForm(form) {
		if (form.username.value == "") {
			alert("Error: Username cannot be blank!");
			form.username.focus();
			return false;
		}
		var re = /^\w+$/;
		if (!re.test(form.username.value)) {
			alert("Error: Username must contain only letters, numbers and underscores!");
			form.username.focus();
			return false;
		}
		if (form.password.value != "" && form.password.value == form.passwordRepeat.value) {
			if (form.password.value.length < 6) {
				alert("Error: Password must contain at least six characters!");
				form.password.focus();
				return false;
			}
			if (form.password.value == form.username.value) {
				alert("Error: Password must be different from Username!");
				form.password.focus();
				return false;
			}
			re = /[0-9]/;
			if (!re.test(form.password.value)) {
				alert("Error: password must contain at least one number (0-9)!");
				form.password.focus();
				return false;
			}
			re = /[a-z]/;
			if (!re.test(form.password.value)) {
				alert("Error: password must contain at least one lowercase letter (a-z)!");
				form.password.focus();
				return false;
			}
			re = /[A-Z]/;
			if (!re.test(form.password.value)) {
				alert("Error: password must contain at least one uppercase letter (A-Z)!");
				form.password.focus();
				return false;
			}
		} else {
			alert("Error: Please check that you've entered and confirmed your password!");
			form.password.focus();
			return false;
		}
		
		return true;
	}
</script>

<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
</style>

</head>
<body>
	<h1>Sign Up page</h1>

	<div id="login-box">

		<h3>Create your personal account</h3>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>

		<!-- <form name='signupForm' action="<c:url value='/j_spring_security_check' />" method='POST'> -->

		<form name='signupForm'
			action="${pageContext.request.contextPath}/adduser" 
			method='POST' onsubmit="return checkForm(this);" >

			<table>
				<tr>
					<td>User name:</td>
					<td><input type='text' name='username' required="true"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type='password' name='password' required="true" /></td>
				</tr>
				<tr>
					<td>Confirm password:</td>
					<td><input type='password' name='passwordRepeat'
						required="true" /></td>
				</tr>
				<tr>
					<td colspan='2'><input name="submit" type="submit"
						value="Sign up" /></td>
				</tr>
			</table>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

		</form>

		<input type="button" value="Back to login"
			onclick="location.replace('<%=request.getContextPath()%>/login')" />

	</div>
</body>
</html>