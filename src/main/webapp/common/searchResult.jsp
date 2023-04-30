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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&family=Roboto&display=swap"
	rel="stylesheet">

<style>
* {
	box-sizing: border-box;
	font-family: 'Roboto', sans-serif;
}

hr {
	border: 1px solid silver;
	width: 95%;
}

.container_searchResult {
	position: relative;
	width: 100%;
	margin: 0px;
	padding-top: 30px;
	border: 1px solid rgb(178, 178, 178);
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.store_searchResult_layout {
	width: 100%;
	margin-bottom: 50px;
}

.blog_searchResult_layout {
	width: 100%;
}

.main_layout {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin-bottom: 60px;
}

.search_category_layout {
	width: 100%;
}

.search_category_title_layout {
	width: 80%;
	height: 100%;
	float: left;
}

.search_category_title {
	padding-left: 30px;
	text-align: left;
	font-size: 22px;
	font-family: 'Nanum Gothic', sans-serif;
}

.show_filterForm_layout {
	width: 20%;
	height: 100%;
	float: left;
	diplay: flex;
	justify-content: center;
	align-items: center;
}

#show_filterForm_btn {
	width: 75%;
	height: 50px;
	border: 2px solid silver;
	border-radius: 30px;
	font-size: 18px;
}

.print_searchResult_layout {
	width: 100%;
}

.outer_layout {
	width: 100%;
	margin: 20px 0px 20px;
	display: flex;
	justify-content: left;
	align-items: center;
}

.inner_cover_layout {
	width: 33%;
	height: 250px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.inner_layout {
	width: 300px;
	height: 100%;
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
	height: 60%;
}

.info_title {
	width: 60%;
	height: 100%;
	float: left;
	line-height: 35px;
	font-size: 19px;
	color: #fe001a;
	overflow: hidden;
}

.info_score {
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
	height: 40%;
	font-size: 15px;
	overflow: hidden;
}

.toDetailSearch_layout {
	width: 90%;
	display: flex;
	justify-content: right;
	align-items: center;
}

#toDetailSearch_btn {
	width: 10%;
	height: 50px;
	border: 2px solid silver;
	border-radius: 30px;
	font-size: 18px;
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
	padding-right: 20px;
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
</head>

<body>
	<div class="container_searchResult">
		<div class="store_searchResult_layout">
			<div class="main_layout">
				<div class="search_category_layout">
					<div class="search_category_title_layout">
						<p class="search_category_title">가게 검색 결과</p>
					</div>
					<div class="show_filterForm_layout">
						<button id="show_filterForm_btn">
							<i class="fa-solid fa-sliders"></i>&nbsp 필터
						</button>
					</div>
				</div>

				<hr>

				<div class="print_searchResult_layout">
					<c:choose>
						<c:when test="${search_store_list!=null}">

							<!-- Outer_layout의 개수 -->
							<!-- 검색 결과가 3으로 나누어 떨어지면 count=리스트 수 / 3 -->
							<!-- 그렇지 않으면 count=리스트 수 / 3 + 1-->
							<c:set var="count" value="${search_store_list.size()/3}" />

							<!-- 올림 처리 -->
							<c:set var="count" value="${count+(1-(count%1))%1}" />

							<c:set var="index" value="0" />

							<c:forEach var="i" begin="1" end="${count}">
								<div class="outer_layout">
									<c:choose>
										<c:when test="${i<count}">
											<c:forEach var="j" begin="1" end="3">
												<div class="inner_cover_layout">
													<div class="inner_layout">
														<div class="img_layout">
															<img src="/searchResult/restaurant_img1.jpg" id="restaurant_img1">
															<div class="restaurant_addFavorite">
																<button class="addFavorite_btn">
																	<i class="fa-regular fa-heart"></i>
																</button>
															</div>
														</div>
														<div class="info_layout">
															<div class="info_title_layout" style="padding-left: 10px">
																<div class="info_title">${search_store_list.get(index).name}</div>
																<div class="info_score">
																	<ul class="stars">
																		<a class="stars__link"><i
																			class="stars__icon fas fa-star"></i></a>
																		<a class="stars__link"><i
																			class="stars__icon fas fa-star"></i></a>
																		<a class="stars__link"><i
																			class="stars__icon fas fa-star"></i></a>
																		<a class="stars__link"><i
																			class="stars__icon fas fa-star"></i></a>
																		<a class="stars__link"><i
																			class="stars__icon fas fa-star"></i></a>
																	</ul>
																</div>
															</div>
															<div class="info_address" style="padding-left: 10px">
																${search_store_list.get(index).address}</div>
														</div>
													</div>
												</div>
												<c:set var="index" value="${index+1}" />
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="j" begin="1"
												end="${search_store_list.size()%3}">
												<div class="inner_cover_layout">
													<div class="inner_layout">
														<div class="img_layout">
															<img src="/searchResult/restaurant_img1.jpg" id="restaurant_img1">
															<div class="restaurant_addFavorite">
																<button class="addFavorite_btn">
																	<i class="fa-regular fa-heart"></i>
																</button>
															</div>
														</div>
														<div class="info_layout">
															<div class="info_title_layout" style="padding-left: 10px">
																<div class="info_title">${search_store_list.get(index).name}</div>
																<div class="info_score">
																	<ul class="stars">
																		<a class="stars__link"><i
																			class="stars__icon fas fa-star"></i></a>
																		<a class="stars__link"><i
																			class="stars__icon fas fa-star"></i></a>
																		<a class="stars__link"><i
																			class="stars__icon fas fa-star"></i></a>
																		<a class="stars__link"><i
																			class="stars__icon fas fa-star"></i></a>
																		<a class="stars__link"><i
																			class="stars__icon fas fa-star"></i></a>
																	</ul>
																</div>
															</div>
															<div class="info_address" style="padding-left: 10px">
																${search_store_list.get(index).address}</div>
														</div>
													</div>
												</div>
												<c:set var="index" value="${index+1}" />
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>

					<hr>

				</div>

				<div class="toDetailSearch_layout">
					<button id="toDetailSearch_btn">더보기</button>
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
 


		<br>



		<!-- 블로그 리뷰 검색 결과 -->

		<div class="blog_searchResult_layout">
			<div class="main_layout">
				<div class="search_category_layout">
					<div class="search_category_title_layout">
						<p class="search_category_title">블로그 검색 결과</p>
					</div>
					<div class="show_filterForm_layout">
						<button id="show_filterForm_btn">
							<i class="fa-solid fa-sliders"></i>&nbsp 필터
						</button>
					</div>
				</div>

				<hr>

				<div class="print_searchResult_layout">
					<div class="outer_layout">
						<div class="inner_cover_layout">
							<div class="inner_layout">
								<div class="img_layout">
									<img src="restaurant_img1.jpg" id="restaurant_img1">
									<div class="restaurant_addFavorite">
										<button class="addFavorite_btn">
											<i class="fa-regular fa-heart"></i>
										</button>
									</div>
								</div>
								<div class="info_layout">
									<div class="info_title_layout" style="padding-left: 10px">
										<div class="info_title">장어집 123</div>
										<div class="info_score">
											<ul class="stars">
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
											</ul>
										</div>
									</div>
									<div class="info_address" style="padding-left: 10px">
										서울시 중구 을지로 무슨빌딩 3층</div>
								</div>
							</div>
						</div>
						
						<div class="inner_cover_layout">
							<div class="inner_layout">
								<div class="img_layout">
									<img src="restaurant_img1.jpg" id="restaurant_img1">
									<div class="restaurant_addFavorite">
										<button class="addFavorite_btn">
											<i class="fa-regular fa-heart"></i>
										</button>
									</div>
								</div>
								<div class="info_layout">
									<div class="info_title_layout" style="padding-left: 10px">
										<div class="info_title">장어집 123</div>
										<div class="info_score">
											<ul class="stars">
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
											</ul>
										</div>
									</div>
									<div class="info_address" style="padding-left: 10px">
										서울시 중구 을지로 무슨빌딩 3층</div>
								</div>
							</div>
						</div>
						
						<div class="inner_cover_layout">
							<div class="inner_layout">
								<div class="img_layout">
									<img src="restaurant_img1.jpg" id="restaurant_img1">
									<div class="restaurant_addFavorite">
										<button class="addFavorite_btn">
											<i class="fa-regular fa-heart"></i>
										</button>
									</div>
								</div>
								<div class="info_layout">
									<div class="info_title_layout" style="padding-left: 10px">
										<div class="info_title">장어집 123</div>
										<div class="info_score">
											<ul class="stars">
												<a class="stars__link">
												<i class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
											</ul>
										</div>
									</div>
									<div class="info_address" style="padding-left: 10px">
										서울시 중구 을지로 무슨빌딩 3층</div>
								</div>
							</div>
						</div>
					</div>

					<hr>

					<div class="outer_layout">
						<div class="inner_cover_layout">
							<div class="inner_layout">
								<div class="img_layout">
									<img src="restaurant_img1.jpg" id="restaurant_img1">
									<div class="restaurant_addFavorite">
										<button class="addFavorite_btn">
											<i class="fa-regular fa-heart"></i>
										</button>
									</div>
								</div>
								<div class="info_layout">
									<div class="info_title_layout" style="padding-left: 10px">
										<div class="info_title">장어집 123</div>
										<div class="info_score">
											<ul class="stars">
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
											</ul>
										</div>
									</div>
									<div class="info_address" style="padding-left: 10px">
										서울시 중구 을지로 무슨빌딩 3층</div>
								</div>
							</div>
						</div>
						
						<div class="inner_cover_layout">
							<div class="inner_layout">
								<div class="img_layout">
									<img src="restaurant_img1.jpg" id="restaurant_img1">
									<div class="restaurant_addFavorite">
										<button class="addFavorite_btn">
											<i class="fa-regular fa-heart"></i>
										</button>
									</div>
								</div>
								<div class="info_layout">
									<div class="info_title_layout" style="padding-left: 10px">
										<div class="info_title">장어집 123</div>
										<div class="info_score">
											<ul class="stars">
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
											</ul>
										</div>
									</div>
									<div class="info_address" style="padding-left: 10px">
										서울시 중구 을지로 무슨빌딩 3층</div>
								</div>
							</div>
						</div>
						
						<div class="inner_cover_layout">
							<div class="inner_layout">
								<div class="img_layout">
									<img src="restaurant_img1.jpg" id="restaurant_img1">
									<div class="restaurant_addFavorite">
										<button class="addFavorite_btn">
											<i class="fa-regular fa-heart"></i>
										</button>
									</div>
								</div>
								<div class="info_layout">
									<div class="info_title_layout" style="padding-left: 10px">
										<div class="info_title">장어집 123</div>
										<div class="info_score">
											<ul class="stars">
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
												<a class="stars__link"><i
													class="stars__icon fas fa-star"></i></a>
											</ul>
										</div>
									</div>
									<div class="info_address" style="padding-left: 10px">
										서울시 중구 을지로 무슨빌딩 3층</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="toDetailSearch_layout">
					<button id="toDetailSearch_btn">더보기</button>
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