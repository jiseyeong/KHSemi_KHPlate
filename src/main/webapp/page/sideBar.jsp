<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	rel="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<style>

.sideBar {
	padding: 0px;
}

ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
	width: 150px;
	text-align: center;
	width: 100%;
}

li {
	height: 50px;
	width: 100%;
	font-size: 14px;
	text-align: center;
	margin: 0px;
	padding: 0px;
	line-height: 50px;
	cursor: pointer;
}

li:not(.firstLi):hover {
	color: rgb(237, 28, 22);
}

.ulTag {
	margin-bottom: 50px;
}

.firstLi {
	border-bottom: 1px solid silver;
	font-weight: bold;
}

</style>


</head>
<body>
	<div class="col-12 col-lg-2 sideBar">
		<ul class="ulTag">
			<li class="firstLi">Menu</li>
			<li>한식</li>
			<li>중식</li>
			<li>일식</li>
			<li>양식</li>
			<li>음료/디저트</li>
		</ul>
		<ul class="ulTag">
			<li class="firstLi">Community</li>
			<li>잡담 게시판</li>
			<li>리뷰 게시판</li>
		</ul>
		<ul class="ulTag">
			<li class="firstLi">고객센터</li>
			<li>1:1 문의</li>
		</ul>
	</div>
</body>
</html>