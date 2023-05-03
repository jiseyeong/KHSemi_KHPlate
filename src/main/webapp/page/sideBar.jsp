<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SideBar</title>
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

@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

.nanum-gothic{ font-family: 'Nanum Gothic', sans-serif;}

ul {
   list-style: none;
   margin: 0px;
   padding: 0px;
   width: 200px;
   width: 100%;
}

li {
   height: 50px;
   width: 100%;
   font-size: 15px;
   text-align: center;
   margin: 0px;
   padding: 0px;
   line-height: 50px;
   cursor: pointer;
   
/*     a태그에 의한 색 변경 추가 */
   color:black;
}

li:not(.firstLi):hover {
   color: #Ed1c16;
}

.ulTag {
   	margin-bottom: 50px;
   	padding-left:70px;
	padding-right:70px;
	font-weight:600;
}

.firstLi {
   border-bottom: 1px solid silver;
   font-weight: bolder;
   font-size:18px;
}

/* a태그의 밑줄 속성 제거 */
a:link {text-decoration: none;}

</style>


</head>
<body>
   <div class="col-12 col-lg-2 themed-grid-col sideBar">
      <ul class="nanum-gothic ulTag">
         <li class="firstLi">Menu</li>
         
<!--   카테고리 접근을 위한 a태그 추가 -->
         <a href="/searchStoreBySearchBox.store?searchedBy=mainSearch&food_category=한식&approachBy=sidebar"><li>한식</li></a>
         <a href="/searchStoreBySearchBox.store?searchedBy=mainSearch&food_category=양식&approachBy=sidebar"><li>양식</li></a>
         <a href="/searchStoreBySearchBox.store?searchedBy=mainSearch&food_category=중식&approachBy=sidebar"><li>중식</li></a>
         <a href="/searchStoreBySearchBox.store?searchedBy=mainSearch&food_category=일식&approachBy=sidebar"><li>일식</li></a>
         <a href="/searchStoreBySearchBox.store?searchedBy=mainSearch&food_category=아시안&approachBy=sidebar"><li>아시안</li></a>
         <a href="/searchStoreBySearchBox.store?searchedBy=mainSearch&food_category=패스트푸드&approachBy=sidebar"><li>패스트푸드</li></a>
         <a href="/searchStoreBySearchBox.store?searchedBy=mainSearch&food_category=음료/디저트&approachBy=sidebar"><li>음료/디저트</li></a>
         <a href="/searchStoreBySearchBox.store?searchedBy=mainSearch&food_category=기타&approachBy=sidebar"><li>기타</li></a>
      </ul>
      <ul class="nanum-gothic ulTag">
         <li class="firstLi">Community</li>
         <li>잡담 게시판</li>
         <a href="/select.fullreview"><li>리뷰 게시판</li></a>
      </ul>
      <ul class="nanum-gothic ulTag">
         <li class="firstLi">고객센터</li>
         <li>1:1 문의</li>
      </ul>
   </div>
</body>
</html>