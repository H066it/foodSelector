<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/modal/modal.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Snapshot by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Gallery - Snapshot by TEMPLATED</title>
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

					<!-- Gallery -->
						<section id="galleries">

							<!-- Photo Galleries -->
								<div class="gallery">

									<!-- Filters -->
										<header>
											<h1>Gallery</h1>
											<ul class="tabs">
												<li><a href="#" data-tag="all" class="button active">All</a></li>
												<li><a href="#" data-tag="koreanFood" class="button">한식</a></li>
												<li><a href="#" data-tag="chineseFood" class="button">중식</a></li>
												<li><a href="#" data-tag="japaneseFood" class="button">일식</a></li>
												<li><a href="#" data-tag="westernFood" class="button">양식</a></li>
												<li><a href="#" data-tag="snack" class="button">간식</a></li>
												<li><a href="#" data-tag="flourBasedFood" class="button">분식</a></li>
											</ul>
										</header>

										<div class="content">
											<c:forEach items="${tags }" var="tag" varStatus="num">
												<div class="media all ${tag.tag }">
													<a href="#foodModal" role="button" class="btn foodbtn" data-toggle="modal" data-tag="all">
														<c:forEach items="${files }" var="foodPhoto" begin="${num.index}" end="${num.index}">
															<img src="images/thumbs/${foodPhoto.mergedName }" alt="" onclick="transferFId(${num.count});"/>												
														</c:forEach>
													</a>
												</div>
											</c:forEach>
											
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
			<script src="assets/js/transferInfo.js"></script>
			
			<script type="text/javascript">
				$(".foodbtn").bind("click", function() {
					$.ajaxSetup({
						headers: {
				            'X-CSRF-TOKEN': $("#csrfParam").val(),
				            'Content-Type': 'application/json;charset=UTF-8'
				        }
				    });
					
					var data = {
						'fId' : $("#fId").val()
					}
					
					$.ajax({
						url : "/food_info",
						type : "post",
						data : JSON.stringify(data),
						success : function(data){							
							$("#myModalLabel").html(data.fname);
							$("#ingredients").html(data.ingredients);
							$("#recipe").html(data.recipe);
							
							if(!data){
			                    alert("정보가 미등록 된 상태입니다.");
			                    return false;
			                }
						}						
					});				
				});
			</script>

	</body>
</html>