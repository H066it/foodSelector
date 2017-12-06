<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAnonymous()">
	<li><a href="login"><span class="icon fa fa-user"></span></a></li>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_USER')">
	<li>
		<form action="logout" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<button type="submit" class="icon fa fa-user-times"></button>
		</form>
	</li>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<li>
		<form action="logout" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<button type="submit" class="icon fa fa-user-times"></button>
		</form>
	</li>
	<li><a href="food_write"><span class="icon fa fa-pencil"></span></a></li>
</sec:authorize>
