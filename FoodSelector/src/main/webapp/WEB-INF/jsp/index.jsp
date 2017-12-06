<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/modal/modal.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="random" class="java.util.Random" scope="application" />
<!DOCTYPE HTML>
<!--
	Snapshot by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Snapshot by TEMPLATED</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="/webjars/bootstrap/3.3.7/css/bootstrap.min.css">
	</head>
	<body>
		<div class="page-wrap">

			<!-- Nav -->
				<jsp:include page="/WEB-INF/jsp/repeatJsp/navbar.jsp"></jsp:include>
				
			<!-- Main -->
				<section id="main">

					<!-- Banner -->
						<section id="banner">
							<div class="inner">
								<h1>FoodSelector에 방문하신 것을 환영합니다!</h1>
								
								<c:if test="${auth != null }">
									<h3>반갑습니다, ${auth}님</h3>
								</c:if>
								<p>
									<a href="#foodModal" role="button" class="btn foodbtn" data-toggle="modal"
									 data-tag="all" onclick="transferFId(${random.nextInt(count) + 1 });">
										<font size="5rem" color="#D1E9F4">무엇</font>
									</a>을 드실지 고민이신가요?
								</p>
								<ul class="actions">
									<li><a href="#galleries" class="button alt scrolly big">Continue</a></li>
								</ul>
							</div>
						</section>

					<!-- Gallery -->
						<section id="galleries">

							<!-- Photo Galleries -->
								<div class="gallery">
									<header class="special">
										<h2>ᕕ( ᐛ )ᕗ메뉴를 선택해주세요٩( ᐛ )و</h2>
									</header>
									<div class="content">
										<c:set var="randomVal" value="${random.nextInt(count/3) }"/>
										<c:forEach var="num" begin="${randomVal }" end="${randomVal + 3 }">
											<div class="media all">
												<a href="#foodModal" role="button" class="btn foodbtn" data-toggle="modal" data-tag="all">
													<c:forEach items="${files }" var="foodPhoto" begin="${num}" end="${num}">
														<img src="images/thumbs/${foodPhoto.mergedName }" alt="" onclick="transferFId(${num + 1});"/>
													</c:forEach>
												</a>
											</div>
										</c:forEach>
									</div>
									<footer>
										<a href="gallery.html" class="button big">모두 보기</a>
									</footer>
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