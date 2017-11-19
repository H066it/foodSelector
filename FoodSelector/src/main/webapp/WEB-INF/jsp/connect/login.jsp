<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	login

	<form action="login" method="POST">
		<input type="hidden" name="_csrf" value="${_csrf.token}">
		
		<div>
			<p>id : <input type="text" name="username"></p>
			<p>pw : <input type="password" name="password"></p>
		</div>
		<div>
			<p>Remember me : <input type="checkbox" name="remember-me"></p>
		</div>
		<p>
			<button type="submit">로그인</button>
			<a href="signUp"><button type="button">회원가입</button></a>
			<a href="index"><button type="button">취소</button></a>
		</p>
	</form>

</body>
</html>