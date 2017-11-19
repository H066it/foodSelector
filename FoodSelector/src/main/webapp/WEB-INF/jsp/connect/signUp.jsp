<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	signUp

	<form action="signUp" method="POST">
		<input type="hidden" name="_csrf" value="${_csrf.token}">
		
		<div>
			<p>id : <input type="text" name="id"></p>
			<p>username : <input type="text" name="username"></p>
			<p>password : <input type="password" name="password"></p>
		</div>
		<p>
			<button type="submit">회원가입</button>
			<button type="button" onclick="history.back();">취소</button>
		</p>
	</form>

</body>
</html>