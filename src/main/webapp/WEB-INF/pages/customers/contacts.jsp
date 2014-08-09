<%@ taglib prefix="tags" uri="/WEB-INF/pages/tags/NavigationPanel.tld"%>

<tags:NavigationPanel
	action="${pageContext.request.contextPath}/dashboard"
	pageNumber="${pageNumber}" pagesCount="${pagesCount}" pageSize="${pageSize}" />
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

	<c:forEach var="el" items="${texts}">
		<h1>${el.sales}</h1>
	</c:forEach>







	<form name='email' action="${pageContext.request.contextPath}/email"
		method="get">
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