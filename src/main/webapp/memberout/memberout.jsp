<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원탈퇴</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
	.nanum-gothic{ font-family: 'Nanum Gothic', sans-serif;}


	*{box-sizing:border-box;}
	body{background-color:#ED1C16;}
	.container{
		width:500px;
		height:600px;
        margin:auto;
        margin-top:100px;
        background-color:white;
        border-radius:10px;
	}
    .lead1{
        height:2%;
        background-color:#4dae3c;
        border-top-left-radius:10px;
        border-top-right-radius:10px;
    }
    .lead2{
        height:2%;
        background-color:#4dae3c;
        border-bottom-left-radius:10px;
        border-bottom-right-radius:10px;
    }
    .contents{
        height:72%;
        text-align:center;
    }
    .contents>div{
        margin-top:30%;
        font-size:18px;
        font-weight:bold;
    }
    input{
        margin-top:20px;
        width:350px;
        height:40px;
        border:none;
        background-color: rgb(245, 245, 245);
        padding-left:10px;
    }
    #inputPw{
    	margin-bottom:40px;
    }
    #memberout{
    	background-color:#4dae3c;
    	border:none;
    	border-radius:15px;
    	width:350px;
    	height:40px;
    	color:white;
    }
    #cancel{
    	background-color:#4dae3c;
    	border:none;
    	border-radius:15px;
    	width:350px;
    	height:40px;
    	color:white;
    	margin-top:15px;
    }
    button{
    	cursor:pointer;
    }
    button:hover{
    	opacity:80%;
    }
	</style>
	<body>
	<div class="container">
		<div class="lead1"></div>
        <div class="nanum-gothic contents">
        <div>정말 탈퇴 하실건가요?</div><br>
        <form action="/memberout.member" method="get">
        <input type="text" value="${sessionScope.loginID}" id="inputId" name="userId" placeholder="ID"><br>
        <input type="password" id="inputPw" name="userPw" placeholder="PW"><br>
        <button id="memberout">탈퇴하기</button><br>
        <button id="cancel" onclick="history.back()" type="button">취소하기</button>
        </form>
        </div>
        <div class="lead2"></div>
	</div>
</body>
</html>