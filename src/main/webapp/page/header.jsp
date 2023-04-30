<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        rel="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>

    <style>
    
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
	.nanum-gothic{ font-family: 'Nanum Gothic', sans-serif;}
	
	
        * {
            box-sizing: border-box;
        }
		
        .header {
           max-width:100%;
           width: 100%;
           background-color: #ED1C16;
           box-shadow:1px 1px 5px 1px silver;
           padding-top:10px;
           padding-bottom:10px;
            
        }
        .logo{
        	text-align:center;
        	padding-top:5px;
        }
		.logoimage{
			height:90%;
			width:25%;
		}
        #searchBox {
            height: 40px;
            width: 70%;
            border-radius: 10px;
            border: 1px solid #f2f2f2;
            position:relative;
            top:5px;
            left:30px;
        }

        #searchBtn {
            position: relative;
            top:18px;
            height: 40px;
            width: 40px;
            left:15px;
            background-color: #f2f2f2;
            border: 1px solid #f2f2f2;
            border-radius: 3px;
            cursor: pointer;
        }
        .form {
            width: 100%;
            padding-left: 10px;
        }

        #mypageBtn {
            display: inline-block;
            width: 50px;
            height: 50px;
            font-family: "Consolas", "Menlo", "Ubuntu Mono", monospace;
            cursor: pointer;
        }
        
        #searchBox{
           margin-top:3px;
        }
        .btnBox{
        	width:100%;
			line-height:76px;
			text-align:center;
        }
        #searchCheck{
        	font-size:12px;
        	position:relative;
        	top:3px;
        	width:70px;
        	height:25px;
        	left:20px;
        	text-align:center;
        	border-radius:4px;
        	background-color:rgb(241, 241, 241);
        }
      .btnBox>a{
		text-decoration:none;
		font-size:13px;
		margin-right:10px;
		color:white;
		font-weight:600;
		}
	  .btnBox>a:hover{
		opacity:80%;
		}
</style>


</head>

<body>
    <div class="row header m-0" style="margin-bottom:70px;">
        <div class="col-12 col-lg-3 themed-grid-col logo">
         	 <img src="logowhite.png" class="logoimage">
        </div>
        <div class="col-12 col-lg-6  d-flex search">
           <form action="/searchToMain.store" method="get" class="form">
            <select size="1" id="searchCheck" class="nanum-gothic" name="searchSelect"> 
        		<option>맛집</option>
        		<option>블로그</option>
    		</select>
            	<input type="text" name="searchedBy" value="mainSearch" style="display:none;">
                <input type="search" id="searchBox" name="search">
                <button type="submit" id="searchBtn" style="color:white;" class="fa-regular fa-magnifying-glass"> 
                </button>
            </form>
        </div>
        <div class="col-12 col-lg-3 themed-grid-col d-flex rightMenu">
            <div class="btnBox">
         <a href="#null" class="nanum-gothic" >로그인 </a>
          <a href="#null" class="nanum-gothic" >｜</a>
         <a href="#null" class="nanum-gothic" >회원가입</a>
         <a href="#null" class="nanum-gothic" >｜</a>
		 <a href="#null" class="nanum-gothic" >마이페이지</a>
        </div>
        </div>
    </div>
</body>

</html>