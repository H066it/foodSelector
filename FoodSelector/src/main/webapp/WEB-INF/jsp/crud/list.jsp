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
								
								<div align="center">
								  <ul class="tabs">
									  <c:choose>
									  	<c:when test="${keyword == null }">
										    <li><a href="list?page=1">&lt;&lt;</a></li>
										    <c:if test="${pageVo.firPageNum - 1 > 1}">
												<li><a href="list?page=${pageVo.firPageNum - 1}">&lt;</a></li>
											</c:if>
											<c:forEach begin="${pageVo.firPageNum }"
												end="${pageVo.lstPageNum }" step="1" varStatus="page">
												<li><a href="list?page=${pageVo.firPageNum -1 + page.count}">
														${pageVo.firPageNum -1 + page.count} </a></li>
											</c:forEach>
											<c:if test="${pageVo.firPageNum + 10 <= pageVo.totalPageNum}">
												<li><a href="list?page=${pageVo.firPageNum + 10}">&gt;</a></li>
											</c:if>
										    <li><a href="list?page=${pageVo.totalPageNum }">&gt;&gt;</a></li>
									  	</c:when>
									  	
									  	<c:when test="${keyword != null }">
										    <li><a href="search?page=1
										    	&searchType=${searchType }&keyword=${keyword }">&lt;&lt;</a></li>
										    <c:if test="${pageVo.firPageNum - 1 > 1}">
												<li><a href="search?page=${pageVo.firPageNum - 1}
												&searchType=${searchType }&keyword=${keyword }">&lt;</a></li>
											</c:if>
											<c:forEach begin="${pageVo.firPageNum }"
												end="${pageVo.lstPageNum }" step="1" varStatus="page">
												<li><a href="search?page=${pageVo.firPageNum -1 + page.count}
															&searchType=${searchType }&keyword=${keyword }">
														${pageVo.firPageNum -1 + page.count} </a></li>
											</c:forEach>
											<c:if test="${pageVo.firPageNum + 10 <= pageVo.totalPageNum}">
												<li><a href="search?page=${pageVo.firPageNum + 10}
															&searchType=${searchType }&keyword=${keyword }">&gt;</a></li>
											</c:if>
										    <li><a href="search?page=${pageVo.totalPageNum }
											    		&searchType=${searchType }&keyword=${keyword }">&gt;&gt;</a></li>
									  	</c:when>
									  </c:choose>
								  </ul>
								</div>
													
								<div align="right">
									<a href="write"><button>글 쓰기</button></a>
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