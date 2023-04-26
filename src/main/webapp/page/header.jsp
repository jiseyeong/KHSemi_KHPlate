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
        * {
            box-sizing: border-box;
        }

        .header {
        
        	width: 100%;
            height:130px; 

   			background-color: #f2f2f2;
            
        }
        #searchBox {
            height: 40px;
            width: 90%;
            border-radius: 10px;
            border: 1px solid #ED1C16;
        }

        #searchBtn {
            position: relative;
            top: 12px;
            height: 40px;
            width: 40px;
            right: 45px;
            background-color: #ED1C16;
            border: 1px solid #ED1C16;
            border-radius: 10px;
            cursor: pointer;
        }

        .form {
            width: 100%;
            margin-top: 3%;
            padding-left: 10px;
        }


        .btnBox {
            margin-top: 8.5%;
        }
        .btnBox>button {
            width: 80px;
            height: 40px;
            font-size: 13px;
            background-color: #ED1C16;
            border: none;
            border-radius: 20px;
            color: white;

        }

        #mypageBtn {
            display: inline-block;
            width: 50px;
            height: 50px;
            font-family: "Consolas", "Menlo", "Ubuntu Mono", monospace;
            filter: invert(22%) sepia(94%) saturate(5663%) hue-rotate(355deg) brightness(96%) contrast(91%);
            cursor: pointer;
        }
    </style>


</head>

<body>
    <div class="row header g-0">
        <div class="col-12 col-xl-3 themed-grid-col logo">
          
        </div>


        <div class="col-12 col-xl-6  d-flex search">
            <form action="/search.store" method="get" class="form">
                <input type="search" id="searchBox">
                <button type="submit" id="searchBtn" style="color:white;" class="fa-regular fa-magnifying-glass">
                </button>
            </form>
        </div>


        <div class="col-12 col-xl-3 themed-grid-col d-flex justify-content-evenly rightMenu">
            <div class="btnBox">
            <button id="loginBtn" name="loginBtn">로그인</button>
            <button id="signupBtn" name="signupBtn">회원가입</button>
            <svg xmlns="http://www.w3.org/2000/svg" id="mypageBtn" name="mypageBtn" viewBox="0 0 16 16">
                <path
                    d="M8 16A8 8 0 1 1 8 0a8 8 0 0 1 0 16Zm.847-8.145a2.502 2.502 0 1 0-1.694 0C5.471 8.261 4 9.775 4 11c0 .395.145.995 1 .995h6c.855 0 1-.6 1-.995 0-1.224-1.47-2.74-3.153-3.145Z">
                </path>
            </svg>
        </div>
        </div>
    </div>
</body>

</html>