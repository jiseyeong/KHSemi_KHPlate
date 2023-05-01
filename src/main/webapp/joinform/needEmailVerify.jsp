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
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">

<!-- Title Page-->
<title>Re</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>

<!-- Icons font CSS-->
<link href="vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link href="vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="vendor/datepicker/daterangepicker.css" rel="stylesheet"
	media="all">

<!-- Main CSS-->
<link href="css/main.css" rel="stylesheet" media="all">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<style>

/* ==========================================================================
   #FONT
   ========================================================================== */
.font-robo {
	font-family: "Roboto", "Arial", "Helvetica Neue", sans-serif;
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

.row-space {
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-moz-box-pack: justify;
	-ms-flex-pack: justify;
	justify-content: space-between;
}

.col-2 {
	width: -webkit-calc(( 100% - 60px)/2);
	width: -moz-calc(( 100% - 60px)/2);
	width: calc(( 100% - 60px)/2);
}

@media ( max-width : 767px) {
	.col-2 {
		width: 100%;
	}
}

/* ==========================================================================
   #BOX-SIZING
   ========================================================================== */
/**
 * More sensible default box-sizing:
 * css-tricks.com/inheriting-box-sizing-probably-slightly-better-best-practice
 */
html {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

* {
	padding: 0;
	margin: 0;
}

*, *:before, *:after {
	-webkit-box-sizing: inherit;
	-moz-box-sizing: inherit;
	box-sizing: inherit;
}

/* ==========================================================================
   #RESET
   ========================================================================== */
/**
 * A very simple reset that sits on top of Normalize.css.
 */
body, h1, h2, h3, h4, h5, h6, blockquote, p, pre, dl, dd, ol, ul, figure,
	hr, fieldset, legend {
	margin: 0;
	padding: 0;
}

/**
 * Remove trailing margins from nested lists.
 */
li>ol, li>ul {
	margin-bottom: 0;
}

/**
 * Remove default table spacing.
 */
table {
	border-collapse: collapse;
	border-spacing: 0;
}

/**
 * 1. Reset Chrome and Firefox behaviour which sets a `min-width: min-content;`
 *    on fieldsets.
 */
fieldset {
	min-width: 0;
	/* [1] */
	border: 0;
}

button {
	outline: none;
	background: none;
	border: none;
}

/* ==========================================================================
   #PAGE WRAPPER
   ========================================================================== */
.page-wrapper {
	min-height: 100vh;
}

body {
	font-family: "Roboto", "Arial", "Helvetica Neue", sans-serif;
	font-weight: 400;
	font-size: 14px;
}

h1, h2, h3, h4, h5, h6 {
	font-weight: 400;
}

h1 {
	font-size: 36px;
}

h2 {
	font-size: 30px;
}

h3 {
	font-size: 24px;
}

h4 {
	font-size: 18px;
}

h5 {
	font-size: 15px;
}

h6 {
	font-size: 13px;
}

/* ==========================================================================
   #BACKGROUND
   ========================================================================== */
.bg-red {
	background: #ED1C16;
}

/* ==========================================================================
   #SPACING
   ========================================================================== */
.p-t-100 {
	padding-top: 100px;
}

.p-t-180 {
	padding-top: 180px;
}

.p-t-20 {
	padding-top: 20px;
}

.p-t-30 {
	padding-top: 30px;
}

.p-b-100 {
	padding-bottom: 100px;
}

/* ==========================================================================
   #WRAPPER
   ========================================================================== */
.wrapper {
	margin: 0 auto;
}

.wrapper--w960 {
	max-width: 960px;
}

.wrapper--w680 {
	max-width: 680px;
}

/* ==========================================================================
   #TITLE
   ========================================================================== */
.title {
	text-transform: uppercase;
	font-weight: 700;
	margin-bottom: 35px;
}

/* ==========================================================================
   #CARD
   ========================================================================== */
.card {
	overflow: hidden;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	background: #fff;
}

.card-2 {
	-webkit-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
	box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	width: 100%;
	display: table;
}

.card-2 .card-heading {
	background:
		url("https://cdn.crowdpic.net/detail-thumb/thumb_d_D6F554AC3A121A60B724FA4A303AA273.jpg")
		top left/cover no-repeat;
	width: 29%;
	display: table-cell;
}

.card-2 .card-body {
	display: table-cell;
	padding: 70px 80px;
	padding-bottom: 88px;
}

@media ( max-width : 767px) {
	.card-2 {
		display: block;
	}
	.card-2 .card-heading {
		width: 100%;
		display: block;
		padding-top: 300px;
		background-position: left center;
	}
	g
  .card-2 .card-body {
		display: block;
		padding: 60px 50px;
	}
}
</style>
<body>
<body>
	<div class="page-wrapper bg-red p-t-180 p-b-100 font-robo">
		<div class="wrapper wrapper--w960">
			<div class="card card-2">
				<div class="card-heading"></div>
				<div class="card-body">
					<h1 class="title">${userid}님 환영합니다!!</h1>
					<h3 class="title">${email}</h3>
					<h4 class="title">위 이메일로 인증 메일을 전송하였습니다</h4>
					<h4 class="title">이메일 인증 후 로그인이 가능합니다.</h4>
					
					<h3 class="title"><a href="/page/main.jsp">메인 페이지로 이동</a></h3>
				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<!-- Vendor JS-->
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/datepicker/moment.min.js"></script>
	<script src="vendor/datepicker/daterangepicker.js"></script>

	<!-- Main JS-->
	<script src="js/global.js"></script>

</body>
</html>



