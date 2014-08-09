<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- container stuff -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/res/container/css/core.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/res/container/css/dashboard.css" />
<!-- container stuff -->

<!-- expander stuff -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/expander/css/jqx.base.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/res/expander/js/jquery-1.10.2.min.js"></script>
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


<jsp:include page="headers/logout.jsp" />
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
						<div style='margin-left: 4px; float: left;'>Customers</div>
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
						<div style='margin-left: 4px; float: left;'>Supply</div>
					</div>
				</div>
				<div>
					<ul>
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
						<div style='margin-left: 4px; float: left;'>Employee</div>
					</div>
				</div>
				<div>
					<ul>
						<li><a href='<%=request.getContextPath()%>/employee/list'>List
								of employees</a></li>
						<li><a href='<%=request.getContextPath()%>/employee/jqTable'>jq Table</a></li>
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
		<jsp:include page="${maintenance}.jsp" />
	</div>
</div>