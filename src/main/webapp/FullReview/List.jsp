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
	margin:auto;
	width:30%;
	margin-bottom:30px;
}

.btnBox{
	height:100px;
	padding-left:80%;
}

.writeBtn{
	width:100px;
	height:95px;
}

.writeBtn:hover{
	cursor:pointer;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="album py-5 bg-light">
		<div class="container">

			<div class="btnBox"><img src="/FullReview/writeBtn.png" class="writeBtn"></div>
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="padding-top:40px;">
					
					
					<div class="card">
						<div class="reviewId">리뷰 ID</div>
						<img src="/FullReview/Logo.png" class="card-img-top" alt="...">
						<div class="card-body">
							<div class="title">여긴 제목란</div>
							<div class="writer">여긴 작성자</div>
							<div class="stars">여긴 평점란</div>
						</div>
					</div>
					<div class="card">
						<img src="/FullReview/Logo.png" class="card-img-top" alt="...">
						<div class="card-body">
							<div class="title">여긴 제목란</div>
							<div class="writer">여긴 작성자</div>
							<div class="stars">여긴 평점란</div>
						</div>
					</div>
					<div class="card">
						<img src="/FullReview/Logo.png" class="card-img-top" alt="...">
						<div class="card-body">
							<div class="title">여긴 제목란</div>
							<div class="writer">여긴 작성자</div>
							<div class="stars">여긴 평점란</div>
						</div>
					</div>
					
					<div class="card">
						<img src="/FullReview/Logo.png" class="card-img-top" alt="...">
						<div class="card-body">
							<div class="title">여긴 제목란</div>
							<div class="writer">여긴 작성자</div>
							<div class="stars">여긴 평점란</div>
						</div>
					</div>
					<div class="card">
						<img src="/FullReview/Logo.png" class="card-img-top" alt="...">
						<div class="card-body">
							<div class="title">여긴 제목란</div>
							<div class="writer">여긴 작성자</div>
							<div class="stars">여긴 평점란</div>
						</div>
					</div>
					<div class="card">
						<img src="/FullReview/Logo.png" class="card-img-top" alt="...">
						<div class="card-body">
							<div class="title">여긴 제목란</div>
							<div class="writer">여긴 작성자</div>
							<div class="stars">여긴 평점란</div>
						</div>
					</div>
					
					<div class="card">
						<img src="/FullReview/Logo.png" class="card-img-top" alt="...">
						<div class="card-body">
							<div class="title">여긴 제목란</div>
							<div class="writer">여긴 작성자</div>
							<div class="stars">여긴 평점란</div>
						</div>
					</div>
					<div class="card">
						<img src="/FullReview/Logo.png" class="card-img-top" alt="...">
						<div class="card-body">
							<div class="title">여긴 제목란</div>
							<div class="writer">여긴 작성자</div>
							<div class="stars">여긴 평점란</div>
						</div>
					</div>
					<div class="card">
						<img src="/FullReview/Logo.png" class="card-img-top" alt="...">
						<div class="card-body">
							<div class="title">여긴 제목란</div>
							<div class="writer">여긴 작성자</div>
							<div class="stars">여긴 평점란</div>
						</div>
					</div>
			</div>
			
			
		</div>
	</div>
	
	<script>
		$(".writeBtn").on("click",function(){
			location.href="/write.fullreview";
		})
		
	</script>
</body>
</html>