<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Admin Home</title>
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
	height: 60%;
}

.body1>div {
	float: left;
	height: 100%;
}

.profile {
	width: 35%;
}

.inpomation {
	width: 65%;
	margin-top: 1%;
}

.inpomation>.inpocontents1 {
	float: left;
	height: 100%;
}

.inpocontents1 {
	width: 10%;
	line-height: 25px;
}

#bi-chat-left {
	position: absolute;
	margin-left: 30px;
	margin-top: 52px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#bi-card-list {
	position: absolute;
	margin-left: 30px;
	margin-top: 110px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#bi-card-checklist {
	position: absolute;
	margin-left: 30px;
	margin-top: 170px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.inpocontents2 {
	width: 90%;
	padding-top: 45px;
	padding-left: 100px;
	position: relative;
	margin-bottom: 30px;
}

.inpocontents2>input {
	margin-bottom: 28px;
	width: 80%;
	height: 35px;
	background-color: #57b846;
	border: #57b846;
	border-radius: 3px;
	cursor: pointer;
	color: white;
	font-size: 16px;
	box-shadow: 1px 1px 5px 1px rgb(231, 231, 231);
	background-color: #57b846;
}

.inpocontents2>input:hover {
	background: #4dae3c;
}

.profileImage {
	height: 65%;
	margin-top: 35px;
	margin-left: 120px;
}

.proImage {
	width: 250px;
	height: 250px;
	border-radius: 200px;
	border: 1px solid black;
}

#bi-person-fill-gear {
	position: absolute;
	margin-left: 52px;
	margin-top: 43px;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>
	<div class="mypage">
		<div class="myPageHeader">������������</div>
		<div class="body1">
			<div class="profile">
				<div class="profileImage">
					<div class="proImage">
						<svg xmlns="http://www.w3.org/2000/svg" width="150" height="150"
							fill="currentColor" id="bi-person-fill-gear" viewBox="0 0 16 16">
  <path
								d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Zm9.886-3.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z" />
</svg>
					</div>
				</div>
			</div>
			<div class="inpomation">
				<div class="inpocontents1">

					<div id="consult">
						<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
							fill="currentColor" id="bi-chat-left" viewBox="0 0 16 16">
  <path
								d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
</svg>
					</div>
					<div id="faq">
						<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
							fill="currentColor" id="bi-card-list" viewBox="0 0 16 16">
  <path
								d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
  <path
								d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
</svg>
					</div>
					<div id="letter">
						<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
							fill="currentColor" id="bi-card-checklist" viewBox="0 0 16 16">
  <path
								d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
  <path
								d="M7 5.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0zM7 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z" />
</svg>
					</div>

				</div>

				<div class="inpocontents2">
					<input type="button" value="1:1 ����" id="consultBtn"
						class="inputcss"><br> <input type="button"
						value="FAQ" id="faqBtn" class="inputcss"><br> <input
						type="button" value="�̿���" id="letterBtn" class="inputcss"><br>
				</div>

			</div>
		</div>
	</div>
	<script>
	
	</script>
</body>
</html>