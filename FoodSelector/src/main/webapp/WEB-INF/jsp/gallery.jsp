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
				<nav id="nav">
					<ul>
						<li><a href="index.html"><span class="icon fa-home"></span></a></li>
						<li><a href="gallery.html" class="active"><span class="icon fa-camera-retro"></span></a></li>
						<li><a href="list.html"><span class="icon fa-commenting-o"></span></a></li>
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
<%-- 											<c:forEach var="num" begin="1" end="${count }"> --%>
											<c:forEach items="${tags }" var="tag" varStatus="num">
												<div class="media all ${tag.tag }">
													<a href="#foodModal" role="button" class="btn foodbtn" data-toggle="modal" data-tag="all">
														<img src="images/thumbs/0${num.count}.jpg" alt="" onclick="transferFId(${num.count});"/>
													</a>
												</div>
											</c:forEach>
										</div>
								</div>
						</section>

					<!-- Contact -->
						<section id="contact">
							<!-- Social -->
								<div class="social column">
									<h3>About Me</h3>
									<p>Mus sed interdum nunc dictum rutrum scelerisque erat a parturient condimentum potenti dapibus vestibulum condimentum per tristique porta. Torquent a ut consectetur a vel ullamcorper a commodo a mattis ipsum class quam sed eros vestibulum quisque a eu nulla scelerisque a elementum vestibulum.</p>
									<p>Aliquet dolor ultricies sem rhoncus dolor ullamcorper pharetra dis condimentum ullamcorper rutrum vehicula id nisi vel aptent orci litora hendrerit penatibus erat ad sit. In a semper velit eleifend a viverra adipiscing a phasellus urna praesent parturient integer ultrices montes parturient suscipit posuere quis aenean. Parturient euismod ultricies commodo arcu elementum suspendisse id dictumst at ut vestibulum conubia quisque a himenaeos dictum proin dis purus integer mollis parturient eros scelerisque dis libero parturient magnis.</p>
									<h3>Follow Me</h3>
									<ul class="icons">
										<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
									</ul>
								</div>

							<!-- Form -->
								<div class="inner">
									<h3>Get in Touch</h3>
									<form action="#" method="post">
										<div class="field half first">
											<label for="name">Name</label>
											<input name="name" id="name" type="text" placeholder="Name">
										</div>
										<div class="field half">
											<label for="email">Email</label>
											<input name="email" id="email" type="email" placeholder="Email">
										</div>
										<div class="field">
											<label for="message">Message</label>
											<textarea name="message" id="message" rows="6" placeholder="Message"></textarea>
										</div>
										<ul class="actions">
											<li><input value="Send Message" class="button" type="submit"></li>
										</ul>
									</form>
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