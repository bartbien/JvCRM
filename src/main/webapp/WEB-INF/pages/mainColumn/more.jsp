<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

	<h1>Edit team page</h1>
	<p>Here you can edit the existing team.</p>
	<p>${message}</p>
	<form:form method="POST" commandName="team" 
				action="${pageContext.request.contextPath}/employee/edit/${employee.id}.html">
		<table>
			<tbody>
				<tr>
					<td>Name:</td>
					<td><input path="name" /></td>
				</tr>
				<tr>
					<td>Rating:</td>
					<td><input path="rating" /></td>
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