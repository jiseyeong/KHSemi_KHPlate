<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
* {
	box-sizing: border-box;
}

.container {
	float: left;
	border: 1px solid black;
	margin: auto;
	width: 1250px;
	height: 1000px;
	padding-top: 50px;
	padding-bottom: 50px;
}

.fieldset {
	font-size: 25px;
	margin: auto;
	border: 1px solid black;
	width: 1000px;
	height: 350px;
	border-radius: 25px;
}

.profile {
	float: left;
	position: relative;
	width: 850px;
	left: 50px;
	top: 50px;
}

.profileIMG {
	float: left;
	border: 1px solid black;
	border-radius: 100px;
	width: 200px;
	height: 200px;
}

.myInfo {
	float: right;
	border: 1px solid black;
	width: 600px;
	height: 200px;
}

.nickname {
	border: 1px solid black;
	float: left;
	width: 300px;
	height: 50px;
}

.info {
	position: relative;
	border: 1px solid black;
	float: left;
	width: 400px;
	height: 100px;
	top: 50px;
}

.setting {
	position: relative;
	border: 1px solid black;
	float: left;
	width: 50px;
	height: 50px;
	bottom: 50px;
	left: 150px;
}

.community {
	position: relative;
	margin: auto;
	border: 1px solid black;
	width: 1000px;
	height: 300px;
	top: 50px;
	border-radius: 25px;
}

.communityName {
	font-size: 25px;
}

.communityMenu {
	margin: auto;
	position: relative;
	height: 100px;
	top: 80px;
}

.article {
	float: left;
	border: 1px solid black;
	height: 100px;
	width: 300px;
	position: relative;
	left: 24px;
}

.comments {
	float: left;
	border: 1px solid black;
	height: 100px;
	width: 300px;
	position: relative;
	left: 48px;
}

.scrap {
	float: left;
	border: 1px solid black;
	height: 100px;
	width: 300px;
	position: relative;
	left: 72px;
}
</style>
</head>



<body>
	<!-- container -->
	<div class="container">
		<!-- my Page 정보 -->
		<fieldset class="fieldset">
			<legend>MY PAGE</legend>
			<div class="profile">
				<div class="profileIMG"></div>
				<div class="myInfo">
					<div class="nickname"></div>
					<div class="info"></div>
					<div class="setting"></div>
				</div>
			</div>
		</fieldset>
		<!-- Community 탭 -->
		<div class="community">
			<div class="communityName">COMMUNITY</div>
			<div class="communityMenu">
				<div class="article"></div>
				<div class="comments"></div>
				<div class="scrap"></div>
			</div>
		</div>
	</div>


</body>
</html>