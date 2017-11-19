<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>CRUD form</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="/webjars/bootstrap/3.3.7/css/bootstrap.min.css" media="screen">
		
		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.poptrox.min.js"></script>
			<script src="../assets/js/jquery.scrolly.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
</head>
<body>

	<div class="page-wrap">

			<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="../index.html"><span class="icon fa-home"></span></a></li>
						<li><a href="../gallery.html"><span class="icon fa-camera-retro"></span></a></li>
						<li><a href="../list.html" class="active"><span class="icon fa-commenting-o"></span></a></li>
						<li><a href="../generic.html"><span class="icon fa-file-text-o"></span></a></li>
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
									<h1>Form</h1>
								</header>
								
								<c:if test="${dto.BId == null}">
									<c:url var="destination" value="/write"></c:url>
								</c:if>
								<c:if test="${dto.BId != null}">
									<c:url var="destination" value="/${dto.BId }/update"></c:url>
								</c:if>
								
								<form action="${destination }" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<h3>Title : <input type="text" name="bTitle" value="${dto.BTitle }"></input></h3>
									
									<c:if test="${dto.BId == null }">
										<h4>Writer : <input type="text" name="bWriter" value="${auth }" readonly="readonly"></input></h4>
										<h4>Password : <input type="password" name="bPassword"></input></h4>
									</c:if>
									
									<hr>
		
									<input type="hidden" name="bContent" id="bContent" value="${dto.BContent}"></input>
		
									<textarea name="editor" id="editor"></textarea>
										
									<div align="right">
										<button type="submit" id="subBtn" >저장</button>
										<a href="../list"><button type="button">취소</button></a>
									</div>
									<script>
										$(function() {
											CKEDITOR.replace('editor');
							
											$('#editor').html($('#bContent').val());
											$('#subBtn').on('click', function(event) {
												var data = CKEDITOR.instances.editor.getData();
												$('#bContent').val(data);
											})
										})
									</script>
								</form>								
																
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

			
</body>
</html>