<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/res/table/css/jquery.dataTables.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/res/table/css/shCore.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/res/table/css/demo.css">

<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/res/table/js/jquery.js"></script> --%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/res/table/js/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/res/table/js/shCore.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/res/table/js/demoTable.js"></script>

<script type="text/javascript" class="init">

	function refreshTable()
	{
		$('#example').dataTable( {
		    "ajax": '${pageContext.request.contextPath}/employee/getEmployers?pageNumber=3&pageSize=10',
		    "columns": [
                { "data": "name" },
                { "data": "position" },
				{ "data": "office" },
				{ "data": "age" },
				{ "data": "start_date" },
				{ "data": "salary" },
				{ "data": "edit" },
				{ "data": "delete" }
            ]
		} );
	}

	$(document).ready(function() {
		$('#example').css('display', 'block').dataTable();
	});
	
</script>

<div class="dt-example">
	<div class="container">
		<table id="example" class="display" style="display: none;" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Name</th>
					<th>Position</th>
					<th>Office</th>
					<th>Age</th>
					<th>Start date</th>
					<th>Salary</th>
					<th>edit</th>
					<th>delete</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>Name</th>
					<th>Position</th>
					<th>Office</th>
					<th>Age</th>
					<th>Start date</th>
					<th>Salary</th>
					<th>edit</th>
					<th>delete</th>
				</tr>
			</tfoot>
			<%-- <tbody>
				<c:forEach var="employee" items="${ employees }">
					<tr class="alt">
						<td>${ employee.emplId }</td>
						<td>${ employee.firstName }</td>
						<td>${ employee.lastName }</td>
						<td>${ employee.lastName }</td>
						<td>${ employee.lastName }</td>
						<td>${ employee.lastName }</td>
						<td><a href="${pageContext.request.contextPath}/employee/edit/${employee.emplId}.html">Edit</a>  </td>
						<td><a href="${pageContext.request.contextPath}/employee/delete/${employee.emplId}.html">Delete</a> </td>
					</tr>
				</c:forEach>
			</tbody> --%>
			<tbody></tbody>
		</table>
		<script type="text/javascript">
				refreshTable();
		</script>
	</div>
</div>