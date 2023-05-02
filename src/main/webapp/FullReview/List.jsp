<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/album/">
<link href="/FullReview/bootstrap.min.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.card {
	margin-right:30px;
	width: 30%;
	margin-bottom: 30px;
}
.card:hover{
	cursor:pointer;
} 

.btnBox {
	height: 100px;
	padding-left: 80%;
}

.writeBtn {
	width: 100px;
	height: 95px;
}

.writeBtn:hover {
	cursor: pointer;
}

/* 네비게이터 영역 */
.navigator {
	border: 1px solid black;
	height: 60px;
	width: 100%;
	text-align: center;
	margin: 20px auto 0 auto;
	padding: 10px 0px 10px;
	background-color: rgba(255, 255, 255, 0.9);
	position: fixed;
	bottom: 0;
	left: 0;
	border-top: 1px solid #fff;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	justify-content: center
}

.navigator_list {
	list-style-type: none;
	padding-right: 50px;
	margin: 0px;
	display: flex;
	justify-content: right;
	align-items: center;
}

.navigator_list_item {
	width: 30px;
	height: 30px;
	float: left;
	margin-left: 5px;
	margin-right: 5px;
}

.navigator_list_item_btn_layout {
	border: 1px solid rgb(178, 178, 178);
	width: 30px;
	height: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.item {
	font-size: 15px;
	text-decoration: none;
}

.navigator_direction_btn {
	position: relative;
	width: 100%;
	height: 100%;
	right: 0px;
	font-size: 15px;
	background-color: white;
	border: 0px;
	display: flex;
	justify-content: center;
	align-items: center;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="album py-5 bg-light">
		<div class="container">

			<div class="btnBox">
				<img src="/FullReview/writeBtn.png" class="writeBtn">
			</div>
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"
				style="padding-top: 40px;">

				<c:choose>
					<c:when test="${FullReviewList!=null}">
						<c:forEach var="reviewList" items="${FullReviewList}" varStatus="status">
<!-- 						유저 정보를 같이 받고 index로 값을 전달 -->
							<div class="card">
								<div class="reviewId">${reviewList.reviewID}</div>
								<img src="/FullReview/Logo.png" class="card-img-top" alt="...">
								<div class="card-body">
									<div class="title">${reviewList.title}</div>
									<div class="writer">${reviewList.userID}</div>
									<div class="stars">${reviewList.score}</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div>표시할 내용 없음</div>
					</c:otherwise>
				</c:choose>

				<!-- 				<div class="card"> -->
				<!-- 					<div class="reviewId">리뷰 ID</div> -->
				<!-- 					<img src="/FullReview/Logo.png" class="card-img-top" alt="..."> -->
				<!-- 					<div class="card-body"> -->
				<!-- 						<div class="title">여긴 제목란</div> -->
				<!-- 						<div class="writer">여긴 작성자</div> -->
				<!-- 						<div class="stars">여긴 평점란</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="card"> -->
				<!-- 					<div class="reviewId">리뷰 ID</div> -->
				<!-- 					<img src="/FullReview/Logo.png" class="card-img-top" alt="..."> -->
				<!-- 					<div class="card-body"> -->
				<!-- 						<div class="title">여긴 제목란</div> -->
				<!-- 						<div class="writer">여긴 작성자</div> -->
				<!-- 						<div class="stars">여긴 평점란</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->

				<!-- 				<div class="card"> -->
				<!-- 					<div class="reviewId">리뷰 ID</div> -->
				<!-- 					<img src="/FullReview/Logo.png" class="card-img-top" alt="..."> -->
				<!-- 					<div class="card-body"> -->
				<!-- 						<div class="title">여긴 제목란</div> -->
				<!-- 						<div class="writer">여긴 작성자</div> -->
				<!-- 						<div class="stars">여긴 평점란</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="card"> -->
				<!-- 					<div class="reviewId">리뷰 ID</div> -->
				<!-- 					<img src="/FullReview/Logo.png" class="card-img-top" alt="..."> -->
				<!-- 					<div class="card-body"> -->
				<!-- 						<div class="title">여긴 제목란</div> -->
				<!-- 						<div class="writer">여긴 작성자</div> -->
				<!-- 						<div class="stars">여긴 평점란</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="card"> -->
				<!-- 					<div class="reviewId">리뷰 ID</div> -->
				<!-- 					<img src="/FullReview/Logo.png" class="card-img-top" alt="..."> -->
				<!-- 					<div class="card-body"> -->
				<!-- 						<div class="title">여긴 제목란</div> -->
				<!-- 						<div class="writer">여긴 작성자</div> -->
				<!-- 						<div class="stars">여긴 평점란</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->

				<!-- 				<div class="card"> -->
				<!-- 					<div class="reviewId">리뷰 ID</div> -->
				<!-- 					<img src="/FullReview/Logo.png" class="card-img-top" alt="..."> -->
				<!-- 					<div class="card-body"> -->
				<!-- 						<div class="title">여긴 제목란</div> -->
				<!-- 						<div class="writer">여긴 작성자</div> -->
				<!-- 						<div class="stars">여긴 평점란</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="card"> -->
				<!-- 					<div class="reviewId">리뷰 ID</div> -->
				<!-- 					<img src="/FullReview/Logo.png" class="card-img-top" alt="..."> -->
				<!-- 					<div class="card-body"> -->
				<!-- 						<div class="title">여긴 제목란</div> -->
				<!-- 						<div class="writer">여긴 작성자</div> -->
				<!-- 						<div class="stars">여긴 평점란</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="card"> -->
				<!-- 					<div class="reviewId">리뷰 ID</div> -->
				<!-- 					<img src="/FullReview/Logo.png" class="card-img-top" alt="..."> -->
				<!-- 					<div class="card-body"> -->
				<!-- 						<div class="title">여긴 제목란</div> -->
				<!-- 						<div class="writer">여긴 작성자</div> -->
				<!-- 						<div class="stars">여긴 평점란</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
			</div>

			<div class="navigator"
				style="position: relative; width: 100%; border: 0px;">
				<hr>
				<ul class="navigator_list">${FullReviewNavi}</ul>
			</div>

		</div>
	</div>

	<script>
		$(".writeBtn").on("click",function(){
			location.href="/FullReview/writeFullReview.jsp";
		})
		
		$(".card").on("click",function(){
			location.href="/FullReview/FullReviewContent.jsp";
		})
		
	</script>
</body>
</html>