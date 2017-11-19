<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>List - Snapshot by TEMPLATED</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="/webjars/bootstrap/3.3.7/css/bootstrap.min.css" media="screen">
</head>
<body>

	<div class="page-wrap">

			<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="index.html"><span class="icon fa-home"></span></a></li>
						<li><a href="gallery.html"><span class="icon fa-camera-retro"></span></a></li>
						<li><a href="list.html" class="active"><span class="icon fa-commenting-o"></span></a></li>
						<li><a href="generic.html"><span class="icon fa-file-text-o"></span></a></li>
						<jsp:include page="/WEB-INF/jsp/repeatJsp/logBtn.jsp"></jsp:include>
					</ul>
				</nav>

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
									<h1>List</h1>
								</header>
								<table class="table table-striped">
									<tr align="center">
										<td>번호</td>
										<td width="50%">제목</td>
										<td>작성자</td>
										<td>작성일</td>
										<td>조회수</td>
									</tr>
									<c:forEach items="${list}" var="dto">
										<tr>
											<td>${dto.BId }</td>
											<td width="50%"><a href="/${dto.BId }">${dto.BTitle }</a></td>
											<td>${dto.BWriter }</td>
											<td>${dto.BDate }</td>
											<td>${dto.BCount }</td>
										</tr>
									</c:forEach>
								</table>
								<div align="right">
									<a href="write"><button>글 쓰기</button></a>
								</div>
							</div>
						</section>

					<!-- Contact -->
						<section id="contact">
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

</body>
</html>