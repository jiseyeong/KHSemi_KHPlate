<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>storeSearchResult</title>

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

.restaurant_img{
	width: 100%;
	height: 100%;
	border:1px solid silver;
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

/* 별점 영역 */
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

/* 검색 결과가 없을 때*/
.search_none_layout {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
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
	flex-direction: column; justify-content : center;
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

/* 정렬 필터 영역 */
#searchForm {
	position: absolute;
	top: 0px;
	left: 0px;
}

#sort_layout {
	position: absolute;
	z-index: 1;
	left: 3px;
	width: 400px;
	height: 700px;
	background-color: white;
	border: 1px solid silver;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
}

.sort_title {
	margin: 10px auto 10px;
	padding-left: 10px;
	font-size: 16px;
}

.search_filter {
	width: 100%;
	height: 15%;
}

.filter_sort {
	width: 100%;
	height: 60%;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
}

.filter_options {
	width: 22%;
	height: 70%;
	border-radius: 30px;
}

.filter_option_btn {
	width: 100%;
	height: 100%;
	border-radius: 30px;
	font-size: 13px;
	background-color: white;
	border: 2px solid silver;
}

.cost_average {
	width: 100%;
	height: 20%;
}

.filter_cost {
	width: 100%;
	height: 60%;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	align-items: center;
}

.form-range {
	width: 90%;
}

.form-range::-webkit-slider-thumb {
	background: rgb(232, 127, 127);
}

#range_result {
	width: 50%;
	height: 35%;
	margin-top: 20px;
	border: 2px solid silver;
	border-radius: 25px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 14px;
	flex: 2;
}

.food_category {
	width: 100%;
	height: 41%;
}

.food_category_title {
	margin-bottom: 2px;
}

.food_category_layout {
	margin: auto;
	width: 90%;
	height: 90%;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	align-items: center;
}

.food_category_inner_layout {
	width: 100%;
	height: 50%;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
}

.food_category_list {
	width: 20%;
	height: 80%;
	border: 2px solid red;
}

.food_category_list:hover {
	cursor: pointer;
}

.food_icon_layout {
	width: 100%;
	height: 75%;
	border: 1px solid silver;
}

.food_icon {
	width: 100%;
	height: 100%;
}

.food_name {
	width: 100%;
	height: 25%;
	font-size: 12px;
	display: flex;
	justify-content: center;
	align-items: center;
	border: 1px solid silver;
}

.btn_layout {
	width: 100%;
	height: 12%;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
}

.btn_inner_layout {
	width: 25%;
	height: 60%;
}

.sort_apply_btn {
	width: 100%;
	height: 100%;
	border-radius: 25px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 15px;
	background-color: white;
	border: 2px solid silver;
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
							<c:set var="count" value="${search_store_list.size() / 3}" />

							<!-- count 값이 0일 때 예외 처리 -->
							<c:if test="${count == 0}">
								<c:set var="count" value="1" />
							</c:if>

							<!-- 올림 처리 -->
							<c:set var="count" value="${count + (1 - (count % 1)) % 1}" />

							<!-- list의 index를 나타낼 index-->
							<c:set var="index" value="0" />
							<!-- 남은 inner_list의 갯수를 처리할 list_count -->
							<c:set var="list_count" value="${search_store_list.size()}" />

							<!-- 리스트 크기/3 한 만큼 outer 출력 -->
							<c:forEach var="i" begin="1" end="${count}" step="1">
								<div class="outer_layout">
									<c:choose>
										<c:when test="${i<count}">
											<!-- 3번까지 inner 출력 -->
											<c:forEach var="j" begin="1" end="3" step="1">
												<div class="inner_cover_layout">
													<div class="inner_layout">
														<div class="img_layout">
															<img src="/searchResult/restaurant_img1.jpg" class="restaurant_img">
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

												<c:set var="list_count" value="${list_count-1}" />
												<c:set var="index" value="${index+1}" />
											</c:forEach>
										</c:when>
										<c:otherwise>
											<!-- i가 마지막 순번 일 때, 남은 list_count까지 출력 -->
											<c:forEach var="k" begin="1" end="${list_count}" step="1">
												<div class="inner_cover_layout">
													<div class="inner_layout">
														<div class="img_layout">
															<img src="/searchResult/restaurant_img1.jpg" class="restaurant_img">
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
							<div class="search_none_layout">표시할 내용이 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<!-- 네비게이터 영역 -->
			<div class="navigator"
				style="position: relative; width: 100%; border: 0px;">
				<hr>
				<ul class="navigator_list">${search_store_list_navi}
				</ul>
			</div>
		</div>



		<!-- 필터 영역 -->

		<form action="/searchToMain.store" id="searchForm"
			onsubmit="return false;">
			<input type="text" name="searchedBy" value="mainSearch"
				style="display: none;">
			<div id="sort_layout" style="display: none;">
				<div class="search_filter">
					<p class="sort_title">검색 필터</p>
					<div class="filter_sort">
						<input type="text" id="sortMethod" name="sortMethod"
							style="display: none;">
						<div class="filter_options">
							<button class="filter_option_btn" id="order_by_distance">거리순</button>
						</div>
						<div class="filter_options">
							<button class="filter_option_btn" id="order_by_score">평점순</button>
						</div>
						<div class="filter_options">
							<button class="filter_option_btn" id="order_by_review">리뷰순</button>
						</div>
					</div>
				</div>

				<hr>

				<div class="cost_average">
					<p class="sort_title">가격/1인당</p>
					<div class="filter_cost">
						<input type="text" id="cost_set" name="cost_range" style="display:none;">
						<input type="range" id="cost_range" class="form-range" min="0"
							max="4" step="1" onchange=SetValue()>
						<div id="range_result">범위를 지정해주세요</div>
					</div>
				</div>

				<hr>

				<div class="food_category">
					<p class="sort_title food_category_title">음식종류</p>
					<div class="food_category_layout">
						<div class="food_category_inner_layout">
							<div class="food_category_list">
								<div class="food_icon_layout">
									<img class="food_icon" src="/allstore_inquiry/salad.png">
								</div>
								<div class="food_name">한식</div>
								<input type="text" class="food_category_menu"
									id="food_category_korean" name="food_category_korean"
									style="display: none;">
							</div>
							<div class="food_category_list">
								<div class="food_icon_layout">
									<img class="food_icon" src="/allstore_inquiry/salad.png">
								</div>
								<div class="food_name">양식</div>
								<input type="text" class="food_category_menu"
									id="food_category_western" name="food_category_western"
									style="display: none;">
							</div>
							<div class="food_category_list">
								<div class="food_icon_layout">
									<img class="food_icon" src="/allstore_inquiry/salad.png">
								</div>
								<div class="food_name">중식</div>
								<input type="text" class="food_category_menu"
									id="food_category_chinese" name="food_category_chinese"
									style="display: none;">
							</div>
							<div class="food_category_list">
								<div class="food_icon_layout">
									<img class="food_icon" src="/allstore_inquiry/salad.png">
								</div>
								<div class="food_name">일식</div>
								<input type="text" class="food_category_menu"
									id="food_category_japanese" name="food_category_japanese"
									style="display: none;">
							</div>
						</div>
						<div class="food_category_inner_layout">
							<div class="food_category_list">
								<div class="food_icon_layout">
									<img class="food_icon" src="/allstore_inquiry/salad.png">
								</div>
								<div class="food_name">아시안</div>
								<input type="text" class="food_category_menu"
									id="food_category_asian" name="food_category_asian"
									style="display: none;">
							</div>
							<div class="food_category_list">
								<div class="food_icon_layout">
									<img class="food_icon" src="/allstore_inquiry/salad.png">
								</div>
								<div class="food_name">패스트푸드</div>
								<input type="text" class="food_category_menu"
									id="food_category_fastfood" name="food_category_fastfood"
									style="display: none;">
							</div>
							<div class="food_category_list">
								<div class="food_icon_layout">
									<img class="food_icon" src="/allstore_inquiry/salad.png">
								</div>
								<div class="food_name">디저트/음료</div>
								<input type="text" class="food_category_menu"
									id="food_category_dessert_drink"
									name="food_category_dessert_drink" style="display: none;">
							</div>
							<div class="food_category_list">
								<div class="food_icon_layout">
									<img class="food_icon" src="/allstore_inquiry/salad.png">
								</div>
								<div class="food_name">기타</div>
								<input type="text" class="food_category_menu"
									id="food_category_etc" name="food_category_etc"
									style="display: none;">
							</div>
						</div>
					</div>
				</div>

				<hr>

				<div class="btn_layout">
					<div class="btn_inner_layout">
						<button class="sort_apply_btn" id="cancel_btn">취소</button>
					</div>
					<div class="btn_inner_layout">
						<button class="sort_apply_btn" id="apply_btn">적용</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<c:if test="${search_store_list!=null}">
		<c:forEach var="dto" items="${search_store_list}" varStatus="status">
			<input type="text" class="search_store_list_toScript"
				id="search_store_list_storeID${status.index}" value="${dto.storeID}">
			<input type="text" class="search_store_list_toScript"
				id="search_store_list_distance${status.index}"
				value="${dto.distance}">
			<input type="text" class="search_store_list_toScript"
				id="search_store_list_name${status.index}" value="${dto.name}">
			<input type="text" class="search_store_list_toScript"
				id="search_store_list_lat${status.index}" value="${dto.lat}">
			<input type="text" class="search_store_list_toScript"
				id="search_store_list_lng${status.index}" value="${dto.lng}">
			<input type="text" class="search_store_list_toScript"
				id="search_store_list_address${status.index}" value="${dto.address}">
			<input type="text" class="search_store_list_toScript"
				id="search_store_list_avgScore${status.index}"
				value="${dto.avgScore}">
			<input type="text" class="search_store_list_toScript"
				id="search_store_list_introduction${status.index}"
				value="${dto.introduction}">
			<input type="text" class="search_store_list_toScript"
				id="search_store_list_category${status.index}"
				value="${dto.category}">
		</c:forEach>
	</c:if>

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



	<script>
		// 필터 기능들
		
		// 필터 SlideToggle
		$(document).ready(function () {
			let sort_check = false;

			$("#show_filterForm_btn").on("click", function () {
				if(sort_check==false){
					$('#sort_layout').css({"display":""});
					sort_check=true;
				}else{
					$("#sort_layout").css({"display":"none"});
					sort_check=false;
				}
			});
		});
		
		
		// 범위 바의 값을 변경하였을 때 적용
		function SetValue() {
			if($("#cost_range").prop("name")==false){
				$("#cost_range").prop("name","cost_range");
			}
			
			let range = $("#cost_range").val();
			let range_result = $("#range_result");
			
			if (range == 0) {
				$("#cost_set").val("5000이하");
				range_result.html("5000원 이하");
			} else if (range == 1) {
				$("#cost_set").val("5000~10000");
				range_result.html("5000원 ~ 10000원");
			} else if (range == 2) {
				$("#cost_set").val("10000~15000");
				range_result.html("10000원 ~ 15000원");
			} else if (range == 3) {
				$("#cost_set").val("15000~20000");
				range_result.html("15000원 ~ 20000원");
			} else {
				$("#cost_set").val("20000이상");
				range_result.html("20000원 이상");
			}
		}
		
		
		// 각 음식 카테고리 div에 boolean변수 부여(closer)
		$(function () {
			$(".food_category_list").each(function (index, item) {
				let food_category_list_check = true;
				$(this).find(".food_category_menu").val(true);
				$(item).on("click", function () {
					if (food_category_list_check == false) {
						$(this).css({
							"border": "2px solid red"
						})
						$(this).find(".food_category_menu").val(true);
						food_category_list_check = true;
					} else {
						$(this).css({
							"border": "1px solid silver"
						})
						$(this).find(".food_category_menu").val(false);
						food_category_list_check = false;
					}
				})
			})
		});

		
		// 필터 정렬 지정
		$(".filter_option_btn").on("click",function(){
			$("#sortMethod").val($(this).attr("id"));
			$(".filter_option_btn").css({
				"border":"2px solid silver"
			});
			$(this).css({
				"border":"2px solid red"
			});
		})
		
		// 검색 정렬 확인 버튼
		$("#apply_btn").on("click",function(){
			$("#searchForm").prop("onsubmit",true);
			$("#searchForm").submit();
		});
		
		// 검색 정렬 취소 버튼
		$("#cancel_btn").on("click",function(){
			
		})

	</script>
</body>

</html>