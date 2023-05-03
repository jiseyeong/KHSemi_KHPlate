<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>전체 가게 조회</title>

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>

<!-- Font-Awesome-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />



<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

* {
	box-sizing: border-box;
	 font-family: 'Nanum Gothic', sans-serif;
}

body {
	width: 100%;
	height: 100%;
	margin: 0px;
}

button:hover {
	cursor: pointer;
}

.container {
	position: relative;
	width: 1920px;
	height: 929px;
	overflow: hidden;
}

/* 맛집 리스트 영역 */
.store_list {
	float: left;
	width: 27%;
	height: 100%;
	position: inherit;
	border: 1px solid silver;
}

.search_layout {
	width: 100%;
	height: 10%;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	display: flex;
	justify-content: space-evenly;
}

.toBack_layout {
	width: 12%;
	height: 50%;
	float: left;
	display: flex;
	justify-content: center;
	align-items: center;
}

#toBack_btn {
	width: 100%;
	height: 100%;
	background-color: white;
	border: 2px solid silver;
	border-radius: 20px;
	font-size: 22px;
}

.show_filterForm_layout {
	width: 17%;
	height: 50%;
	float: left;
	display: flex;
	justify-content: center;
	align-items: center;
}

#show_filterForm_btn {
	width: 100%;
	height: 100%;
	background-color: white;
	border: 2px solid silver;
	border-radius: 20px;
	font-size: 15px;
}

.searchBox {
	width: 65%;
	height: 50%;
	line-height: 50px;
	position: relative;
	border-radius: 20px;
	border: 2px solid silver;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
}

.searchBar {
	line-height: 140px;
}

#search {
	width: 80%;
	height: 80%;
	border-radius: 15px;
	border: none;
	padding-left: 10px;
}

#searchBtn {
	width: 12%;
	height: 80%;
	position: relative;
	font-size: 10px;
	padding: 0px;
	background-color: white;
	border: 2px solid silver;
	border-radius: 10px;
}

.restaurant_list_layout {
	width: 100%;
	height: 90%;
}

.restaurant_list {
	width: 98%;
	height: 93%;
	list-style: none;
	padding: 0px;
	margin: 0px;
	margin-left: 10px;
}

.restaurant {
	width: 100%;
	height: 140px;
	margin-bottom: 10px;
	border: 1px solid silver;
	border-radius: 70px;
}

.restaurant_none {
	margin: auto;
	width: 100%;
	height: 100%;
}

.none {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.img_layout {
	float: left;
	width: 30%;
	height: 100%;
	border: 1px solid silver;
}

img {
	width: 100%;
	height: 100%;
}

.info_layout {
	float: left;
	height: 100%;
	width: 70%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: left;
	overflow: hidden;
}

.info_layout_topside {
	width: 100%;
	height: 65%;
}

.info_layout_bottomside {
	width: 82%;
	height: 35%;
}

.info_layout_left {
	height: 100%;
	width: 58%;
	float: left;
	padding-top: 10px;
}

.info_layout_right {
	height: 100%;
	width: 42%;
	float: left;
	text-align: right;
	padding-top: 20px;
	padding-right: 16px;
}

.restaurant_info {
	margin: 15px;
}

.restaurant_name {
	font-size: 20px;
	color: red;
	font-family: 'Noto Sans KR', sans-serif;
}

.restaurant_address {
	font-size: 16px;
	/* 주소 길어질 경우 생략 기호로 간략 표시 (...)*/
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.restaurant_score {
	font-size: 16px;
}

.restaurant_category {
	margin-right: 26px;
	font-size: 14px;
}

/* 별점 */
.stars {
	padding: 0px;
	margin: 0px;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: space-evenly;
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

.navigator {
	height: 7%;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	padding-bottom: 10px;
	font-size: 20px;
	padding: 0px;
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
	width: 30px;
	height: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.item {
	text-decoration: none;
}

/* 지도 영역 */
.map_layout {
	width: 73%;
	height: 100%;
	float: right;
	position: relative;
}

#map {
	float: right;
	position: inherit;
	width: 100%;
	height: 100%;
}

/* 필터 영역 */
hr {
	width: 90%;
	border: 1px solid silver;
}

#sort_layout {
	position: absolute;
	z-index: 1;
	left: 3px;
	width: 400px;
	height: 650px;
	background-color: white;
	border: 1px solid silver;
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

/* 맵에 표시될 InfoWindow */
.restaurant_infoWindow {
	width: auto;
	height: 50px;
	background-color: white;
	border: 1px solid silver;
	border-radius: 70px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.infoWindow_img_layout {
	float: left;
	width: 50px;
	height: 100%;
}

.infoWindow_img_layout>* {
	width: 100%;
	height: 100%;
	border: 1px solid silver;
	border-radius: 70px;
}

.infoWindow_info_layout {
	float: left;
	width: auto;
	height: 100%;
	margin-left: 4px;
	margin-right: 10px;
}

.infoWindow_info_top {
	width: 100%;
	height: 60%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 14px;
	white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
	overflow: hidden;
	white-space: nowrap;
}

.infoWindow_info_bottom {
	width: 100%;
	height: 40%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 12px;
	height: 40%;
}

.search_store_list_toScript {
	display: none;
}
</style>
</head>

<body>
	<form id="searchForm" action="/searchStoreBySearchBox.store"
		onsubmit="return false;">
		<input type="text" name="searchedBy" value="mapSearch"
			style="display: none;">
		<div class="container">
			<div class="store_list">
				<div class="search_layout">
					<div class="toBack_layout">
						<button id="toBack_btn">
							<i class="fa-solid fa-rotate-left"></i>
						</button>
					</div>

					<div class="searchBox">
						<input type="text" id="search" name="search">
						<button id="searchBtn">검색</button>
					</div>

					<div class="show_filterForm_layout">
						<button id="show_filterForm_btn">
							<i class="fa-solid fa-sliders"></i>&nbsp 필터
						</button>
					</div>
				</div>
				<div class="restaurant_list_layout">
					<ul class="restaurant_list">
						<c:choose>
							<c:when test="${search_store_list==null}">
								<li class="restaurant_none">
									<div class="none">
										표시할 내용이 없습니다.<br>검색을 진행해주세요.
									</div>
								</li>

							</c:when>
							<c:otherwise>
								<c:forEach var='i' items='${search_store_list}'>
									<li class="restaurant">
										<input type="text" class="restaurant_storeID" value="${i.storeID}" style="display:none;">
										<div class="img_layout">
											<img src="/allstore_inquiry/restaurant_img1.jpg">
										</div>
										<div class="info_layout">
											<div class=info_layout_topside>
												<div class="info_layout_left">
													<p class="restaurant_info restaurant_name">${i.name}</p>
												</div>
												<div class="info_layout_right">
													<div class="restaurant_info restaurant_score">
														<ul class="stars">
															<c:forEach var="scoreCount" begin="0" end="4" step="1">
																<c:choose>
																	<c:when test="${i.avgScore>=(scoreCount+0.5)}">
																		<i class="stars__icon fas fa-star js-clear js-fill"></i>
																	</c:when>
																	<c:otherwise>
																		<i class="stars__icon fas fa-star js-clear"></i>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</ul>
													</div>
													<p class="restaurant_info restaurant_category">#${i.category}</p>
												</div>
											</div>
											<div class=info_layout_bottomside>
												<p class="restaurant_info restaurant_address">${i.address}</p>
											</div>
										</div>
									</li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>

					<!-- Navigator 리스트를 표시 (getNavi(currentpage,search)) -->
					<div class="navigator">
						<ul class="navigator_list">${search_store_list_navi}</ul>
					</div>

				</div>

			</div>
	</form>

	<!--  맵 영역 -->
	<div class="map_layout">
		<div id="map"></div>



		<!-- 정렬 팝업 창 (SlideToggle)-->
		<form id="searchFilterForm" action="/searchStoreBySearchFilter.store"
			onsubmit="return false;">
			<input type="text" name="searchedBy" value="mapSearch"
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
						<input type="text" id="cost_set" name="cost_range"
							style="display: none;"> <input type="range"
							id="cost_range" class="form-range" min="0" max="4" step="1"
							onchange=SetValue()>
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
								<div class="food_name">음료/디저트</div>
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

	<input type="text" class="search_store_filter_toScript"
		id="fillter_settings_sortMethod" value="${sortMethod}"
		style="display: none;">
	<input type="text" class="search_store_filter_toScript"
		id="fillter_settings_cost_range" value="${cost_range}"
		style="display: none;">
	<input type="text" class="search_store_filter_toScript"
		id="fillter_settings_food_category_korean"
		value="${food_category_korean}" style="display: none;">
	<input type="text" class="search_store_filter_toScript"
		id="fillter_settings_food_category_western"
		value="${food_category_western}" style="display: none;">
	<input type="text" class="search_store_filter_toScript"
		id="fillter_settings_food_category_chinese"
		value="${food_category_chinese}" style="display: none;">
	<input type="text" class="search_store_filter_toScript"
		id="fillter_settings_food_category_japanese"
		value="${food_category_japanese}" style="display: none;">
	<input type="text" class="search_store_filter_toScript"
		id="fillter_settings_food_category_asian"
		value="${food_category_asian}" style="display: none;">
	<input type="text" class="search_store_filter_toScript"
		id="fillter_settings_food_category_fastfood"
		value="${food_category_fastfood}" style="display: none;">
	<input type="text" class="search_store_filter_toScript"
		id="fillter_settings_food_category_dessert_drink"
		value="${food_category_dessert_drink}" style="display: none;">
	<input type="text" class="search_store_filter_toScript"
		id="fillter_settings_food_category_etc" value="${food_category_etc}"
		style="display: none;">

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
		
		$(function(){
			
			// 필터 Toggle 기능 부여
			let sort_check = false;

			$("#show_filterForm_btn").on("click", function () {
				if(sort_check==false){
					$('#sort_layout').css({"display":""});
					sort_check=true;
				}else{
					$("#sort_layout").css({"display":"none"});
					sort_check=false;
				}
			})
		
		
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
			
			// 각 음식 카테고리 div에 boolean변수 부여(closer)
			$(".food_category_list").each(function (index, item) {
				let food_category_list_check = true;
				$(this).find(".food_category_menu").val(true);
				$(item).on("click", function () {
					if (food_category_list_check == false) {
						$(this).css({
							"border": "2px solid red"
						});
						$(this).find(".food_category_menu").val(true);
						food_category_list_check = true;
					} else {
						$(this).css({
							"border": "1px solid silver"
						});
						$(this).find(".food_category_menu").val(false);
						food_category_list_check = false;
					}
				})
			})
				
			// 필터 초기화 지정
			let sortMethod = $("#fillter_settings_sortMethod").val();
			let cost_range = $("#fillter_settings_cost_range").val();
			let food_category_korean = $("#fillter_settings_food_category_korean").val();
			let food_category_western = $("#fillter_settings_food_category_western").val();
			let food_category_chinese = $("#fillter_settings_food_category_chinese").val();
			let food_category_japanese = $("#fillter_settings_food_category_japanese").val();
			let food_category_asian = $("#fillter_settings_food_category_asian").val();
			let food_category_fastfood = $("#fillter_settings_food_category_fastfood").val();
			let food_category_dessert_drink = $("#fillter_settings_food_category_dessert_drink").val();
			let food_category_etc = $("#fillter_settings_food_category_etc").val();
			
			if(sortMethod=='order_by_distance'){
				$("#order_by_distance").click();
			}else if(sortMethod=='order_by_score'){
				$("#order_by_score").click();
			}
			
			let range_result = $("#range_result");
			
			if(cost_range=='5000이하'){
				$("#cost_range").val(0);
				$("#cost_set").val("5000이하");
				range_result.html("5000원 이하");
				
			}else if(cost_range=='5000~10000'){
				$("#cost_range").val(1);
				$("#cost_set").val("5000~10000");
				range_result.html("5000원 ~ 10000원");
				
			}else if(cost_range=='10000~15000'){
				$("#cost_range").val(2);
				$("#cost_set").val("10000~15000");
				range_result.html("10000원 ~ 15000원");
				
			}else if(cost_range=='15000~20000'){
				$("#cost_range").val(3);
				$("#cost_set").val("15000~20000");
				range_result.html("15000원 ~ 20000원");
				
			}else if(cost_range=='20000이상'){
				$("#cost_range").val(4);
				$("#cost_set").val("20000이상");
				range_result.html("20000원 이상");
			}
			
			
			if(food_category_korean!='true'){
				$("#food_category_korean").click();
			}
			if(food_category_western!='true'){
				$("#food_category_western").click();
			}
			if(food_category_chinese!='true'){
				$("#food_category_chinese").click();
			}
			if(food_category_japanese!='true'){
				$("#food_category_japanese").click();
			}
			if(food_category_asian!='true'){
				$("#food_category_asian").click();
			}
			if(food_category_fastfood!='true'){
				$("#food_category_fastfood").click();
			}
			if(food_category_dessert_drink!='true'){
				$("#food_category_dessert_drink").click();
			}
			if(food_category_etc!='true'){
				$("#food_category_etc").click();
			}
		})
		
		
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
		// 뒤로가기 버튼
		$("#toBack_btn").on("click",function(){
			location.href="/page/main.jsp";
		})
		
		// 검색 버튼
		$("#searchBtn").on("click",function(){
			$("#searchForm").prop("onsubmit",true);
			$("#searchForm").submit();
		})
		
		// 엔터 입력 시 검색 적용
		$("#search").on("keyup",function(input){
			if (input.keyCode == 13) {
				$("#searchForm").prop("onsubmit",true);
				$("#searchForm").submit();
		    }
		})
		
		// 검색 정렬 확인 버튼
		$("#apply_btn").on("click",function(){
			$("#searchFilterForm").prop("onsubmit",true);
			$("#searchFilterForm").submit();
		});
		
		// 검색 정렬 취소 버튼
		$("#cancel_btn").on("click",function(){
// 			$("#sortMethod").val("");
// 			$("#cost_set").val("");
			
// 			$(".food_category_menu").each(function(index, item){
// 			    $(item).val("true");
// 			});
			
			$("#searchForm").prop("onsubmit",true);
			$("#searchForm").submit();
		});
	</script>



	<!-- 지도 Script -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2504febed8c67836e8db1a31bda054e9">
	</script>



	<script>
		
		// 학원 지도 설정
		var container = document.getElementById('map');
		
		// 학원 중심 좌표 설정
		var options = {
			center: new kakao.maps.LatLng(37.567917, 126.983043),
			level: 3
		};
		
		// 학원 영역 변수 설정
		var khacademyMap = new kakao.maps.Map(container, options);
		
		// 학원 마커 이미지 등록
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	 	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
	    
		// 학원 마커 표시
		// 지도를 클릭한 위치에 표출할 마커입니다
		var khacademy = new kakao.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			position: khacademyMap.getCenter(),
			image: markerImage
			 // 마커이미지 설정 
		});
		// 지도에 마커를 표시합니다
		khacademy.setMap(khacademyMap);
	
		var InfoWindowContent = '<body><div class="restaurant_infoWindow"><div class="infoWindow_img_layout"><img class="infoWindow_img" src="/common/khplate1.jpg"></div><div class="infoWindow_info_layout"><div class="infoWindow_info_top">KH 아카데미</div><div class="infoWindow_info_bottom"></div></div></div></body>'

		
		// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		var khacademy_Content = InfoWindowContent; 
		// '<div style="padding:5px;">KH 아카데미<br><a href="https://map.kakao.com/link/map/KH 아카데미,37.567917,126.983043" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/KH 아카데미,37.567917,126.983043" style="color:blue" target="_blank">길찾기</a></div>',
		khacademy_Position = new kakao.maps.LatLng(37.567917,126.983043); 
		//인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : khacademy_Position, 
		    content : khacademy_Content
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		let infowindow_switch = false;
		kakao.maps.event.addListener(khacademy, 'click', function() {
			if(infowindow_switch==false){
				infowindow.open(khacademyMap, khacademy);
				$(".restaurant_infoWindow").parent().parent().css({
					"border":"0px",
					"background-color":"transparent"
				});
				infowindow_switch = true;
			}else{
				infowindow.close();
				infowindow_switch = false;
			}
		});
    	
    	let Store_markers = [];
    	
		$(function() {
			
			let list_length = '${search_store_list.size()}';
			
	    	for(i=0 ; i<list_length ; i++){
	    		let storeID = $("#search_store_list_storeID"+i).val();
		    	let name = $("#search_store_list_name"+i).val();
		    	let category = $("#search_store_list_category"+i).val();
				let lat = $("#search_store_list_lat"+i).val()
				let lng = $("#search_store_list_lng"+i).val()
				
				let marker_position = new kakao.maps.LatLng(lat, lng);
				
				// 마커를 생성합니다
			    let Store_marker = new kakao.maps.Marker({
			        position: marker_position
			    });

			    // 마커가 지도 위에 표시되도록 설정합니다
			    Store_marker.setMap(khacademyMap);
			    
			    // 배열 추가
			    Store_markers.push(Store_marker);
			    
				let marker_content = '<body><div class="restaurant_infoWindow"><div class="infoWindow_img_layout"><i class="fa-sharp fa-solid fa-fork-knife"></i></div><div class="infoWindow_info_layout"><div class="infoWindow_info_top">'+name+'</div><div class="infoWindow_info_bottom"># '+category+'</div></div></div></body>'
				let infowindow = new kakao.maps.InfoWindow({
				    position : marker_position, 
				    content : marker_content
				});
				let infowindow_switch = false;
				kakao.maps.event.addListener(Store_marker, 'click', function() {
					if(infowindow_switch==false){
						infowindow.open(khacademyMap, Store_marker);
						$(".restaurant_infoWindow").parent().parent().css({
							"border":"0px",
							"background-color":"transparent"
						});
						infowindow_switch = true;
					}else{
						infowindow.close();
						infowindow_switch = false;
					}
				});
			}
		});
		
		// 가게 클릭 시 이동
		$(".restaurant").on("click",function(){
			let storeID = $(this).find(".restaurant_storeID").val();
			console.log(storeID);
			location.href = "/view.store?storeID="+storeID;
		})

	</script>


</body>

</html>