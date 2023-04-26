<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/octicons/3.3.0/octicons.min.css"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<style>
/* 헤더 및 sideBar 부분 스타일 - 건들지 말것 */
* {
	box-sizing: border-box;
	padding: 0px;
}

.body {

	margin:auto;
	
}

.sideList{
	border: 1px solid black;
}


/* 하단부터 메인부분 스타일 작성 요망 */
.contents {
	padding: 0px;

	
}

.contents1>div {
	height: 100%;
}

.contents2>div {
	height: 100%;
}


</style>
</head>
<body>
	<div class="container-fluid themed-container m-0 g-0">
		<!-- 헤더부분 건들지 말것 -->
		<jsp:include page="header.jsp" flush="false"></jsp:include>



		<!-- body 부분 row div 건들지 말것 -->
		<div class="row g-0 justify-content-center body">
		<!-- sideBar부분 건들지 말것 -->
			<jsp:include page="sideBar.jsp" flush="false"></jsp:include>

			<div class="col-12 col-lg-9 g-0 themed-grid-col bodyContents">
				<!-- Main 내용 부분 하단부터 수정 요망 -->

				<div class="col-12 themed-grid-col contents">
					<div class="col-12 col-lg-12 themed-grid-col row contents1">
						<div class="col-12 col-lg-9 themed-grid-col carousel">
							<div id="carouselIndicators" class="carousel slide"
								data-bs-ride="true">
								<div class="carousel-indicators">
									<button type="button" data-bs-target="#carouselIndicators"
										data-bs-slide-to="0" class="active" aria-current="true"
										aria-label="Slide 1"></button>
									<button type="button" data-bs-target="#carouselIndicators"
										data-bs-slide-to="1" aria-label="Slide 2"></button>
									<button type="button" data-bs-target="#carouselIndicators"
										data-bs-slide-to="2" aria-label="Slide 3"></button>
								</div>
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img
											src="https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?cs=srgb&dl=pexels-ash-376464.jpg&fm=jpg"
											class="d-block w-100 h-100" alt="...">
									</div>
									<div class="carousel-item">
										<img
											src="https://img.bestrecipes.com.au/iyddCRce/br/2019/02/1980-crunchy-chicken-twisties-drumsticks-951509-1.jpg"
											class="d-block w-100 h-100" alt="...">
									</div>
									<div class="carousel-item">
										<img
											src="https://media-cdn.tripadvisor.com/media/photo-s/15/03/79/e3/otto-s-anatolian-food.jpg"
											class="d-block w-100 h-100" alt="...">
									</div>
								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselIndicators" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselIndicators" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						</div>



						<div class="col-12 col-lg-3 themed-grid-col sideList">sideList</div>
					</div>




					<div class="col-12 col-lg-12 themed-grid-col row contents2">


						<div class="row row-cols-1 row-cols-md-3 g-4">
							<div class="col-12 col-lg-4 themed-grid-col">
								<div class="card h-80">
									<img src="..." class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">Card title</h5>
									</div>
									<div class="card-footer">
										<small class="text-muted">Last updated 3 mins ago</small>
									</div>
								</div>
							</div>
							<div class="col-12 col-lg-4 themed-grid-col">
								<div class="card h-80">
									<img src="..." class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">Card title</h5>
									</div>
									<div class="card-footer">
										<small class="text-muted">Last updated 3 mins ago</small>
									</div>
								</div>
							</div>
							<div class="col-12 col-lg-4 themed-grid-col">
								<div class="card h-80">
									<img src="..." class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">Card title</h5>
									</div>
									<div class="card-footer">
										<small class="text-muted">Last updated 3 mins ago</small>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
		<!-- body main 수정 여기까지, 하단 건들지 말것. -->
			</div>
		</div>
	
	<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</div>

</body>
</html>