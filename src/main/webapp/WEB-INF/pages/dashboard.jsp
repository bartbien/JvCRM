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
<!-- container stuff -->

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

			<div id="header">
				<div id="header-user-panel">
					<c:url value="/logout" var="logoutUrl" />

					<form action="${logoutUrl}" method="post" id="logoutForm">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>

					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<h2>
							User: ${pageContext.request.userPrincipal.name} &nbsp &nbsp <a
								href="javascript:formSubmit()" id="header-link"> Logout</a>
						</h2>
					</c:if>
				</div>
			</div>

			<div id="line"></div>

			<div id="body">

				<div id="leftColumn">
					<div style='width: 250px;' id='jqxWidget'>
						<div id="jqxNavigationBar">
							<div>
								<div style='margin-top: 2px;'>
									<div style='float: left;'>
										<img alt='Mail'
											src='<%=request.getContextPath()%>/res/expander/images/mailIcon.png' />
									</div>
									<div style='margin-left: 4px; float: left;'>Mail</div>
								</div>
							</div>
							<div>
								<ul>
									<li><a href='#'>Contacts</a></li>
									<li><a href='#'>Mails</a></li>
									<li><a href='#'>Notes</a></li>
								</ul>
							</div>
							<div>
								<div style='margin-top: 2px;'>
									<div style='float: left;'>
										<img alt='Mail'
											src='<%=request.getContextPath()%>/res/expander/images/contactsIcon.png' />
									</div>
									<div style='margin-left: 4px; float: left;'>Contacts</div>
								</div>
							</div>
							<div>
								<ul>
									<li><a href='#'>Business Cards</a></li>
									<li><a href='#'>Address Cards</a></li>
									<li><a href='#'>Detailed Address Cards</a></li>
									<li><a href='#'>Phone List</a></li>
								</ul>
							</div>
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

				<div id="mainColumn">
					<table id="customers">
						<tr>
							<th>Company</th>
							<th>Contact</th>
							<th>Country</th>
						</tr>
						<tr>
							<td>Alfreds Futterkiste</td>
							<td>Maria Anders</td>
							<td>Germany</td>
						</tr>
						<tr class="alt">
							<td>Berglunds snabbköp</td>
							<td>Christina Berglund</td>
							<td>Sweden</td>
						</tr>
						<tr>
							<td>Centro comercial Moctezuma</td>
							<td>Francisco Chang</td>
							<td>Mexico</td>
						</tr>
						<tr class="alt">
							<td>Ernst Handel</td>
							<td>Roland Mendel</td>
							<td>Austria</td>
						</tr>
						<tr>
							<td>Island Trading</td>
							<td>Helen Bennett</td>
							<td>UK</td>
						</tr>
						<tr class="alt">
							<td>Königlich Essen</td>
							<td>Philip Cramer</td>
							<td>Germany</td>
						</tr>
						<tr>
							<td>Laughing Bacchus Winecellars</td>
							<td>Yoshi Tannamuri</td>
							<td>Canada</td>
						</tr>
						<tr class="alt">
							<td>Magazzini Alimentari Riuniti</td>
							<td>Giovanni Rovelli</td>
							<td>Italy</td>
						</tr>
						<tr>
							<td>North/South</td>
							<td>Simon Crowther</td>
							<td>UK</td>
						</tr>
						<tr class="alt">
							<td>Paris spécialités</td>
							<td>Marie Bertrand</td>
							<td>France</td>
						</tr>
						<tr>
							<td>Alfreds Futterkiste</td>
							<td>Maria Anders</td>
							<td>Germany</td>
						</tr>
						<tr class="alt">
							<td>Berglunds snabbköp</td>
							<td>Christina Berglund</td>
							<td>Sweden</td>
						</tr>
						<tr>
							<td>Alfreds Futterkiste</td>
							<td>Maria Anders</td>
							<td>Germany</td>
						</tr>
						<tr class="alt">
							<td>Berglunds snabbköp</td>
							<td>Christina Berglund</td>
							<td>Sweden</td>
						</tr>
						<tr>
							<td>Alfreds Futterkiste</td>
							<td>Maria Anders</td>
							<td>Germany</td>
						</tr>
						<tr class="alt">
							<td>Berglunds snabbköp</td>
							<td>Christina Berglund</td>
							<td>Sweden</td>
						</tr>
						<tr>
							<td>Alfreds Futterkiste</td>
							<td>Maria Anders</td>
							<td>Germany</td>
						</tr>
					</table>

					<div id="submitPanel">
						<form action="">
							<button>test button</button>
							<button>test button</button>
							<button>test button</button>
						</form>
					</div>

					<!-- logout, mail, user info -->
					<div>

						<h1>TTitle : ${title}</h1>
						<h1>Message : ${message}</h1>

						<c:if test="${not empty email}">
							<h1>Email : ${email}</h1>
						</c:if>





						<form name='email'
							action="${pageContext.request.contextPath}/email" method="get">
							<table>
								<tr>
									<td>User name:</td>
									<td><input type='text' name='username' required="true">
									</td>
								</tr>
								<tr>
									<td colspan='2'><input name="submit" type="submit"
										value="Get email" /></td>
								</tr>
							</table>
						</form>
					</div>

				</div>
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