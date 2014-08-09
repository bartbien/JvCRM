<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>NavigationBar</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/res/container/css/core.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/container/css/dashboard.css" />

<!-- expander stuff -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/expander/css/jqx.base.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/res/expander/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/expander/js/demos.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/expander/js/jqxcore.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/expander/js/jqxnavigationbar.js"></script>
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

<title>${title}</title>
</head>
<body>
	<div id="main">
		<div id="container">
			<jsp:include page="${workspace}.jsp" />
		</div>
		<!-- --------------------------------------------------- -->
		<!-- footer												 -->
		<!-- --------------------------------------------------- -->
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