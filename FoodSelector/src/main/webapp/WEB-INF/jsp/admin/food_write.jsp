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
								
								<c:if test="${dto.FId == null}">
									<c:url var="destination" value="/food_write"></c:url>
								</c:if>
								<%-- <c:if test="${dto.FId != null}">
									<c:url var="destination" value="/${dto.BId }/update"></c:url>
								</c:if>
								 --%>
								<form action="${destination }" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<h3>Name : <input type="text" name="fname" value="${dto.Fname }"></input></h3>
									<h5>Ingredients : <input type="text" name="ingredients" id="ingredients" value="${dto.ingredients}"></input></h5>
									
									<hr>
		
									<input type="hidden" name="recipe" id="recipe" value="${dto.Recipe}"></input>
		
									Recipe : <textarea name="editor" id="editor"></textarea>
									<h5>Tag :
											<select name="tag">
												<option value="koreanFood">한식</option>
												<option value="chineseFood">중식</option>
												<option value="japaneseFood">일식</option>
												<option value="westernFood">양식</option>
												<option value="snack">간식</option>
												<option value="flourBasedFood">분식</option>
											</select>
									</h5>
									
										
									<div align="right">
										<button type="submit" id="subBtn" >저장</button>
										<a href="../list"><button type="button">취소</button></a>
									</div>
									<script>
										$(function() {
											CKEDITOR.replace('editor');
							
											$('#editor').html($('#recipe').val());
											$('#subBtn').on('click', function(event) {
												var data = CKEDITOR.instances.editor.getData();
												$('#recipe').val(data);
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