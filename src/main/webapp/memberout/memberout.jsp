<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원탈퇴</title>
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
    }
	</style>
	<body>
	<div class="container">
		<div class="lead1"></div>
        <div class="nanum-gothic contents">
        <div>정말 탈퇴 하실건가요?</div><br>
        <form action="/memberout.member" method="get">
        <input type="text" value="" id="inputId" name="userId" placeholder="ID"><br>
        <input type="password" id="inputPw" name="userPw" placeholder="PW">
        <button>탈퇴하기</button>
        </form>
        </div>
        <div class="lead2"></div>
	</div>
</body>
</html>