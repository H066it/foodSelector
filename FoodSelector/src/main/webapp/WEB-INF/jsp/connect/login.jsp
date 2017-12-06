<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>Login - Snapshot by TEMPLATED</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="/webjars/bootstrap/3.3.7/css/bootstrap.min.css" media="screen">
</head>
<body>	
	<div class="page-wrap">

			<!-- Nav -->
				<jsp:include page="/WEB-INF/jsp/repeatJsp/navbar.jsp"></jsp:include>
			
			<!-- Main -->
				<section id="main">

					<!-- Header -->
						<header id="header">
							<div>Snapshot <span>by TEMPLATED</span></div>
						</header>	
		
					<!--  Login -->
						<div class="inner">
							<form action="login" method="POST" style="width: 500px">
								<input type="hidden" name="_csrf" value="${_csrf.token}">
								
								<div style="width: 50rem">
									<p>id : <input type="text" name="username"></p>
									<p>pw : <input type="password" name="password"></p>
								</div>
								<div>
									<p>Remember me : <input type="checkbox" name="remember-me"></p>
								</div>
								<p align="right">
									<button type="submit">로그인</button>
									<a href="signUp"><button type="button">회원가입</button></a>
									<a href="index"><button type="button">취소</button></a>
								</p>
							</form>
						</div>
					<!-- Footer -->
						<footer id="footer">
							<div class="copyright">
								&copy; Untitled Design: <a href="https://templated.co/">TEMPLATED</a>. Images: <a href="https://unsplash.com/">Unsplash</a>.
							</div>
						</footer>
				</section>
			</div>
				
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.poptrox.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script type="text/javascript" src="/webjars/bootstrap/3.3.7/js/bootstrap.js"></script>

</body>
</html>