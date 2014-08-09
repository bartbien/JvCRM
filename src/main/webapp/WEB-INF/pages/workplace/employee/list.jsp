<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" uri="/WEB-INF/pages/tags/NavigationPanel.tld"%>

<tags:NavigationPanel
	action="${pageContext.request.contextPath}/employee/list"
	pageNumber="${pageNumber}" pagesCount="${pagesCount}" pageSize="${pageSize}" />
<table id="customers">
	<thead>
		<tr>
			<th width="5%">Employee ID</th>
			<th width="30%">First Name</th>
			<th width="30%">Last Name</th>
			<th width="30%">Options</th>
		</tr>
	</thead>
	<c:forEach var="employee" items="${ employees }">
		<tr class="alt">
			<td>${ employee.emplId }</td>
			<td>${ employee.firstName }</td>
			<td>${ employee.lastName }</td>
			<td><a
				href="${pageContext.request.contextPath}/employee/edit/${employee.emplId}.html">Edit</a>
				<br /> <a
				href="${pageContext.request.contextPath}/employee/delete/${employee.emplId}.html">Delete</a>
				<br /></td>
		</tr>
	</c:forEach>
</table>