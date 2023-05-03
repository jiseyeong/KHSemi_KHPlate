<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 shrink-to-fit=no">


<!-- Title Page-->
<title>Member Out</title>

<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/typicons/2.1.2/typicons.min.css">
<!-- Icons font CSS-->
<link href="vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link href="vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Vendor CSS-->
<link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
<!-- Main CSS-->
<link href="css/main.css" rel="stylesheet" media="all">
</head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;

/* ==========================================================================
   #FONT
   ========================================================================== */
.font-robo {
	font-family: 'Nanum Gothic', sans-serif;
}

/* ==========================================================================
   #GRID
   ========================================================================== */
.row {
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
}

<
style
>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;

html {
	font-family: 'Nanum Gothic', sans-serif;
	background-color: #ED1C16;
	padding: 0;
	margin: 0;
}

.container {
	font-family: 'Nanum Gothic', sans-serif;
	margin: 0;
	top: 50px;
	left: 50%;
	position: absolute;
	text-align: center;
	transform: translateX(-50%);
	background-color: white;
	border-radius: 9px;
	border-top: 10px solid #57b846;
	border-bottom: 10px solid #57b846;
	width: 400px;
	height: 550px;
}

.btn {
	font-family: 'Nanum Gothic', sans-serif;
	background: #57b846;
	color: #dfdeee;
	border: 0;
	border-radius: 100px;
	width: 340px;
	height: 49px;
	font-size: 16px;
	position: absolute;
	left: 8%;
	transition: 0.3s;
	cursor: pointer;
}

h1 {
	font-family: 'Nanum Gothic', sans-serif;
	color: #57b846;
	margin-top: 30px;
}

h2 {
	font-family: 'Nanum Gothic', sans-serif;
	color: #57b846;
	margin-top: 30px;
}

#close {
	position: absolute;
	font-size: 28px;
	cursor: pointer;
	margin-left: 175px;
	margin-top: 80px;
}

#member {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 25px;
}

#memberimg img {
	width: 40%;
	height: 40%;
}

/* 배경 색상 추가 */
body {
	margin:0;
	padding:0;
	background-color: #ED1C16;
}

</style>

<body id="particles-js">
	<div class="animated bounceInDown">
		<div class="container">

			<div id="memberimg">
				<img src="/login/member2.png">
			</div>
			<c:choose>
				<c:when test="${userid!=null}">
					<h2 id="member">귀하의 아이디는</h2> 
					<h1>${userid}</h1>
					<h2>입니다</h2>
				</c:when>
				<c:otherwise>
					<h2>&nbsp</h2>
					<h2 id=nomember>존재하는 아이디가 없습니다</h2>
					<h2>&nbsp</h2>
				</c:otherwise>
			</c:choose>
			<div id=close>닫기</div>
		</div>
	</div>

	<script>
		$("#close").on("click", function() {
			window.close();
			//팝업은 child window, 팝업을 띄운 창은 parent window 
			// 팝업에서 parent window를 호출하기 위해선 opener
			opener.document.getElementById("id").value = "";
		})
	</script>
</body>

</html>



<!-- 아래쪽 디자인은 주석 처리하였습니다. -->

<!-- @media ( max-width : 767px) { .card-2 { display: block; } .card-2 -->
<!-- .card-heading { width: 100%; display: block; padding-top: 300px; -->
<!-- background-position: left center; } .card-2 .card-body { display: block; -->
<!-- padding: 60px 50px; } } -->

<!-- </style> -->

<!-- <body> -->
<!-- 	<div class="page-wrapper bg-red p-t-180 p-b-100 font-robo"> -->
<!-- 		<div class="wrapper wrapper--w960"> -->
<!-- 			<div class="card card-2"> -->
<!-- 				<div class="card-body"> -->

<%-- 					<c:choose> --%>

<%-- 						<c:when test="${userid!=null}"> --%>
<!-- 							<table border="1"> -->
<!-- 								<tr> -->
<!-- 									<th>중복검사 결과</th> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<%-- 									<td>귀하의 아이디는 ${userid} 입니다</td> --%>
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td><button id="close">닫기</button></td> -->
<!-- 									<script>
 										$("#close").on("click",function() {
											window.close();
 											//팝업은 child window, 팝업을 띄운 창은 parent window 
 											// 팝업에서 parent window를 호출하기 위해선 opener
 											opener.document
 													.getElementById("id").value = "";
 										})
										</script> -->
<!-- 								</tr> -->
<!-- 							</table> -->
<%-- 						</c:when> --%>

<%-- 						<c:otherwise> --%>
<!-- 							<table border="1"> -->
<!-- 								<tr> -->
<!-- 									<th colspan=2>검사 결과</th> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td colspan=2>존재하는 아이디가 없습니다</td> -->
<!-- 								</tr> -->
<!-- 							</table> -->
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- Jquery JS-->
<!-- 	<script src="vendor/jquery/jquery.min.js"></script> -->
<!-- Vendor JS -->
<!-- 	<script src="vendor/select2/select2.min.js"></script> -->
<!-- Main JS -->
<!--  	<script src="js/global.js"></script> -->


