<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>가게 정보 확인</title>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
					rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
					rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/octicons/3.3.0/octicons.min.css"
					integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
					crossorigin="anonymous">
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
					crossorigin="anonymous"></script>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=714989160c4bbb672f636a880c6c8328"></script>
				<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>

				<style>
					/* 헤더 및 sideBar 부분 스타일 - 건들지 말것 */
					* {
						box-sizing: border-box;
						padding: 0px;
					}

					.body {
						margin: auto;
					}

					.sideList {
						border: 1px solid black;
					}

					/* 하단부터 메인부분 스타일 작성 요망 */

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

					.star a {
						text-decoration: none;
						color: gray;
					}

					.star a.on {
						color: #fff58c;
					}

					.star_other a {
						text-decoration: none;
						color: gray;
					}

					.star_other a.on {
						color: #fff58c;
					}

					.nonactive {
						display: none;
					}

					.carousel-inner img {
						margin: auto;
					}

					#map {
						width: 100%;
						height: 40vw;
					}
				</style>
			</head>

			<body>
				<div class="container-fluid themed-container m-0 g-0">
					<!-- 헤더부분 건들지 말것 -->
					<jsp:include page="/page/header.jsp" flush="false"></jsp:include>



					<!-- body 부분 row div 건들지 말것 -->
					<div class="row g-0 justify-content-center body" style="margin-top:70px;">
						<!-- sideBar부분 건들지 말것 -->
						<jsp:include page="/page/sideBar.jsp" flush="false"></jsp:include>

						<div class="col-12 col-lg-9 g-0 themed-grid-col bodyContents">
							<!-- Main 내용 부분 하단부터 수정 요망 -->
							<!-- 상점 헤더 이미지 -->
							<div class="row">
								<div class="col-12" id="imageBox">
									<div id="carouselControls" class="carousel slide carousel-fade"
										data-bs-ride="carousel">
										<div class="carousel-inner">
											<c:choose>
												<c:when test="${fn:length(imgList) > 0}">
													<c:forEach var="i" begin="0" end="${fn:length(imgList)-1}" step="1">
														<c:choose>
															<c:when test="${i == 0}">
																<div class="carousel-item active">
																	<img src="/store/${imgList.get(i).oriName}"
																		class="d-block object-fit-contain" alt="..."
																		style="height: 500px;">
																</div>
															</c:when>
															<c:otherwise>
																<div class="carousel-item">
																	<img src="/store/${imgList.get(i).oriName}"
																		class="d-block object-fit-contain" alt="..."
																		style="height: 500px;">
																</div>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<div class="carousel-item active">
														<img src="/store/아비꼬1.jpg" class="d-block object-fit-contain"
															alt="..." style="height: 500px;">
													</div>
													<div class="carousel-item">
														<img src="/store/아비꼬2.jpg" class="d-block object-fit-contain"
															alt="..." style="height: 500px;">
													</div>
												</c:otherwise>
											</c:choose>
										</div>
										<button class="carousel-control-prev" type="button"
											data-bs-target="#carouselControls" data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#carouselControls" data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
									</div>
								</div>
								<div class="col-12 text-end">
									<button type="button" id="btn_store_update" class="btn btn-outline-secondary">상점
										수정</button>
									<button type="button" id="btn_store_update_confirm" class="nonactive">수정 확정</button>
									<button type="submit" id="btn_store_update_cancel" class="nonactive">취소</button>
								</div>
								<div class="col-12 nonactive" id="imageModify">
									<c:if test="${fn:length(imgList) > 0}">
										<div class="row">
											<div class="col-12">
												<fieldset>
													<legend>이미지 삭제</legend>
													<div class="row">
														<c:forEach var="i" items="${imgList}">
															<form action="/deletePhoto.store" method="get">
																<input type="text" name="imageID" value="${i.imageID}"
																	style="display: none;" readonly>
																<input type="text" name="storeID" value="${dto.storeID}"
																	style="display: none;" readonly>
																<div class="col-8">
																	<img src="/store/${i.sysName}"
																		class="w-100 object-fit-contain">
																</div>
																<div class="col-4">
																	<button type="submit"
																		class="btn btn-outline-secondary">삭제</button>
																</div>
															</form>
														</c:forEach>
													</div>
												</fieldset>
											</div>
										</div>
									</c:if>
									<form id="updateForm" action="/update.store" method="post"
										enctype="multipart/form-data">
										<input type="text" name="storeID" value="${dto.storeID}" style="display:none;"
											readonly>
										<div class="row">
											<div class="col-12">
												이미지 추가 등록
												<button type="button" id="btn_image_add"
													class="btn btn-outline-secondary">+</button>
											</div>
											<div class="col-12">
												<fieldset>
													<legend>image list</legend>
													<!-- 여기에 name이 image0, image1 식의 name으로 file input 추가됨. 보내기 직전 name 태그 붙이기 시작. -->
													<div id="img_field"></div>
													<!-- <input type="text" name="imgLength" style="display: none;"> -->
												</fieldset>
											</div>
										</div>
								</div>
							</div>
							<!-- 상점 본문 -->
							<div class="row">
								<div class="col-12 col-lg-4">
									<div id="map"></div>
									<div class="mapInfo">
										<input type="text" name="mapLat" value="${dto.lat}" style="display:none;"
											readonly>
										<input type="text" name="mapLng" value="${dto.lng}" style="display:none;"
											readonly>
										<div class="row">
											<div class="col-12">
												<div class="input-group">
													<span class="input-group-text">거리(M)</span>
													<input type="text" name="mapDistance" class="form-control"
														value="${dto.distance}" readonly>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 col-lg-8">
									<div class="input-group">
										<span class="input-group-text">가게 이름</span>
										<input type="text" class="form-control" name="name" value="${dto.name}"
											readonly>
									</div>
									<div class="input-group">
										<span class="input-group-text">가게 카테고리</span>
										<select name="category" class="form-select" disabled="disabled">
											<option>한식</option>
											<option>양식</option>
											<option>중식</option>
											<option>일식</option>
											<option>아시안</option>
											<option>디저트/음료</option>
											<option>패스트푸드</option>
											<option>기타</option>
										</select>
									</div>
									<div class="input-group">
										<span class="input-group-text">1인당 가격범위</span>
										<select name="priceRange" class="form-select" disabled="disabled">
											<option>5000이하</option>
											<option>5000~10000</option>
											<option>10000~15000</option>
											<option>15000~20000</option>
											<option>20000이상</option>
										</select>
									</div>
									<div class="input-group">
										<span class="input-group-text">가게 주소</span>
										<input type="text" class="form-control" name="address" value="${dto.address}"
											readonly>
									</div>
									<div class="row">
										<div class="col-2">평균 평점</div>
										<div class="col-10">
											<div class="star-ratings" style="float:left;">
												<div class="star-ratings-fill space-x-2 text-lg"
													style="width: ${dto.ratingToPercent()}%;">
													<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
												</div>
												<div class="star-ratings-base space-x-2 text-lg">
													<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
												</div>
											</div>
											<div style="float:left;">
												${dto.avgScore}
											</div>
										</div>
									</div>
									<!-- <input type="text" class="inputs" name="avgScore" value="${dto.avgScore}" style="display: none;"> -->
									<div class="row">
										<div class="col-12">가게 소개</div>
										<div class="col-12">
											<textarea id="intro_editor"
												name="introduction">${dto.introduction}</textarea>
										</div>
									</div>
									</form>
									<div class="row">
										<div class="col-12">메뉴</div>
										<div class="col-12">
											<table class="table table-secondary table-striped">
												<tr>
													<th style="width:40%;">메뉴 이름</th>
													<th style="width:30%;">메뉴 가격</th>
													<th style="width:30%;"></th>
												</tr>
												<c:forEach var="i" items="${menuList}">
													<tr>
														<form id="menuUpdateForm${i.menuID}" action="/update.storeMenu"
															method="get">
															<input type="text" name="menuID" value="${i.menuID}"
																style="display: none;" readonly>
															<input type="text" name="storeID" value="${dto.storeID}"
																style="display: none;" readonly>
															<td><input type="text" id="updateMenuName${i.menuID}"
																	name="updateMenuName" value="${i.menuName}"
																	readonly></td>
															<td><input type="text" id="updateMenuPrice${i.menuID}"
																	name="updateMenuPrice" value="${i.menuPrice}"
																	readonly></td>
														</form>
														<td>
															<button type="button" class="btn_menu_update nonactive"
																id="btn_menu_update${i.menuID}">수정</button>
															<button type="button"
																id="btn_menu_update_confirm${i.menuID}"
																class="btn_menu_update_confirm nonactive">확정</button>
															<button type="button" id="btn_menu_delete${i.menuID}"
																class="btn_menu_delete nonactive">삭제</button>
															<form id="menuDeleteForm${i.menuID}"
																action="/delete.storeMenu" method="get">
																<input type="text" name="menuID" value="${i.menuID}"
																	style="display: none;" readonly>
																<input type="text" name="storeID" value="${dto.storeID}"
																	style="display: none;" readonly>
															</form>
														</td>
													</tr>
													<script>
														var menuID = "<c:out value='${i.menuID}'></c:out>";
														$("#btn_menu_delete" + menuID).click(function () {
															$("#menuDeleteForm" + menuID).submit();
														});
														$("#btn_menu_update" + menuID).click(function () {
															$("#btn_menu_update_confirm" + menuID).addClass("btn").addClass("btn-outline-secondary").removeClass("nonactive");
															$("#updateMenuName" + menuID).attr("readonly", false);
															$("#updateMenuPrice" + menuID).attr("readonly", false);
															$(this).css({ "display": "none" });
														});
														$("#btn_menu_update_confirm" + menuID).click(function () {
															$("#menuUpdateForm" + menuID).submit();
														})
														$("menuUpdateForm" + menuID).submit(function () {
															let menuPrice = $("#updateMenuPrice" + menuID).val();
															if (!menuPrice) {
																alert("메뉴 가격은 빈 값일 수 없습니다.");
																return false;
															} else if (isNaN(menuPrice)) {
																alert("메뉴 가격은 숫자 형식이어야 합니다.");
																return false;
															}
														});
													</script>
												</c:forEach>
												<form id="menuAddForm" action="/add.storeMenu" method="get">
													<input type="text" name="storeID" value="${dto.storeID}"
														style="display: none;" readonly>
													<tr id="menu_add" class="nonactive">
														<td>
															<div class="input-group">
																<span class="input-group-text">메뉴이름</span>
																<input type="text" class="form-control" name="menuName">
															</div>
														</td>
														<td>
															<div class="input-group">
																<span class="input-group-text">메뉴가격</span>
																<input type="text" class="form-control"
																	name="menuPrice">
															</div>
														</td>
														<td>
															<button type="submit"
																class="btn btn-outline-secondary">적용</button>
															<button type="button" id="btn_menu_cancel"
																class="btn btn-outline-secondary">취소</button>
														</td>
													</tr>
												</form>
											</table>
											<div class="row">
												<div class="col-12 text-end">
													<button type="button" id="btn_menu_add"
														class="btn btn-outline-secondary">메뉴 추가</button>
													<button type="button" id="btn_menu_modify"
														class="btn btn-outline-secondary">메뉴 수정</button>
													<button type="button" id="btn_menu_modify_cancel"
														class="nonactive">수정 모드 취소</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 리뷰 -->
							<div class="row">
								<c:if test="${not empty sessionScope.userno}">
									<div class="col-12">한줄 리뷰 추가</div>
									<form id="createCommentForm" action="/create.commentReview" method="post"
										enctype="multipart/form-data">
										<input type="text" name="storeID" value="${dto.storeID}" style="display:none;">
										<input type="text" name="userNo" value="${sessionScope.userno}"
											style="display: none;">
										<div class="col-12">
											이미지 등록
											<button type="button" id="btn_review_image_add"
												class="btn btn-outline-secondary">+</button>
										</div>
										<div class="col-12">
											<fieldset>
												<legend>image list</legend>
												<div id="review_img_field"></div>
											</fieldset>
										</div>
										<div class="col-12">
											<div class="row align-items-center">
												<div class="col-12">
													<div class="star">
														<input type="text" name="score" value="0" style="display:none;"
															id="score">
														<a href="#null" value="1">★</a>
														<a href="#null" value="2">★</a>
														<a href="#null" value="3">★</a>
														<a href="#null" value="4">★</a>
														<a href="#null" value="5">★</a>
													</div>
												</div>
												<div class="col-9">
													<textarea id="review_editor" name="body"></textarea>
												</div>
												<div class="col-3">
													<button class="btn btn-outline-secondary">등록</button>
												</div>
											</div>
										</div>
									</form>
									<script>
										ClassicEditor
											.create(document.querySelector("#review_editor"))
											.then(function (editor) {
												const toolbarElement = editor.ui.view.toolbar.element;
												toolbarElement.style.display = 'none';
											})
											.catch(error => { console.error(error) });
									</script>
								</c:if>
								<c:if test="${fn:length(commentList) > 0}">
									<div class="col-12">한줄 리뷰 목록</div>
									<div class="row">
										<c:forEach var="i" begin="0" end="${fn:length(commentList)-1}" step="1">
											<div class="col-12">작성자 : ${userIDList.get(i)}</div>

											<div class="col-12">
												<div id="readStar${i}" class="star-ratings active" style="float:left;">
													<div class="star-ratings-fill space-x-2 text-lg"
														style="width: ${commentList.get(i).ratingToPercent()}%;">
														<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
													</div>
													<div class="star-ratings-base space-x-2 text-lg">
														<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
													</div>
												</div>
												<div style="float:left;">
													${commentList.get(i).score}
												</div>
											</div>

											<div id="commentImgs${i}" class="col-12 nonactive">
												<div id="carouselControls${i}" class="carousel slide carousel-fade"
													data-bs-ride="carousel">
													<div id="commentCarousel${i}" class="carousel-inner">

													</div>
												</div>
												<button class="carousel-control-prev" type="button"
													data-bs-target="#carouselControls${i}" data-bs-slide="prev">
													<span class="carousel-control-prev-icon" aria-hidden="true"></span>
													<span class="visually-hidden">Previous</span>
												</button>
												<button class="carousel-control-next" type="button"
													data-bs-target="#carouselControls" data-bs-slide="next">
													<span class="carousel-control-next-icon${i}"
														aria-hidden="true"></span>
													<span class="visually-hidden">Next</span>
												</button>
											</div>

											<div id="commentImgsRemoveList${i}" class="col-12 nonactive">
												<table id="commentImgsRemoveTable${i}"
													class="table table-secondary table-striped">
													<tr>
														<th width="70%">이미지</th>
														<th width="30%">버튼</th>
													</tr>
												</table>
												<form id="commentImgsRemoveForm${i}" action="/deletePhoto.commentReview"
													method="get">
													<input type="text" name="imageID" id="deleteImageID${i}"
														style="display: none;">
													<input type="text" name="storeID" value="${dto.storeID}"
														style="display: none;">
												</form>
											</div>

											<script>
												var reviewID = "<c:out value='${commentList.get(i).reviewID}'></c:out>";
												$.ajax({
													url: "/getPhotoList.commentReview?reviewID=" + reviewID,
													dataType: "json"
												}).done(function (resp) {
													let i = "<c:out value='${i}'></c:out>";
													if (resp.length > 0) {
														$("#commentImgs" + i).removeClass("nonactive");
														let j = 0;
														$(resp).each(function () {
															//이미지 세팅
															let div_carousel = $("<div>").addClass("carousel-item");
															if (j++ == 0) {
																div_carousel.addClass("active");
															}
															let imgSource = "/CommentReview/" + this.sysName;
															let img = $("<img>").attr("src", imgSource).attr("alt", imgSource).addClass("d-block").addClass("object-fit-contain").addClass("w-100").css({ "height": "500px" });
															let img2 = $("<img>").attr("src", imgSource).attr("alt", imgSource).addClass("d-block").addClass("object-fit-contain").addClass("w-100").css({ "height": "500px" });

															div_carousel.append(img);
															$("#commentCarousel" + i).append(div_carousel);

															//삭제용 테이블 세팅
															let tr = $("<tr>"),
																td1 = $("<td>"),
																td2 = $("<td>"),
																btn_confirm = $("<button>").text("삭제"),
																commentImgsRemoveForm = "#commentImgsRemoveForm" + i;

															$("#deleteImageID" + i).attr("value", this.imageID);
															btn_confirm.click(function () {
																$(commentImgsRemoveForm).submit();
															});
															btn_confirm.addClass("btn").addClass("btn-outline-secondary");
															td1.append(img2);
															td2.append(btn_confirm);
															tr.append(td1);
															tr.append(td2);
															$("#commentImgsRemoveTable" + i).append(tr);
														});
													}
												});
											</script>

											<form id="updateCommentForm${i}" action="/update.commentReview"
												method="post" enctype="multipart/form-data">
												<input type="text" name="storeID" value="${dto.storeID}"
													style="display: none;">
												<input type="text" name="reviewID"
													value="${commentList.get(i).reviewID}" style="display: none;">

												<div class="col-12 nonactive" id="modifyAddImage${i}">
													<div class="row">
														<div class="col-12">
															이미지 추가 등록
															<button type="button" id="btn_review_image_add${i}"
																class="btn btn-outline-secondary">+</button>
														</div>
														<div class="col-12">
															<fieldset>
																<legend>add image list</legend>
																<div id="review_img_field${i}"></div>
															</fieldset>
														</div>
													</div>
												</div>

												<div id="writeStar${i}" class="col-12 star nonactive">
													<input type="text" id="score${i}" name="modifyScore" value="0"
														style="display:none;">
													<a href="#null" value="1">★</a>
													<a href="#null" value="2">★</a>
													<a href="#null" value="3">★</a>
													<a href="#null" value="4">★</a>
													<a href="#null" value="5">★</a>
												</div>
												<div class="col-12">
													<textarea id="review_editor${i}" name="modifyBody">
														${commentList.get(i).body}
													</textarea>
												</div>
											</form>
											<c:if test="${commentList.get(i).userNo == sessionScope.userno}">
												<div id="replyControl${i}" class="col-12 text-end">
													<button type="button" id="btn_modify${i}"
														class="btn btn-outline-secondary">수정</button>
													<button type="button" id="btn_delete${i}"
														class="nonactive">삭제</button>
													<form id="commentDeleteForm${i}" action="/delete.commentReview"
														method="get">
														<input type="text" name="reviewID"
															value="${commentList.get(i).reviewID}"
															style="display: none;">
														<input type="text" name="storeID" value="${dto.storeID}"
															style="display: none;">
													</form>
												</div>
											</c:if>

											<script>
												var i = "<c:out value='${i}'></c:out>";
												var target = "#review_editor" + i;
												ClassicEditor
													.create(document.querySelector(target))
													.then(function (editor) {
														const toolbarElement = editor.ui.view.toolbar.element;
														toolbarElement.style.display = 'none';
														editor.enableReadOnlyMode('');

														let btn_modify = "#btn_modify" + i;
														let btn_delete = "#btn_delete" + i;
														let commentDeleteForm = "#commentDeleteForm" + i;
														let readStar = "#readStar" + i;
														let btn_confirm = "#btn_confirm" + i;
														let btn_confirm_id = "btn_confirm" + i;
														let btn_cancel = "#btn_cancel" + i;
														let btn_cancel_id = "btn_cancel" + i;
														let commentImgsRemoveList = "#commentImgsRemoveList" + i;

														let writeStar = "#writeStar" + i;
														let score = "#score" + i;

														let replyControl = "#replyControl" + i;
														let updateForm = "#updateCommentForm" + i;

														let reviewImageModify = "#reviewImageModify" + i;
														let modifyAddImage = "#modifyAddImage" + i;
														//별점 버튼 이벤트 등록
														$(writeStar + " a").click(function () {
															$(this).parent().children("a").removeClass("on");
															$(this).addClass("on").prevAll("a").addClass("on");
															$(score).attr("value", $(this).attr("value"));
														});

														$(btn_delete).click(function () {
															$(commentDeleteForm).submit();
														});

														$(btn_modify).click(function () {
															console.log($(btn_confirm));
															if (!($(btn_confirm).length > 0)) {
																let btn_confirm_body = $("<button>");
																let btn_cancel_body = $("<button>");

																btn_confirm_body.text("수정완료");
																btn_confirm_body.attr("id", btn_confirm_id);
																btn_confirm_body.attr("type", "button");
																btn_confirm_body.addClass("btn").addClass("btn-outline-secondary");
																btn_confirm_body.click(function () {
																	$(updateForm).submit();
																});

																btn_cancel_body.attr("type", "button");
																btn_cancel_body.attr("id", btn_cancel_id);
																btn_cancel_body.addClass("btn").addClass("btn-outline-secondary");
																btn_cancel_body.text("취소");
																btn_cancel_body.click(function () {
																	$(btn_modify + "," + readStar).removeClass("nonactive");
																	$(btn_modify).addClass("btn").addClass("btn-outline-secondary");
																	$(btn_delete + "," + btn_confirm + "," + btn_cancel).removeClass("btn").removeClass("btn-outline-secondary");
																	$(btn_confirm + "," + btn_cancel + "," + writeStar + "," + btn_delete + "," + commentImgsRemoveList).addClass("nonactive");
																	editor.enableReadOnlyMode("");
																	$(reviewImageModify).addClass("nonactive");
																	$(modifyAddImage).addClass("nonactive");
																});

																$(replyControl).prepend(btn_confirm_body);
																$(replyControl).prepend(btn_cancel_body);

																$.ajax({
																	url: "/getPhotoList.commentReview?reviewID=" + reviewID,
																	dataType: "json"
																}).done(function (resp) {

																	let row1 = $("<div>").addClass("row"),
																		col1 = $("<div>").addClass("col-12"),
																		fieldSet1 = $("<fieldset>"),
																		legend1 = $("<legend>").text("이미지 삭제"),
																		row2 = $("<div>").addClass("row");

																	$("#reviewImageModify" + i).append(row1);
																	row1.append(col1);
																	col1.append(fieldSet1);
																	fieldSet1.append(legend1);
																	fieldSet1.append(row2);
																	resp.each(function(){
																		let form = $("<form>").attr("action", "/deletePhoto.commentReview");

																		let input_imageID = $("<input>").attr("type", "text").attr("name", "imageID").attr("value", this.imageID).css({ "display": "none" });
																		let input_storeID = $("<input>").attr("type", "text").attr("name", "storeID").attr("value", "${dto.storeID}").css({ "display": "none" });
																		let sub_col1 = $("<div>").addClass("col-8"),
																			sub_col2 = $("<div>").addClass("col-4"),
																			imgSource = "/CommentReview/" + this.sysName;
																		sub_col1_content = $("<img>").attr("src", imgSource).addClass("w-100").addClass("object-fit-contain"),
																			sub_col2_content = $("<button>").text("삭제").attr("type", "button").addClass("btn").addClass("btn-outline-secondary");

																		sub_col2_content.click(function () {
																			form.submit();
																		});

																		form.append(input_imageID);
																		form.append(input_storeID);
																		sub_col1.append(sub_col1_content);
																		sub_col2.append(sub_col2_content);
																		form.append(sub_col1);
																		form.append(sub_col2);

																		row2.append(form);
																	})
																});

																//밖에 꺼내면 변수명 문제가 생겨서, 클로저 개념 기대하며 제작.
																let reviewImgs = [];
																let review_maxlength = 3;
																let imgForms2 = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
																$("#btn_review_image_add" + i).click(function () {
																	if (reviewImgs.length < review_maxlength) {
																		let div = $("<div>"),
																			fileInput = $("<input type='file' accept='image/*'>"),
																			btn_cancel = $("<button>");
																		div.addClass("input-group");
																		fileInput.addClass("form-control");
																		btn_cancel.addClass("btn");
																		btn_cancel.addClass("btn-outline-secondary")
																		btn_cancel.append("x");
																		div.append(fileInput, btn_cancel);
																		$("#review_img_field" + i).append(div);
																		reviewImgs.push(div);
																		btn_cancel.click(function () {
																			reviewImgs.splice(reviewImgs.indexOf(div), 1);
																			div.remove();
																		});
																	}
																});
																$("#updateCommentForm" + i).submit(function (e) {
																	// $("input[name=imgLength]").val(imgs.length);
																	for (let i = 0; i < reviewImgs.length; i++) {
																		// if (imgs[i].children("input").val() == "" || imgs[i].children("input").val() == null) {
																		//     alert("이미지 첨부 파일을 빈 상태로 두실 수 없습니다.")
																		//     return false;
																		//} else
																		if (!reviewImgs[i].children("input").val().match(imgForms2)) {
																			alert("이미지 파일만 업로드 가능합니다.");
																			return false;
																		}
																		reviewImgs[i].children("input").attr("name", "image" + i);
																	}
																});
															}
															if (editor.isReadOnly) {
																editor.disableReadOnlyMode("");
																$(btn_modify + "," + readStar).addClass("nonactive");
																$(btn_modify).removeClass("btn").removeClass("btn-outline-secondary");
																$(btn_delete + "," + btn_confirm + "," + btn_cancel).addClass("btn").addClass("btn-outline-secondary");
																$(btn_confirm + "," + btn_cancel + "," + writeStar + "," + btn_delete + "," + commentImgsRemoveList).removeClass("nonactive");
																$(reviewImageModify).removeClass("nonactive");
																$(modifyAddImage).removeClass("nonactive");
															}
														});
													})
													.catch(error => { console.error(error) });


											</script>

										</c:forEach>
									</div>
								</c:if>
							</div>

							<script>
								//select 카테고리 기본 값 설정
								let category = "<c:out value='${dto.category}'></c:out>";
								$("select[name='category']").val(category);
								let priceRange = "<c:out value='${dto.priceRange}'></c:out>";
								$("select[name='priceRange']").val(priceRange);

								//별점 버튼 이벤트 등록
								$(".star a").click(function () {
									$(this).parent().children("a").removeClass("on");
									$(this).addClass("on").prevAll("a").addClass("on");
									$("input[name='score']").attr("value", $(this).attr("value"));
								});

								//메뉴 추가 버튼 이벤트 등록
								$("#btn_menu_add").click(function () {
									$("#menu_add").removeClass("nonactive");
								});

								$("#btn_menu_cancel").click(function () {
									$("#menu_add").addClass("nonactive");
								})

								$("#menuAddForm").submit(function () {
									let menuPrice = $("input[name='menuPrice']").val();
									if (!menuPrice) {
										alert("메뉴 가격은 빈 값일 수 없습니다.");
										return false;
									} else if (isNaN(menuPrice)) {
										alert("메뉴 가격은 숫자 형식이어야 합니다.");
										return false;
									}
								});

								$("#btn_menu_modify").click(function () {
									$(".btn_menu_delete").removeClass("nonactive").addClass("btn").addClass("btn-outline-secondary");
									$(".btn_menu_update").removeClass("nonactive").addClass("btn").addClass("btn-outline-secondary");
									$("#btn_menu_modify_cancel").removeClass("nonactive").addClass("btn").addClass("btn-outline-secondary");
									$(this).addClass("nonactive").removeClass("btn").removeClass("btn-outline-secondary");
								});

								$("#btn_menu_modify_cancel").click(function () {
									let storeID = "<c:out value='${dto.storeID}'></c:out>";
									location.href = "/view.store?storeID=" + storeID;
								});

								$("#btn_store_update").click(function () {
									$("#btn_store_update_confirm").removeClass("nonactive").addClass("btn").addClass("btn-outline-secondary");
									$("#btn_store_update_cancel").removeClass("nonactive").addClass("btn").addClass("btn-outline-secondary");
									$(this).addClass("nonactive").removeClass("btn").removeClass("btn-outline-secondary");

									updateOn = true;
									$("input[name='name']").removeAttr("readonly");
									$("select[name='category']").removeAttr("disabled");
									$("select[name='priceRange']").removeAttr("disabled");
									$("input[name='address']").removeAttr("readonly");
									myEditor.disableReadOnlyMode("");
									$("#imageBox").addClass("nonactive");
									$("#imageModify").removeClass("nonactive");
								});

								$("#btn_store_update_confirm").click(function () {
									$("#updateForm").submit();
								});

								$("#btn_store_update_cancel").click(function () {
									let storeID = "<c:out value='${dto.storeID}'></c:out>";
									location.href = "/view.store?storeID=" + storeID;
								});


								//이미지 추가 등록 스크립트
								let imgs = [];
								let alreadyImgsLength = "<c:out value='${fn:length(imgList)}'></c:out>"
								let maxlength = 5 - alreadyImgsLength;
								let imgForms = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
								$("#btn_image_add").click(function () {
									if (imgs.length < maxlength) {
										let div = $("<div>"),
											fileInput = $("<input type='file' accept='image/*'>"),
											btn_cancel = $("<button>");
										div.addClass("input-group");
										fileInput.addClass("form-control");
										btn_cancel.addClass("btn");
										btn_cancel.addClass("btn-outline-secondary")
										btn_cancel.append("x");
										div.append(fileInput, btn_cancel);
										$("#img_field").append(div);
										imgs.push(div);

										btn_cancel.click(function () {
											imgs.splice(imgs.indexOf(div), 1);
											div.remove();
										});
									}
								});

								$("#updateForm").submit(function (e) {
									// $("input[name=imgLength]").val(imgs.length);
									for (let i = 0; i < imgs.length; i++) {
										// if (imgs[i].children("input").val() == "" || imgs[i].children("input").val() == null) {
										//     alert("이미지 첨부 파일을 빈 상태로 두실 수 없습니다.")
										//     return false;
										//} else
										if (!imgs[i].children("input").val().match(imgForms)) {
											alert("이미지 파일만 업로드 가능합니다.");
											return false;
										}
										imgs[i].children("input").attr("name", "image" + i);
									}
								});

								let reviewImgs = [];
								let review_maxlength = 3;
								let imgForms2 = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
								$("#btn_review_image_add").click(function () {
									if (reviewImgs.length < review_maxlength) {
										let div = $("<div>"),
											fileInput = $("<input type='file' accept='image/*'>"),
											btn_cancel = $("<button>");
										div.addClass("input-group");
										fileInput.addClass("form-control");
										btn_cancel.addClass("btn");
										btn_cancel.addClass("btn-outline-secondary")
										btn_cancel.append("x");
										div.append(fileInput, btn_cancel);
										$("#review_img_field").append(div);
										reviewImgs.push(div);
										btn_cancel.click(function () {
											reviewImgs.splice(reviewImgs.indexOf(div), 1);
											div.remove();
										});
									}
								});
								$("#createCommentForm").submit(function (e) {
									// $("input[name=imgLength]").val(imgs.length);
									for (let i = 0; i < reviewImgs.length; i++) {
										// if (imgs[i].children("input").val() == "" || imgs[i].children("input").val() == null) {
										//     alert("이미지 첨부 파일을 빈 상태로 두실 수 없습니다.")
										//     return false;
										//} else
										if (!reviewImgs[i].children("input").val().match(imgForms2)) {
											alert("이미지 파일만 업로드 가능합니다.");
											return false;
										}
										reviewImgs[i].children("input").attr("name", "image" + i);
									}
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

								//지도 스크립트
								let mapContainer = document.getElementById("map");
								let lat = "<c:out value='${dto.lat}'></c:out>";
								let lng = "<c:out value='${dto.lng}'></c:out>";
								let updateOn = false;
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
								kakao.maps.event.addListener(map, "click", function (e) {
									if (updateOn) {
										if (marker != null) {
											marker.setMap(null);
										}
										let pos = e.latLng;
										marker = new kakao.maps.Marker({
											position: pos
										});
										let lat = pos.toString().split(',')[0].split('(')[1],
											lng = pos.toString().split(',')[1].split(')')[0];
										$("input[name=mapLat]").val(lat);
										$("input[name=mapLng]").val(lng);
										marker.setMap(map);

										let dLat = (37.567944388923316 - lat) * (Math.PI / 180);
										let dLng = (126.98295041529863 - lng) * (Math.PI / 180);
										let a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(37.567944388923316 * (Math.PI / 180)) * Math.cos(lat * (Math.PI / 180)) * Math.sin(dLng / 2) * Math.sin(dLng / 2);
										let c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
										let d = 6371 * c;
										$("input[name=mapDistance]").val(Math.round(d * 1000));
									}
								});
							</script>

							<!-- body main 수정 여기까지, 하단 건들지 말것. -->
						</div>
					</div>

					<jsp:include page="/page/footer.jsp" flush="false"></jsp:include>
				</div>

			</body>

			</html>