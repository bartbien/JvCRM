<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>

<title>NavigationBar</title>

<!-- container stuff -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/res/container/css/core.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/res/container/css/dashboard.css" />
<!-- end of container stuff -->

<!-- expander stuff -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/res/expander/css/jqx.base.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/res/expander/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/res/expander/js/demos.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/res/expander/js/jqxcore.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/res/expander/js/jqxnavigationbar.js"></script>
<!-- end of expander stuff -->

<script type="text/javascript">
	$(document).ready(function() {
		// Create jqxNavigationBar.
		$("#jqxNavigationBar").jqxNavigationBar({
			width : 250,
			expandMode : 'multiple',
			expandedIndexes : [ 0, 1, 2, 3 ]
		});
	});

	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>

</head>
<body>
	<div id="main">
		<div id="container">
			<!-- --------------------------------------------------- -->
			<!-- header with logout url								 -->
			<!-- --------------------------------------------------- -->
			<div id="header">
				<div id="header-user-panel">
					<c:url value="/logout" var="logoutUrl" />
					<form action="${logoutUrl}" method="post" id="logoutForm">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>

					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<h2>
							User: ${pageContext.request.userPrincipal.name} &nbsp &nbsp 
							<a href="javascript:formSubmit()" id="header-link"> Logout</a>
						</h2>
					</c:if>
				</div>
			</div>

			<div id="line"></div>

			<div id="body">

				<!-- --------------------------------------------------- -->
				<!-- jq expander 								 		 -->
				<!-- --------------------------------------------------- -->
				<div id="leftColumn">
					<div style='width: 250px;' id='jqxWidget'>
						<div id="jqxNavigationBar">
							<!-- -------------------------      -------------------------- -->
							<div>
								<div style='margin-top: 2px;'>
									<div style='float: left;'>
										<img alt='Mail'
											src='<%=request.getContextPath()%>/res/expander/images/mailIcon.png' />
									</div>
									<div style='margin-left: 4px; float: left;'>Sales</div>
								</div>
							</div>
							<div>
								<ul>
									<li><a href='#'>Contacts</a></li>
									<li><a href='#'>Adress's</a></li>
									<li><a href='#'>Adress's</a></li>
									<li><a href='#'>Products</a></li>
									<li><a href='#'></a></li>
								</ul>
							</div>
							<!-- -------------------------      -------------------------- -->
							<div>
								<div style='margin-top: 2px;'>
									<div style='float: left;'>
										<img alt='Mail'
											src='<%=request.getContextPath()%>/res/expander/images/contactsIcon.png' />
									</div>
									<div style='margin-left: 4px; float: left;'>Workplace</div>
								</div>
							</div>
							<div>
								<ul>
									<li><a href='<%=request.getContextPath()%>/workplace/employeeList'>Employees List</a></li>
									<li><a href='#'>Adress's</a></li>
									<li><a href='#'>Messages</a></li>
									<li><a href='#'>Documents</a></li>
									<li><a href='#'>Tasks</a></li>
									<li><a href='#'>Reports Made</a></li>
								</ul>
							</div>
							<!-- -------------------------      -------------------------- -->
							<div>
								<div style='margin-top: 2px;'>
									<div style='float: left;'>
										<img alt='Mail'
											src='<%=request.getContextPath()%>/res/expander/images/tasksIcon.png' />
									</div>
									<div style='margin-left: 4px; float: left;'>Tasks</div>
								</div>
							</div>
							<div>
								<ul>
									<li><a href='#'>Simple List</a></li>
									<li><a href='#'>Detailed List</a></li>
									<li><a href='#'>Active Tasks</a></li>
									<li><a href='#'>Phone List</a></li>
								</ul>
							</div>
							<!-- -------------------------      -------------------------- -->
							<div>
								<div style='margin-top: 2px;'>
									<div style='float: left;'>
										<img alt='Mail'
											src='<%=request.getContextPath()%>/res/expander/images/notesIcon.png' />
									</div>
									<div style='margin-left: 4px; float: left;'>Notes</div>
								</div>
							</div>
							<div>
								<ul>
									<li><a href='#'>Icons</a></li>
									<li><a href='#'>Notes List</a></li>
									<li><a href='#'>Last Seven Days</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- --------------------------------------------------- -->
				<!-- main table to display data from db or files 		 -->
				<!-- --------------------------------------------------- -->
				<div id="mainColumn">
					<table id="customers">
					
						<thead>
							<tr>
								<th width="10%">Employee ID</th>
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
								<td>
									<a href="${pageContext.request.contextPath}/team/edit/${team.id}.html">Edit</a>   <br />
									<a href="${pageContext.request.contextPath}/team/delete/${team.id}.html">Delete</a>   <br />
								</td>
							</tr>
						</c:forEach>
						
					</table>

					<div id="submitPanel">
						<form action="">
							<button>test button</button>
							<button>test button</button>
							<button>test button</button>
						</form>
					</div>

				</div>
			</div>
		</div>
		
		
		<!-- --------------------------------------------------- -->
		<!-- footer												 -->
		<!-- --------------------------------------------------- -->
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