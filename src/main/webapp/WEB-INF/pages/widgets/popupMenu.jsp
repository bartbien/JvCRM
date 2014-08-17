<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/res/contextMenu/css/jquery.contextMenu.css">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/res/contextMenu/js/jquery.ui.position.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/res/contextMenu/js/jquery.contextMenu.js"></script>
	
<script type="text/javascript" class="init">
	
	$(document).ready(function() {
	
		$.contextMenu({
	        selector: '.context-menu-one', 
	        callback: function(key, options) {
	            var m = "clicked: " + key;
	            window.console && console.log(m) || alert(m); 
	        },
	        items: {
	            "edit": {name: "Edit", icon: "edit"},
	            "delete": {name: "Delete", icon: "delete"},
	            "test": {name: "testName", icon: "testIcon"}
	        }
	    });
	});
	
</script>

<style>
	.popupMenu{
		padding: 50px; 
		margin: 30px;
		background: orange;
		font: 20px bold arial;
	}
</style>


<div id="click" class="context-menu-one popupMenu" style="border: solid 5px black; ">jquery popup menu</div>




