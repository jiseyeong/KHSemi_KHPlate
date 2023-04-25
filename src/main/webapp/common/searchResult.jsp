<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>searchResult</title>

<!-- 부트 스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<!-- FontAwesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- 구글 폰트 api -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Roboto&display=swap"
	rel="stylesheet">
<style>
* {
	box-sizing: border-box;
}

.container {
	max-width: 1100px;
	min-width: 1000px;
	position: relative;
	width: 100%;
	margin: auto;
	padding: 40px 0px 0px;
	border: 1px solid rgb(178, 178, 178);
}

.body {
	display: flex;
	/* 세로 정렬 */
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.outer_layout {
	margin: 20px 0px 10px;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
}

.outer_layout>div {
	width: 300px;
	height: 250px;
	float: left;
	margin: 0px 0px 0px;
}

.inner_layout>div {
	width: 100%;
}

.img_layout {
	height: 75%;
	position: relative;
}

.img_layout>img {
	width: 100%;
	height: 100%;
	border-radius: 20px;
}

.restaurant_addFavorite {
	position: absolute;
	top: 10px;
	right: 12px;
	width: 40px;
	height: 40px;
	border-radius: 1.5rem;
	z-index: 1px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.addFavorite_btn {
	border-radius: 1.5rem;
	width: 100%;
	height: 100%;
	border: 2px solid rgb(178, 178, 178);
	font-size: 20px;
}

.info_layout {
	height: 25%;
}

.info_layout>div {
	width: 100%;
}

.info_title_layout {
	height: 50%;
}

.info_title_layout>.info_title {
	width: 60%;
	height: 100%;
	float: left;
	line-height: 35px;
	font-size: 24px;
	color: #fe001a;
	font-family: 'Noto Sans KR', sans-serif;
	font-family: 'Roboto', sans-serif;
}

.info_title_layout>.info_score {
	width: 40%;
	height: 100%;
	float: right;
	font-size: 15px;
	text-align: right;
	padding-right: 15px;
	display: flex;
	justify-content: center;
	align-items: center;
}

@import url('https://fonts.googleapis.com/css?family=Lato:300,400,700');

:root {
	box-sizing: border-box;
}

.stars {
	padding: 0px;
	margin: 0px;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.stars__link {
	text-decoration: none;
	padding: 2px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.stars__icon {
	color: #b2b2b2;
	display: inline-block;
	cursor: pointer;
}

.js-clear {
	color: #b2b2b2;
}

.js-fill {
	color: gold;
}

@media ( max-width : 27em) {
	.stars__icon {
		font-size: 2.5em;
	}
	.stars-phrase {
		font-size: 1em;
	}
}

.info_address {
	height: 50%;
	font-size: 15px;
}

.navigator {
	height: 200px;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: end;
	padding-bottom: 10px;
	font-size: 20px;
}

.navigator {
	border: 1px solid black;
	height: 60px;
	width: 100%;
	text-align: center;
	margin: 20px auto 0 auto;
	padding: 10px 0px 10px;
	background-color: rgba(255, 255, 255, 0.9);
	position: fixed;
	z-index: 1000;
	bottom: 0;
	left: 0;
	border-top: 1px solid #fff;
	box-shadow: 0 -3px 3px rgba(0, 0, 0, 0.05);
	display: flex;
	justify-content: center;
	align-items: center;
}

.navigator_list {
	list-style-type: none;
	padding-left: 0px;
	margin: 0px;
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
}

.footer {
	margin-top: 100px;
	width: 100%;
	height: 235px;
	background-color: rgb(42, 40, 45);
	color: rgb(237, 238, 242);
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.footer>div {
	position: relative;
	float: left;
}

.footer_left {
	min-width: 8%;
	height: 55%;
}

.footer_right {
	min-width: 30%;
	height: 100%;
	top: 20px;
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.footer_content1 {
	font-size: 22px;
}

.footer_content2 {
	font-size: 15px;
}

.footer_content3 {
	font-size: 15px;
}

.footer_content4 {
	font-size: 15px;
	margin-bottom: 40px;
}

.footer_logo {
	width: 100%;
	height: 100%;
	border-radius: 40px;
}
</style>
</head>

<body>
	<div class="container">
		<div class="body">
			<div class="col-12 outer_layout">
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
			</div>

			<hr>

			<div class="col-12 outer_layout">
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
			</div>

			<hr>

			<div class="col-12 outer_layout">
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
			</div>

			<hr>

			<div class="col-12 outer_layout">
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
			</div>

			<hr>

			<div class="col-12 outer_layout">
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
				<div class="col-12 col-lg-8 inner_layout">
					<div class="col-12 col-lg-8 img_layout">
						<img src="restaurant_img1.jpg" id="restaurant_img1">
						<div class="restaurant_addFavorite">
							<button class="addFavorite_btn">
								<i class="fa-regular fa-heart"></i>
							</button>
						</div>
					</div>
					<div class="col-12 col-lg-8 info_layout">
						<div class="col-12 col-lg-8 info_title_layout"
							style="padding-left: 10px">
							<div class="col-12 col-lg-8 info_title">장어집 123</div>
							<div class="col-12 col-lg-8 info_score">
								<ul class="stars">
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
									<a class="stars__link"><i class="stars__icon fas fa-star"></i></a>
								</ul>
							</div>
						</div>
						<div class="col-12 col-lg-8 info_address"
							style="padding-left: 10px">서울시 중구 을지로 무슨빌딩 3층</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 네비게이터 영역 
        1. 하단 고정-->
		<div class="navigator"
			style="position: relative; width: 100%; border: 0px;">
			<ul class="navigator_list">
				<li class="navigator_list_item">
					<div class=navigator_list_item_btn_layout>
						<button class="navigator_direction_btn">
							<i class="fa-solid fa-angle-left"></i>
						</button>
					</div>
				</li>
				<li class="navigator_list_item">
					<div class=navigator_list_item_btn_layout>
						<a class="item" href="/searchResult.html">1</a>
					</div>
				</li>
				<li class="navigator_list_item">
					<div class=navigator_list_item_btn_layout>
						<a class="item" href="/searchResult.html">2</a>
					</div>
				</li>
				<li class="navigator_list_item">
					<div class=navigator_list_item_btn_layout>
						<a class="item" href="/searchResult.html">3</a>
					</div>
				</li>
				<li class="navigator_list_item">
					<div class=navigator_list_item_btn_layout>
						<a class="item" href="/searchResult.html">4</a>
					</div>
				</li>
				<li class="navigator_list_item">
					<div class=navigator_list_item_btn_layout>
						<a class="item" href="/searchResult.html">5</a>
					</div>
				</li>
				<li class="navigator_list_item">
					<div class=navigator_list_item_btn_layout>
						<a class="item" href="/searchResult.html">6</a>
					</div>
				</li>
				<li class="navigator_list_item">
					<div class=navigator_list_item_btn_layout>
						<a class="item" href="/searchResult.html">7</a>
					</div>
				</li>
				<li class="navigator_list_item">
					<div class=navigator_list_item_btn_layout>
						<a class="item" href="/searchResult.html">8</a>
					</div>
				</li>
				<li class="navigator_list_item">
					<div class=navigator_list_item_btn_layout>
						<a class="item" href="/searchResult.html">9</a>
					</div>
				</li>
				<li class="navigator_list_item">
					<div class=navigator_list_item_btn_layout>
						<a class="item" href="/searchResult.html">10</a>
					</div>
				</li>
				<li class="navigator_list_item">
					<div class=navigator_list_item_btn_layout>
						<button class="navigator_direction_btn">
							<i class="fa-solid fa-angle-right"></i>
						</button>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="footer">
		<div class="footer_left">
			<img class="footer_logo" src="khplate1.jpg">
		</div>
		<div class="footer_right">
			<p class="footer_content1">KH Plate Corp.</p>
			<p class="footer_content2">KH Plate</p>
			<p class="footer_content3">대표 모두가
				대표&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp대표번호
				02-123-4567&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 홈페이지 naver.com</p>
			<p class="footer_content4">Copyright ▷ KH Plate Corp. All Rights
				Reserved</p>
		</div>
	</div>


	<!-- 별점 등록 Script -->
	<script>
            let stars = document.querySelectorAll('.stars__link');
            let phrase = document.querySelector('.stars-phrase');

            /* using a variation of Chris Ferdinandi's get-siblings.js script (https://gist.github.com/cferdinandi/6203237)  */
            var getNextSiblings = function (elem) {
                var siblings = [];
                var sibling = elem;
                for (; sibling; sibling = sibling.nextElementSibling)
                    siblings.push(sibling);
                return siblings;
            }

            var getPrevSiblings = function (elem) {
                var siblings = [];
                var sibling = elem;
                for (; sibling; sibling = sibling.previousElementSibling)
                    siblings.push(sibling);
                console.log(siblings);
                return siblings;
            }

            stars.forEach((el, idx) => {
                el.addEventListener('click', (e) => {
                    let nextSibs = getNextSiblings(el);
                    nextSibs.forEach((sib) => {
                        sib.children[0].classList.add('js-clear');
                        sib.children[0].classList.remove('js-fill');
                    });
                    let prevSibs = getPrevSiblings(el);
                    prevSibs.forEach((sib) => {
                        sib.children[0].classList.add('js-fill');
                    });
                });
            });

        </script>

	<!-- 네비게이터 영역 
        2. 하단 Fixed-->

	<!-- <div class="navigator">
        <ul class="navigator_list">
            <li class="navigator_list_item">
                <div class=navigator_list_item_btn_layout>
                    <button class="navigator_direction_btn"><i class="fa-solid fa-angle-left"></i></button>
                </div>
            </li>
            <li class="navigator_list_item">
                <div class=navigator_list_item_btn_layout>
                    <a class="item" href="/searchResult.html">1</a>
                </div>
            </li>
            <li class="navigator_list_item">
                <div class=navigator_list_item_btn_layout>
                    <a class="item" href="/searchResult.html">2</a>
                </div>
            </li>
            <li class="navigator_list_item">
                <div class=navigator_list_item_btn_layout>
                    <a class="item" href="/searchResult.html">3</a>
                </div>
            </li>
            <li class="navigator_list_item">
                <div class=navigator_list_item_btn_layout>
                    <a class="item" href="/searchResult.html">4</a>
                </div>
            </li>
            <li class="navigator_list_item">
                <div class=navigator_list_item_btn_layout>
                    <a class="item" href="/searchResult.html">5</a>
                </div>
            </li>
            <li class="navigator_list_item">
                <div class=navigator_list_item_btn_layout>
                    <a class="item" href="/searchResult.html">6</a>
                </div>
            </li>
            <li class="navigator_list_item">
                <div class=navigator_list_item_btn_layout>
                    <a class="item" href="/searchResult.html">7</a>
                </div>
            </li>
            <li class="navigator_list_item">
                <div class=navigator_list_item_btn_layout>
                    <a class="item" href="/searchResult.html">8</a>
                </div>
            </li>
            <li class="navigator_list_item">
                <div class=navigator_list_item_btn_layout>
                    <a class="item" href="/searchResult.html">9</a>
                </div>
            </li>
            <li class="navigator_list_item">
                <div class=navigator_list_item_btn_layout>
                    <a class="item" href="/searchResult.html">10</a>
                </div>
            </li>
            <li class="navigator_list_item">
                <div class=navigator_list_item_btn_layout>
                    <button class="navigator_direction_btn"><i class="fa-solid fa-angle-right"></i></button>
                </div>
            </li>
        </ul>
    </div> -->
</body>

</html>