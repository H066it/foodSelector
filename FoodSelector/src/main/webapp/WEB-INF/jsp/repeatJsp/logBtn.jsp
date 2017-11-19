<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<sec:authorize access="isAnonymous()">
		<li><a href="login"><span class="icon fa fa-user"></span></a></li>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_USER')">
		<li>
			<form action="logout" method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<button type="submit" class="icon fa fa-user-times"></button>
			</form>
		</li>
	</sec:authorize>
</body>
</html>