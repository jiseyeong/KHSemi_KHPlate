<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Mypage</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;

* {
	box-sizing: border-box;
	font-family: 'Nanum Gothic', sans-serif;
}

a {
	text-decoration: none;
}

button {
	border-radius: 15px;
	border: 1px solid #4dae3c;
	background-color: white;
	color: #4dae3c;
	font-size: 12px;
	height: 30px;
}

button:hover {
	color: white;
	background-color: #4dae3c;
}

.mypage {
	margin: auto;
	margin-top: 20px;
}

.myPageHeader {
	height: 4%;
	width: 80%;
	text-align: center;
	line-height: 60px;
	font-size: 14px;
	background-color: #ED1C16;
	color: white;
	font-width: bold;
	border-radius: 30px;
	box-shadow: 1px 1px 5px 1px silver;
	text-align: center;
	position: relative;
	left: 70px;
	margin-bottom: 30px;
}

.body1 {
	width:100%;
	height: 60%;
}

.body1>div {
	float: left;
	height: 100%;
}

.profile {
/* 	width: 35%; */
}

.inpomation {
/* 	width: 65%; */
}

.inpomation>.inpocontents1 {
	float: left;
	height: 100%;
}

.inpocontents1 {
	width: 20%;
	line-height: 25px;
}

.inpocontents1>#ul2 {
	list-style: none;
	margin-top: 50px;
	padding: 0px;
	padding-left: 40px;
}

/* .inpocontents1>#ul>.li { */

/* 	font-size: 15px; */
/* 	line-height: 25px; */
/* 	width: 110px; */
/*     font-weight: 700; */

/* } */
.inpocontents2 {
	width: 80%;
	padding-top: 45px;
	padding-left: 200px;
	position: relative;
	margin-bottom: 30px;
}

.inpocontents2>input {
	margin-bottom: 22px;
	width: 100%;
}

#myid {
	font-size: 16px;
	position: relative;
	font-weight: bold;
	margin-top: 15px;
}

#mypw1 {
	font-size: 16px;
	position: relative;
	font-weight: bold;
	margin-top: 40px;
}

#mypw2 {
	width: 95px;
	font-size: 16px;
	position: relative;
	font-weight: bold;
	margin-top: 40px;
}

#myname {
	width: 95px;
	font-size: 16px;
	position: relative;
	font-weight: bold;
	margin-top: 40px;
}

#mynickname {
	width: 95px;
	font-size: 16px;
	position: relative;
	font-weight: bold;
	margin-top: 36px;
}

#myphone {
	width: 95px;
	font-size: 16px;
	position: relative;
	font-weight: bold;
	margin-top: 35px;
}

#myemail {
	width: 95px;
	font-size: 16px;
	position: relative;
	font-weight: bold;
	margin-top: 35px;
}

#myclass {
	width: 95px;
	font-size: 16px;
	position: relative;
	font-weight: bold;
	margin-top: 37px;
}

#myself {
	width: 95px;
	font-size: 16px;
	position: relative;
	font-weight: bold;
	margin-top: 35px;
}

#myfavorite {
	width: 95px;
	font-size: 16px;
	position: relative;
	font-weight: bold;
	margin-top: 36px;
}

.inputPw2 {
	margin-top: 5px;
}

.inputPw2>input {
	width: 54%
}

#pwConfirm {
	margin-left: 10px;
	display: inline-block;
}

.inpocontents2>button {
	width: 75px;
	position: relative;
	left: 90px;
}

.profileImage {
	height: 65%;
	margin-top: 35px;
	margin-left: 120px;
}

.profileImage>button {
	margin-top: 20px;
	font-size: 12px;
	width: 75px;
	text-align: center;
	margin-left: 90px;
}

.proImage {
	width: 250px;
	height: 250px;
	border-radius: 200px;
	border: 1px solid black;
}

.profileName {
	height: 35%;
	text-align: center;
}

.profileName>button {
	margin-top: 50px;
	font-size: 12px;
	width: 75px;
}

#postSearch {
	position: relative;
	left: 15px;
	top: 0px;
	display: none;
}

#modiComBtn {
	display: none;
}

.body2 {
	height: 40%;
}

.body2Navi {
	height: 7%;
}

.body2Navi>a {
	height: 100%;
	background-color: white;
	border: 1px solid black;
	color: black;
	position: relative;
	top: 1px;
	font-size: 12px;
	height: 30px;
	display: inline-block;
	/* 	80 => 130px로 변경 */
	width: 130px;
	text-align: center;
	background-color: rgb(240, 240, 240);
	line-height: 30px;
}

.body2Navi>a:first-of-type {
	border-bottom: none;
}

.body2Contents {
	width: 100%;
	height: 530px;
	border: 1px solid black;
	box-shadow: 1px 1px 5px 1px silver;
	background-color: rgb(240, 240, 240);
	padding: 30px;
	/* 	하단 네비게이터를 붙이기 위한 position 부여 */
	position: relative;
}

.body2Contents>table {
	width: 100%;
	text-align: center;
	font-size: 14px;
	magin: 0 auto;
}

#replyList {
	display: none;
}

#reviewMark {
	display: none;
}

#consultList {
	display: none;
}

#favoriteStoreList {
	display: none;
}

/* 하단 네비게이터 추가 */
/* 네비게이터 영역 */
.body2listNavi {
	border: 1px solid black;
	height: 60px;
	width: 100%;
	text-align: center;
	margin: 20px auto 0 auto;
	padding: 10px 0px 10px;
	background-color: rgb(240, 240, 240);
	position: absolute;
	bottom: 0px;
	left: 0px;
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

/* 리스트 출력 관련 사항 */
td {
	/* 	텍스트를 한 줄로 처리 */
	white-space: nowrap;
	/* 글 내용 넘어가면 숨김처리 */
	overflow: hidden;
	/* 	텍스트에 ...생략기호 부여 */
	text-overflow: ellipsis;
}

.inputcss {
	height: 40px;
	width: 100%;
	border-radius: 4px;
	line-height: 22px;
	color: #c4c3ca;
	background-color: #f2f2f2;
	border: none;
	box-shadow: 0 4px 8px 0 rgba(21, 21, 21, .2);
}

#modiBtn {
	font-family: 'Nanum Gothic', sans-serif;
	background-color: #57b846;
	color: rgba(255, 255, 255, 0.9);
}

#modiBtn:hover {
	opacity: 80%;
}

#modiComBtn:hover {
	opacity: 80%;
}

#memberoutBtn {
	font-family: 'Nanum Gothic', sans-serif;
	background-color: #57b846;
	color: rgba(255, 255, 255, 0.9);
	font-weight: normal;
}

#memberoutBtn:hover {
	opacity: 50%;
}

#modiComBtn {
	font-family: 'Nanum Gothic', sans-serif;
	background: #57b846;
	color: #dfdeee;
}
</style>
</head>
<body>
	<div class="mypage">
		<div class="myPageHeader">마이페이지</div>
		<div class="row body1">
			<div class="col-12 col-lg-4 profile">
				<div class="profileImage">
					<div class="proImage"></div>

					<button>변경하기</button>
				</div>
			</div>
			<div class="col-12 col-lg-8 inpomation">
				<div class="inpocontents1">
					<div id="ul2">
						<div id="myid">아이디</div>
						<div id="mypw1">비밀번호</div>
						<div id="mypw2">비밀번호 확인</div>
						<div id="myname">이름</div>
						<div id="mynickname">닉네임</div>
						<div id="myemail">email</div>
						<div id="myclass">클래스명</div>
						<div id="myself">한줄소개</div>
						<div id="myfavorite">최애음식</div>
					</div>
				</div>
				<form action="/update.members" method="post" id="updateForm">
					<div class="inpocontents2">
						<input type="text" value="${my.userID}" id="id" class="inputcss"
							readonly><br> <input type="password"
							value="${my.pw}" id="pw1" name="pw" class="inputcss" readonly><br>
						<input type="password" id="pw2" class="inputcss" readonly
							id="pwConfirm"><br> <input type="text"
							value="${my.name}" class="inputcss" readonly><br> <input
							type="text" value="${my.nickname}" class="inputcss" id="nickname"
							name="nickname" readonly><br><input type="text" value="${my.email}"
							class="inputcss" id="email" name="email" readonly><br>
						<input type="text" value="${my.classes}" class="inputcss" readonly><br>
						<input type="text" value="${my.selfcomment}" class="inputcss"
							id="selfcomment" name="selfcomment" readonly><br> <input
							type="text" value="${my.favoriteFood}" class="inputcss"
							id="favoriteFood" name="favoriteFood" readonly><br>

						<button id="modiBtn" type="button">수정하기</button>
						<button id="modiComBtn" type="submit">수정완료</button>
						<button id="memberoutBtn" type="button">회원탈퇴</button>
					</div>
				</form>
			</div>
		</div>
		<div class="d-none d-md-block body2">
			<div class="body2Navi">
				<a href="#null" class="myContents" id="writeListBtn">내가 쓴 글</a> <a
					href="#null" class="myContents" id="replyListBtn">내가 쓴 댓글</a> <a
					href="#null" class="myContents" id="reviewMarkBtn">내가 스크랩한 리뷰</a> <a
					href="#null" class="myContents" id="favoriteStoreListBtn">내가
					즐겨찾기한 가게</a> <a href="#null" class="myContents" id="consultListBtn">1:1
					문의</a>
			</div>
			<div class="body2Contents">
				<table border-bottom="1" class="table" id="writeList">
					<!--내가 쓴 글 리스트 뽑아내기-->
					<colgroup>
						<col width="10%">
						<col width="45%">
						<col width="20%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th></th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody id="writeListToPrint">
						<!-- 리스트 출력 구간 -->
					</tbody>
				</table>
				<table border-bottom="1" class="table" id="replyList">
					<!--내가 쓴 댓글 리스트 뽑아내기-->
					<colgroup>
						<col width="10%">
						<col width="45%">
						<col width="20%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>맛집 이름</th>
							<th>댓글 내용</th>
							<th>평점</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody id="replyListToPrint">
						<!-- 리스트 출력 구간 -->
					</tbody>
				</table>
				<table border-bottom="1" class="table" id="reviewMark">
					<!--블로그형 리뷰 스크랩-->
					<colgroup>
						<col width="10%">
						<col width="45%">
						<col width="20%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>맛집 이름</th>
							<th>리뷰 작성일</th>
						</tr>
					</thead>
					<tbody id="reviewMarkToPrint">
						<!-- 리스트 출력 구간 -->
					</tbody>
				</table>

				<!--     새로 추가한 내가 즐겨찾기 한 가게 리스트 -->
				<table border-bottom="1" class="table" id="favoriteStoreList">
					<!-- 가게 즐겨찾기 리스트-->
					<colgroup>
						<col width="10%">
						<col width="45%">
						<col width="20%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>맛집 no.</th>
							<th>맛집 이름</th>
							<th>맛집 주소</th>
							<th>맛집 카테고리</th>
							<th>맛집 평점</th>
						</tr>
					</thead>
					<tbody id="favoriteStoreListToPrint">
						<!-- 리스트 출력 구간 -->
					</tbody>
				</table>

				<table border-bottom="1" class="table" id="consultList">
					<!-- 1:1문의 리스트 -->
					<colgroup>
						<col width="10%">
						<col width="45%">
						<col width="20%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody id="consultListToPrint">
						<!-- 리스트 출력 구간 -->
					</tbody>
				</table>

				<!-- 추가한 네비게이터 -->
				<div class="body2listNavi">
					<ul class="navigator_list"></ul>
				</div>
			</div>

		</div>
	</div>
	<script>
		$("#postSearch").on("click", function() { // 주소 API

			new daum.Postcode({
				oncomplete : function(data) {
					let roadAddr = data.roadAddress;
					document.getElementById('zipCode').value = data.zonecode;
					document.getElementById("address1").value = roadAddr;
				}
			}).open();
		})

		$("document")
				.ready(
						function() {

							$("#memberoutBtn").on("click", function() { //탈퇴하기 버튼 누를 때 이동
								location.href = "/memberout/memberout.jsp";
							})

							$("#modiBtn")
									.on(
											"click",
											function() { //수정하기

												$("#postSearch").css("display",
														"inline-block");
												$("#modiBtn").css("display",
														"none");
												$("#modiComBtn").css("display",
														"inline-block");
												$(
														"#pw1,#pw2,#nickname,#phone,#email,#zipCode,#address1,#address2,#selfcomment,#favoriteFood")
														.removeAttr("readonly");
											})

							$("#modiComBtn").on("click", function() { //수정완료
								$("#modiComBtn").css("display", "none");
								$("#modiBtn").css("display", "inline-block");
								$("#postSearch").css("display", "none");
								$("input").attr("readonly", true);
							})

							$(".myContents").on("click", function() { //내가 쓴글...등 버튼 이벤트
								$(this).css("border-bottom", "none");
								$(".myContents").not(this).css({
									"z-index" : "1",
									"border-bottom" : "1px solid black"
								});
							})

							// 페이지 렌더링 후 바로 보여줄 내가 쓴 글의 리스트와 네비
							$
									.ajax({
										url : "/selectBymypage.fullreview",
										type : "post",
										dataType : "json"
									})
									.done(
											function(resp) {
												$("#writeListToPrint").html("");
												$(".navigator_list").html("");
												let writeFullReviewList = JSON
														.parse(resp.writeFullReviewList);
												let writeFullReviewNavi = JSON
														.parse(resp.writeFullReviewNavi);
												$("#writeListToPrint").append(
														writeFullReviewList);
												$(".navigator_list").append(
														writeFullReviewNavi);

												$("#writeList").css("display",
														"table");
												$("table").not(
														"table#writeList").css(
														"display", "none");

												setnavi();
											})

							//내가 쓴 글 버튼 누르면 관련 테이블 나오게 이벤트
							$("#writeListBtn")
									.on(
											"click",
											function() {

												$
														.ajax(
																{
																	url : "/selectBymypage.fullreview",
																	type : "post",
																	dataType : "json"
																})
														.done(
																function(resp) {
																	$(
																			"#writeListToPrint")
																			.html(
																					"");
																	$(
																			".navigator_list")
																			.html(
																					"");
																	let writeFullReviewList = JSON
																			.parse(resp.writeFullReviewList);
																	let writeFullReviewNavi = JSON
																			.parse(resp.writeFullReviewNavi);
																	$(
																			"#writeListToPrint")
																			.append(
																					writeFullReviewList);
																	$(
																			".navigator_list")
																			.append(
																					writeFullReviewNavi);

																	$(
																			"#writeList")
																			.css(
																					"display",
																					"table");
																	$("table")
																			.not(
																					"table#writeList")
																			.css(
																					"display",
																					"none");

																	setnavi();
																})
											})

							//내가 쓴 댓글 버튼 누르면 관련 테이블 나오게 이벤트
							$("#replyListBtn")
									.on(
											"click",
											function() {

												$
														.ajax(
																{
																	url : "/selectBymypage.commentReview",
																	type : "post",
																	dataType : "json"
																})
														.done(
																function(resp) {
																	$(
																			"#replyListToPrint")
																			.html(
																					"");
																	$(
																			".navigator_list")
																			.html(
																					"");
																	let writeMyCommentList = JSON
																			.parse(resp.writeMyCommentList);
																	let writeMyCommentNavi = JSON
																			.parse(resp.writeMyCommentNavi);
																	$(
																			"#replyListToPrint")
																			.append(
																					writeMyCommentList);
																	$(
																			".navigator_list")
																			.append(
																					writeMyCommentNavi);

																	$(
																			"#replyList")
																			.css(
																					"display",
																					"table");
																	$("table")
																			.not(
																					"table#replyList")
																			.css(
																					"display",
																					"none");

																	setnavi();
																})
											})

							//내가 스크랩한 블로그 버튼 누르면 관련 테이블 나오게 이벤트\
							$("#reviewMarkBtn")
									.on(
											"click",
											function() {

												$
														.ajax(
																{
																	url : "/selectScrapListBymypage.fullreview",
																	type : "post",
																	dataType : "json"
																})
														.done(
																function(resp) {
																	$(
																			"#reviewMarkToPrint")
																			.html(
																					"");
																	$(
																			".navigator_list")
																			.html(
																					"");
																	let myFullReviewScrapList = JSON
																			.parse(resp.myFullReviewScrapList);
																	let myFullReviewScrapNavi = JSON
																			.parse(resp.myFullReviewScrapNavi);

																	$(
																			"#reviewMarkToPrint")
																			.append(
																					myFullReviewScrapList);
																	$(
																			".navigator_list")
																			.append(
																					myFullReviewScrapNavi);

																	$(
																			"#reviewMark")
																			.css(
																					"display",
																					"table");
																	$("table")
																			.not(
																					"table#reviewMark")
																			.css(
																					"display",
																					"none");

																	setnavi();
																})
											})

							//즐겨찾기 버튼 누르면 관련 테이블 나오게 이벤트
							$("#favoriteStoreListBtn")
									.on(
											"click",
											function() {

												$
														.ajax(
																{
																	url : "/selectFavoriteStore.store",
																	type : "post",
																	dataType : "json"
																})
														.done(
																function(resp) {
																	$(
																			"#favoriteStoreListToPrint")
																			.html(
																					"");
																	$(
																			".navigator_list")
																			.html(
																					"");
																	let FavoriteStoreList = JSON
																			.parse(resp.FavoriteStoreList);
																	let FavoriteStoreNavi = JSON
																			.parse(resp.FavoriteStoreNavi);
																	$(
																			"#favoriteStoreListToPrint")
																			.append(
																					FavoriteStoreList);
																	$(
																			".navigator_list")
																			.append(
																					FavoriteStoreNavi);

																	$(
																			"#favoriteStoreList")
																			.css(
																					"display",
																					"table");
																	$("table")
																			.not(
																					"table#favoriteStoreList")
																			.css(
																					"display",
																					"none");

																	setnavi();
																})
											})

							//1:1 문의 내역 버튼 누르면 테이블 나오게 이벤트
							$("#consultListBtn")
									.on(
											"click",
											function() {

												$
														.ajax(
																{
																	url : "/selectConsultListBymypage.consult",
																	type : "post",
																	dataType : "json"
																})
														.done(
																function(resp) {
																	$(
																			"#consultListToPrint")
																			.html(
																					"");
																	$(
																			".navigator_list")
																			.html(
																					"");
																	let myConsultList = JSON
																			.parse(resp.myConsultList);
																	let myConsultNavi = JSON
																			.parse(resp.myConsultNavi);
																	$(
																			"#consultListToPrint")
																			.append(
																					myConsultList);
																	$(
																			".navigator_list")
																			.append(
																					myConsultNavi);

																	$(
																			"#consultList")
																			.css(
																					"display",
																					"table");
																	$("table")
																			.not(
																					"table#consultList")
																			.css(
																					"display",
																					"none");

																	setnavi();
																})
											})
						})

		//네비게이터에 AJAX 전송 링크 부여
		function setnavi() {
			$(".navibtn")
					.on(
							"click",
							function() {

								if ($(this).attr("searchto") == "writeFullReviewList") {
									let location = $(this).attr("location");
									$
											.ajax(
													{
														url : "/selectBymypage.fullreview",
														type : "post",
														data : {
															cpage : location
														},
														dataType : "json"
													})
											.done(
													function(resp) {
														$("#writeListToPrint")
																.html("");
														$(".navigator_list")
																.html("");
														let writeFullReviewList = JSON
																.parse(resp.writeFullReviewList);
														let writeFullReviewNavi = JSON
																.parse(resp.writeFullReviewNavi);
														$("#writeListToPrint")
																.append(
																		writeFullReviewList);
														$(".navigator_list")
																.append(
																		writeFullReviewNavi);

														$("#writeList").css(
																"display",
																"table");
														$("table")
																.not(
																		"table#writeList")
																.css("display",
																		"none");

														setnavi();
													})

								} else if ($(this).attr("searchto") == "writeMyCommentList") {
									let location = $(this).attr("location");
									$
											.ajax(
													{
														url : "/selectBymypage.commentReview",
														type : "post",
														data : {
															cpage : location
														},
														dataType : "json"
													})
											.done(
													function(resp) {
														$("#replyListToPrint")
																.html("");
														$(".navigator_list")
																.html("");
														let writeMyCommentList = JSON
																.parse(resp.writeMyCommentList);
														let writeMyCommentNavi = JSON
																.parse(resp.writeMyCommentNavi);
														$("#replyListToPrint")
																.append(
																		writeMyCommentList);
														$(".navigator_list")
																.append(
																		writeMyCommentNavi);

														$("#replyList").css(
																"display",
																"table");
														$("table")
																.not(
																		"table#replyList")
																.css("display",
																		"none");

														setnavi();
													})

								} else if ($(this).attr("searchto") == "writeMyFullReviewScrapList") {
									let location = $(this).attr("location");
									$
											.ajax(
													{
														url : "/selectScrapListBymypage.fullreview",
														type : "post",
														data : {
															cpage : location
														},
														dataType : "json"
													})
											.done(
													function(resp) {
														$("#reviewMarkToPrint")
																.html("");
														$(".navigator_list")
																.html("");
														let myFullReviewScrapList = JSON
																.parse(resp.myFullReviewScrapList);
														let myFullReviewScrapNavi = JSON
																.parse(resp.myFullReviewScrapNavi);
														$("#reviewMarkToPrint")
																.append(
																		myFullReviewScrapList);
														$(".navigator_list")
																.append(
																		myFullReviewScrapNavi);

														$("#reviewMark").css(
																"display",
																"table");
														$("table")
																.not(
																		"table#reviewMark")
																.css("display",
																		"none");

														setnavi();
													})

								} else if ($(this).attr("searchto") == "FavoriteStoreList") {
									let location = $(this).attr("location");
									$
											.ajax(
													{
														url : "/selectFavoriteStore.store",
														type : "post",
														data : {
															cpage : location
														},
														dataType : "json"
													})
											.done(
													function(resp) {
														$(
																"#favoriteStoreListToPrint")
																.html("");
														$(".navigator_list")
																.html("");
														let FavoriteStoreList = JSON
																.parse(resp.FavoriteStoreList);
														let FavoriteStoreNavi = JSON
																.parse(resp.FavoriteStoreNavi);
														$(
																"#favoriteStoreListToPrint")
																.append(
																		FavoriteStoreList);
														$(".navigator_list")
																.append(
																		FavoriteStoreNavi);
														$("#favoriteStoreList")
																.css("display",
																		"table");
														$("table")
																.not(
																		"table#favoriteStoreList")
																.css("display",
																		"none");

														setnavi();
													})

								} else if ($(this).attr("searchto") == "myConsultList") {
									let location = $(this).attr("location");
									$
											.ajax(
													{
														url : "/selectConsultListBymypage.consult",
														type : "post",
														dataType : "json"
													})
											.done(
													function(resp) {
														$("#consultListToPrint")
																.html("");
														$(".navigator_list")
																.html("");
														let myConsultList = JSON
																.parse(resp.myConsultList);
														let myConsultNavi = JSON
																.parse(resp.myConsultNavi);
														$("#consultListToPrint")
																.append(
																		myConsultList);
														$(".navigator_list")
																.append(
																		myConsultNavi);

														$("#consultList").css(
																"display",
																"table");
														$("table")
																.not(
																		"table#consultList")
																.css("display",
																		"none");

														setnavi();
													})
								}
							})
		}

		$("#updateForm").on(
				"submit",
				function() { //수정 regex

					let regexPw = /^[A-Za-z0-9]{7,13}$/;
					let regexPhone = /^010[0-9]{8}$/;
					let regexEmail = /.+@.+\..+/;

					let pw1 = $("#pw1");
					let pw2 = $("#pw2");
					let phone = $("#phone");
					let email = $("#email");

					if (pw1.value != "" && pw2.value != "" && phone.value != ""
							&& email.value != "") {

						let result1 = regexPw.test(pw2.value);
						let result2 = regexPhone.test(phone.value);
						let result3 = regexEmail.test(email.value);

						if (pw1.value != pw2.value) {
							alert("패스워드를 다시 확인해주세요.");
							return false;
						} else if (!result1) {
							alert("패스워드 형식이 잘못됐습니다.");
							return false;
						} else if (!result2) {
							alert("핸드폰 번호 형식이 잘못됐습니다.")
							return false;
						} else if (!result3) {
							alert("이메일 형식이 잘못됐습니다.")
							return false;
						} else {
							alert("정보를 다 입력해주세요.")
							return false;
						}
					}
				})

		$("#pw2").on("keyup", function() { //패스워드 일치여부
			let inputPw1 = $("#pw1");
			let inputPw2 = $("#pw2");

			if (inputPw1.val() == inputPw2.val()) {
				$("#pwConfirm").html("패스워드가 일치합니다").css({
					"color" : "blue",
					"font-size" : "13px"
				});
			} else {
				$("#pwConfirm").html("패스워드가 일치하지 않습니다").css({
					"color" : "red",
					"font-size" : "13px"
				});
			}
		})
	</script>
</body>
</html>