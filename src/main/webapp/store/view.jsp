<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Insert title here</title>
				<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=714989160c4bbb672f636a880c6c8328"></script>
				<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
				<style>
					.container_noboot {
						margin-left: 0;
						margin-right: 0;
						max-width: 1920px;
					}

					.sidebar {
						width: 500px;
					}

					.body {
						width: 1420px;
					}

					#map {
						width: 500px;
						height: 500px;
					}

					.row-img {
						text-align: center;
					}

					.row-contents {
						overflow: hidden;
					}

					.row-contents>div {
						float: left;
					}

					.row-contents>.c1 {
						width: 500px;
					}

					.row-contents>.c2 {
						width: 920px;
					}

					.inputHeader {
						float: left;
						width: 20%;
					}

					.inputs {
						float: left;
						width: 80%;
					}

					.detail {
						overflow: hidden;
					}

					.star-ratings {
						color: #aaa9a9;
						position: relative;
						unicode-bidi: bidi-override;
						width: max-content;
						-webkit-text-fill-color: transparent;
						/* Will override color (regardless of order) */
						-webkit-text-stroke-width: 1.3px;
						-webkit-text-stroke-color: #2b2a29;
					}

					.star-ratings-fill {
						color: #fff58c;
						padding: 0;
						position: absolute;
						z-index: 1;
						display: flex;
						top: 0;
						left: 0;
						overflow: hidden;
						-webkit-text-fill-color: gold;
					}

					.star-ratings-base {
						z-index: 0;
						padding: 0;
					}

					#star a {
						text-decoration: none;
						color: gray;
					}

					#star a.on {
						color: #fff58c;
					}
				</style>
			</head>

			<body>
				<div class="container_noboot">
					<div class="sidebar">

					</div>
					<div class="body">
						<div class="row-img">
							<div id="carouselControls" class="carousel slide carousel-fade" data-bs-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img src="아비꼬1.jpg" class="d-block" alt="..."
											style="height: 500px; object-fit: contain;">
									</div>
									<div class="carousel-item">
										<img src="아비꼬2.jpg" class="d-block" alt="..."
											style="height: 500px; object-fit: contain;">
									</div>
								</div>
								<button class="carousel-control-prev" type="button" data-bs-target="#carouselControls"
									data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button" data-bs-target="#carouselControls"
									data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						</div>
						<div class="row-contents">
							<div id="map" class="c1"></div>
							<div class="detail c2">
								<div class="inputHeader">가게 이름</div>
								<input type="text" class="inputs" name="name" value="${dto.name}" readonly>
								<div class="inputHeader">가게 카테고리</div>
								<select name="category" class="inputs" disabled="disabled">
									<option>한식</option>
									<option>양식</option>
									<option>중식</option>
									<option>일식</option>
									<option>아시안</option>
									<option>디저트</option>
									<option>음료</option>
									<option>패스트푸드</option>
									<option>기타</option>
								</select>
								<div class="inputHeader">가게 주소</div>
								<input type="text" class="inputs" name="address" value="${dto.address}" readonly>
								<div class="inputHeader">평균평점</div>
								<div class="star-ratings" style="float:left; width:80%;">
									<div class="star-ratings-fill space-x-2 text-lg"
										style="width: ${dto.ratingToPercent()}%;">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
									<div class="star-ratings-base space-x-2 text-lg">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
										${dto.avgScore};
									</div>
								</div>
								<!-- <input type="text" class="inputs" name="avgScore" value="${dto.avgScore}" readonly> -->

								<div class="storeIntroduction">
									<div class="title">가게 소개</div>
									<div>
										<textarea id="intro_editor" name="introduction">${dto.introduction}</textarea>
									</div>
								</div>
								<div class="title">메뉴</div>
								<div class="contents">
									<table border="1">
										<tr>
											<th style="width:70%;">메뉴 이름</th>
											<th style="width:30%;">메뉴 가격</th>
										</tr>
										<c:forEach var="i" items="${menuList}">
											<tr>

											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>

						<div class="review">
							<div class="title">한줄 리뷰 추가</div>
							<form id="createCommentForm" action="/create.commentReview" method="get">
								<input type="text" name="storeID" value="${dto.storeID}" style="display:none;">
								<input type="text" name="userNo" value="(임시. 로그인 후 세션 userNo 만들어야 할 것)"
									style="display: none;">
								<div class="contents" style="overflow:hidden">
									<div id="star">
										<input type="text" name="score" value="0" style="display:none;">
										<a href="#" value="1">★</a>
										<a href="#" value="2">★</a>
										<a href="#" value="3">★</a>
										<a href="#" value="4">★</a>
										<a href="#" value="5">★</a>
									</div>
									<div style="float:left; width:80%;">
										<textarea id="review_editor" name="body"></textarea>
									</div>
									<div style="float:left; width:20%;">
										<button class="btn btn-primary">등록</button>
									</div>
								</div>
							</form>
							<div class="title">한줄 리뷰 목록</div>
							<div class="contents" style="overflow:hidden">
								<c:forEach var="i" begin="0" end="${fn:length(commentList)-1}" step="1">
									<div>작성자명 : ${userNameList.get(i)}</div>

									<div class="star-ratings-fill space-x-2 text-lg"
										style="width: ${commentList.get(i).ratingToPercent()}%;">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
									<div class="star-ratings-base space-x-2 text-lg">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
										${commentList.get(i).score};
									</div>

									<textarea id="review_editor${i}">
										${commentList.get(i).body};
									</textarea>

									<script>
										let target = "#review_editor" + "<c:out value='${i}'></c:out>"
										ClassicEditor
											.create(document.querySelector(target))
											.then(function (editor) {
												const toolbarElement = editor.ui.view.toolbar.element;
												toolbarElement.style.display = 'none';
												editor.enableReadOnlyMode('');
											})
											.catch(error => { console.error(error) });
									</script>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<script>
					//select 카테고리 기본 값 설정
					let category = "<c:out value='${dto.category}'></c:out>"
					$("select[name=category]").val(category);

					$("#star a").click(function () {
						$(this).parent().children("a").removeClass("on");
						$(this).addClass("on").prevAll("a").addClass("on");
						$("input[name=rating]").val($(this).attr("value"));
					});

					var myEditor = null;
					//에디터 스크립트
					ClassicEditor
						.create(document.querySelector("#intro_editor"), {
							toolbar: ['heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList', 'insertTable', 'blockQuote', 'undo', 'redo',]
						})
						.then(function (editor) {
							const toolbarElement = editor.ui.view.toolbar.element;
							myEditor = editor;
							editor.on('change:isReadOnly', (evt, propertyName, isReadOnly) => {
								if (isReadOnly) {
									toolbarElement.style.display = 'none';
								} else {
									toolbarElement.style.display = 'flex';
								}
							});
							editor.enableReadOnlyMode('');
						})
						.catch(error => { console.error(error) });
					ClassicEditor
						.create(document.querySelector("#review_editor"))
						.then(function (editor) {
							const toolbarElement = editor.ui.view.toolbar.element;
							toolbarElement.style.display = 'none';
						})
						.catch(error => { console.error(error) });

					//지도 스크립트
					let mapContainer = document.getElementById("map");
					let lat = "<c:out value='${dto.lat}'></c:out>";
					let lng = "<c:out value='${dto.lng}'></c:out>";
					let options = {
						//현재는 학원 좌표인데, 가게 중심 좌표 구해서 해봐야 할 것임.
						//가게 등록할 때, 마커 등록 시 function(e) -> e.latlan
						center: new kakao.maps.LatLng(37.567944388923316, 126.98295041529863),
						//center: new kakao.maps.LatLng(lat, lng),
						level: 3
					};
					let map = new kakao.maps.Map(mapContainer, options);

					marker = new kakao.maps.Marker({
						//position: new kakao.maps.LatLng(37.567944388923316, 126.98295041529863)
						position: new kakao.maps.LatLng(lat, lng)
					});
					marker.setMap(map);
				</script>
			</body>

			</html>