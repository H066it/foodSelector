<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/modal/udtPwdModal.jsp" %>
<%@ include file="/WEB-INF/jsp/modal/delPwdModal.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>CRUD form</title>
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

					<!-- Section -->
						<section>
							<div class="inner">
								<header>
									<h1>View</h1>
								</header>
								
								<h3>Title : ${dto.BTitle }</h3>
								
								<h4>Writer : ${dto.BWriter }</h4>

								<hr>
	
								${dto.BContent }
								
								<div align="right">
									<a href="#udtPwdModal" role="button" class="btn" data-toggle="modal">수정</a>
									<a href="list.html"><button type="button">목록</button></a>
									<a href="#delPwdModal" role="button" class="btn" data-toggle="modal">삭제</a>
								</div>
							</div>
						</section>

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