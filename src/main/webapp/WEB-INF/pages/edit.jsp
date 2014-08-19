
<h1>Edit employee</h1>
<form method="POST" action="${pageContext.request.contextPath}/employee/edit">
	<table>
		<tbody>
			<tr>
				<td>Last Name:</td>
				<td><input name="lastName" /></td>
			</tr>
			<tr>
				<td>First Name:</td>
				<td><input name="firstName" /></td>
			</tr>
			<tr>
				<td>Position:</td>
				<td><input name="position" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Edit" /></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	
</form>
</body>
</html>