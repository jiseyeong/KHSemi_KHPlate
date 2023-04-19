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
						height: 400px;
					}
					.row-contents>div{
						float:left;
						margin-right:30px;
					}
				</style>
			</head>

			<body>
				<div class="container_noboot">
					<div class="sidebar">

					</div>
					<div class="body">
						<div class="row-img">
							<div id="carouselControls" class="carousel slide" data-bs-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img src="..." class="d-block w-100" alt="...">
									</div>
									<div class="carousel-item">
										<img src="..." class="d-block w-100" alt="...">
									</div>
									<div class="carousel-item">
										<img src="..." class="d-block w-100" alt="...">
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
							<div id="map"></div>
							<div class="detail">
								<div class="title">가게 이름</div>
								<div class="contents">${dto.storeName}</div>
								<div class="title">가게 주소</div>
								<div class="contents">${dto.storeAddress}</div>
								<div class="title">평균평점</div>
								<div class="contents">${dto.storeAvgScore}</div>
								<div class="title">가게 소개</div>
								<div class="contetns">${dto.storeBody}</div>
								<div class="title">메뉴</div>
								<div class="contents">
									<table border="1">
										<tr>
											<th style="width=40%;">메뉴 이름</th>
											<th style="width=20%;">메뉴 가격</th>
											<th style="width=20%;">국가 카테고리</th>
											<th style="width=20%;">메뉴 카테고리</th>
										</tr>
										<c:forEach var="i" items="${menuList}">
											<tr>

											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
							<div class="review">

							</div>
						</div>
					</div>
				</div>
				<script>
					let mapContainer = document.getElementById("map");
					let options = {
						//현재는 학원 좌표인데, 가게 중심 좌표 구해서 해봐야 할 것임.
						//가게 등록할 때, 마커 등록 시 function(e) -> e.latlan
						center: new kakao.maps.LatLng(37.567944388923316, 126.98295041529863),
						level: 3
					};
					let map = new kakao.maps.Map(mapContainer, options);

					function getInfo() {
						// 지도의 현재 중심좌표를 얻어옵니다 
						var center = map.getCenter();

						// 지도의 현재 레벨을 얻어옵니다
						var level = map.getLevel();

						// 지도타입을 얻어옵니다
						var mapTypeId = map.getMapTypeId();

						// 지도의 현재 영역을 얻어옵니다 
						var bounds = map.getBounds();

						// 영역의 남서쪽 좌표를 얻어옵니다 
						var swLatLng = bounds.getSouthWest();

						// 영역의 북동쪽 좌표를 얻어옵니다 
						var neLatLng = bounds.getNorthEast();

						// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
						var boundsStr = bounds.toString();


						var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
						message += '경도 ' + center.getLng() + ' 이고 <br>';
						message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
						message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
						message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
						message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';

						// 개발자도구를 통해 직접 message 내용을 확인해 보세요.
						console.log(message);
					};
				</script>
			</body>

			</html>