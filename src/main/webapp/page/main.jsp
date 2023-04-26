<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/octicons/3.3.0/octicons.min.css"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<style>
/* 헤더 및 sideBar 부분 스타일 - 건들지 말것 */
	* {
	box-sizing: border-box;
	padding: 0px;
	}
	.row{
		float:none;
		margin:0 auto;
	}
	.col{
		float:none;
		margin:0 auto;
	}
	.container-fluid{
		max-width:1920px;
		height:1000px;
	}
	.row{
		margin:0px;
	}
	.header{
	width:100%;
	}
	.body {
	max-width: 1400px;
	height:100%;
	margin-top: 20px;
	margin:0 auto;
	}
/* 하단부터 메인부분 스타일 작성 요망 */
	.contents {
	padding: 0px;
	padding-left: 10px;
	}

	.contents1 {

	margin: 0px;
	}

	.contents2 {

	margin: 0px;
	}

	.contents1>div {
	height: 100%;
	}

	.contents2>div {
	height: 100%;
	}

	div{
		display:block;
	}
</style>
</head>
<body>
	<div class="container-fluid g-0">
	<div class="row header" style="float:none; margin:0 auto;">
	<!-- 헤더부분 건들지 말것 -->
		<jsp:include page="header.jsp" flush="false"></jsp:include>

	</div>


	<!-- sideBar부분 건들지 말것 -->
	<div class="row body" style="float:none; margin:0 auto;">
	
		<!-- Main 수정 여기까지, 하단 건들지 말것. -->
		
	</div>
</div>
</body>
</html>