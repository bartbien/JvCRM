<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<h1>Edit employee</h1>


<form:form method="POST" commandName="employee"
	action="${pageContext.request.contextPath}/employee/edit/${employee.id}">
	<table>
		<tbody>
			<tr>
				<td>Last Name:</td>
				<td><form:input path="lastName" /></td>
			</tr>
			<tr>
				<td>First Name:</td>
				<td><form:input path="firstName" /></td>
			</tr>
			<tr>
				<td>Position:</td>
				<td><form:input path="position" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Edit" /></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form:form>

</body>
</html>