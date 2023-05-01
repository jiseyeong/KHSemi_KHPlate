<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Mypage</title>
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
* {
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

button {
	border-radius: 15px;
	border: 1px solid #4dae3c;
	background-color: white;
	color: #4dae3c;
	font-size: 12px;
	height: 30px;
}

button:hover {
	color: white;
	background-color: #4dae3c;
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
}

.inpomation>div {
	float: left;
	height: 100%;
}

.inpocontents1 {
	width: 20%;
}

.inpocontents1>ul {
	list-style: none;
	margin-top: 50px;
	padding: 0px;
	padding-left: 40px;
}

.inpocontents1>ul>li {
	margin-bottom: 0px;
	font-size: 14px;
	line-height: 20px;
	width: 100px;
}

.inpocontents2 {
	width: 80%;
	padding-top: 45px;
	padding-left: 200px;
	position: relative;
	margin-bottom: 30px;
}

.inpocontents2>input {
	margin-bottom: 22px;
	width: 100%;
}

.inputPw2 {
	margin-top: 5px;
}

.inputPw2>input {
	width: 54%
}

#pwConfirm {
	margin-left: 10px;
	display: inline-block;
}

.inpocontents2>button {
	width: 75px;
	position: relative;
	left: 90px;
}

.profileImage {
	height: 65%;
	margin-top: 50px;
	margin-left: 50px;
}

.profileImage>button {
	margin-top: 20px;
	font-size: 12px;
	width: 75px;
	text-align: center;
	margin-left: 90px;
}

.proImage {
	width: 250px;
	height: 250px;
	border-radius: 200px;
	border: 1px solid black;
}

.profileName {
	height: 35%;
	text-align: center;
}

.profileName>button {
	margin-top: 50px;
	font-size: 12px;
	width: 75px;
}

button:hover {
	opacity: 70%;
}

#postSearch {
	position: relative;
	left: 15px;
	top: 0px;
	display: none;
}

#modiComBtn {
	display: none;
}

.body2 {
	height: 40%;
}

.body2Navi {
	height: 7%;
}

.body2Navi>a {
	height: 100%;
	background-color: white;
	border: 1px solid black;
	color: black;
	position: relative;
	top: 1px;
	font-size: 12px;
	height: 30px;
	display: inline-block;
	width: 80px;
	text-align: center;
	background-color: rgb(240, 240, 240);
	line-height: 30px;
}

.body2Navi>a:first-of-type {
	border-bottom: none;
}

.body2Contents {
	width: 100%;
	height: 530px;
	border: 1px solid black;
	box-shadow: 1px 1px 5px 1px silver;
	background-color: rgb(240, 240, 240);
	border: 1px solid black;
	padding: 30px;
}

.body2Contents>table {
	width: 100%;
	text-align: center;
	font-size: 14px;
	magin: 0 auto;
}

#replyList {
	display: none;
}

#reviewMark {
	display: none;
}

#consultList {
	display: none;
}
</style>
</head>
<body>
	<div class="mypage">
		<div class="myPageHeader">마이페이지</div>
		<div class="body1">
			<div class="profile">
				<div class="profileImage">
					<div class="proImage"></div>

					<button>변경하기</button>
				</div>
			</div>
			<div class="inpomation">
				<div class="inpocontents1">
					<ul>
						<li>아이디</li>
						<li>비밀번호</li>
						<li>비밀번호 확인</li>
						<li>이름</li>
						<li>닉네임</li>
						<li>핸드폰번호</li>
						<li>email</li>
						<li>클래스명</li>
						<li>한줄소개</li>
						<li>최애음식</li>
					</ul>
				</div>
				<form action="/update.members" method="post" id="updateForm">
					<div class="inpocontents2">
						<input type="text" value="${my.userID}" id="id" readonly><br>
						<input type="password" value="${my.pw}" id="pw1" name="pw"
							readonly><br> <input type="password" id="pw2"
							readonly id="pwConfirm"><br> <input type="text"
							value="${my.name}" readonly><br> <input type="text"
							value="${my.nickname}" id="nickname" name="nickname" readonly><br>
						<input type="text" value="${my.phone}" id="phone" name="phone"
							readonly><br> <input type="text" value="${my.email}"
							id="email" name="email" readonly><br> <input
							type="text" value="${my.classes}" readonly><br> <input
							type="text" value="${my.selfcomment}" id="selfcomment"
							name="selfcomment" readonly><br> <input type="text"
							value="${my.favoriteFood}" id="favoriteFood" name="favoriteFood"
							readonly><br>
						<button id="modiBtn" type="button">수정하기</button>
						<button id="modiComBtn" type="submit">수정완료</button>
						<button id="memberoutBtn" type="button">회원탈퇴</button>
					</div>
				</form>
			</div>
		</div>
		<div class="body2">
			<div class="body2Navi">
				<a href="#null" class="myContents" id="writeListBtn">내가 쓴 글</a> <a
					href="#null" class="myContents" id="replyListBtn">내가 쓴 댓글</a> <a
					href="#null" class="myContents" id="reviewMarkBtn">내가 스크랩한 리뷰</a> <a
					href="#null" class="myContents" id="favoriteStoreListBtn">내가
					즐겨찾기한 가게</a> <a href="#null" class="myContents" id="consultListBtn">1:1
					문의</a>
			</div>
			<div class="body2Contents">
				<table border-bottom="1" class="table" id="writeList">
					<!--내가 쓴 글 리스트 뽑아내기-->
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="15%">
						<col width="10%">
						<col width="25%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>bootstrap</td>
							<td>세영</td>
							<td>1</td>
							<td>2023.05.01</td>
						</tr>
					</tbody>
				</table>
				<table border-bottom="1" class="table" id="replyList">
					<!--내가 쓴 댓글 리스트 뽑아내기-->
					<colgroup>
						<col width="5%">
						<col width="40%">
						<col width="40%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>글 제목</th>
							<th>댓글 내용</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2</td>
							<td>bootstrap</td>
							<td>세영</td>
							<td>1</td>
						</tr>
					</tbody>
				</table>
				<table border-bottom="1" class="table" id="reviewMark">
					<!--블로그형 리뷰 스크랩-->
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="15%">
						<col width="10%">
						<col width="25%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>3</td>
							<td>bootstrap</td>
							<td>세영</td>
							<td>1</td>
							<td>2023.05.01</td>
						</tr>
					</tbody>
				</table>

				<!--     새로 추가한 내가 즐겨찾기 한 가게 리스트 -->
				<table border-bottom="1" class="table" id="favoriteStoreList">
					<!-- 리뷰 스크랩-->
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="15%">
						<col width="10%">
						<col width="25%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>3</td>
							<td>bootstrap</td>
							<td>세영</td>
							<td>1</td>
							<td>2023.05.01</td>
						</tr>
					</tbody>
				</table>
				<table border-bottom="1" class="table" id="consultList">
					<!-- 1:1문의 리스트 -->
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="15%">
						<col width="10%">
						<col width="25%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>4</td>
							<td>bootstrap</td>
							<td>세영</td>
							<td>1</td>
							<td>2023.05.01</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
      $("#postSearch").on("click", function() { // 주소 API

         new daum.Postcode({
            oncomplete : function(data) {
               let roadAddr = data.roadAddress;
               document.getElementById('zipCode').value = data.zonecode;
               document.getElementById("address1").value = roadAddr;
            }
         }).open();
      })

      $("document").ready(function(){
    	  
    	  		  $("#memberoutBtn").on("click",function(){ //탈퇴하기 버튼 누를 때 이동
    	  			  location.href = "/memberout/memberout.jsp";  
    	  		  })
    	  		  
                   $("#modiBtn").on("click",function() { //수정하기

                         $("#postSearch").css("display","inline-block");
                         $("#modiBtn").css("display","none");
                         $("#modiComBtn").css("display","inline-block");
                         $("#pw1,#pw2,#nickname,#phone,#email,#zipCode,#address1,#address2,#selfcomment,#favoriteFood").removeAttr("readonly");  
                     })

                     $("#modiComBtn").on("click", function() { //수정완료
                        $("#modiComBtn").css("display", "none");
                        $("#modiBtn").css("display", "inline-block");
                        $("#postSearch").css("display", "none");
                        $("input").attr("readonly", true);
                     })

                     $(".myContents").on("click", function() { //내가 쓴글...등 버튼 이벤트
                              $(this).css("border-bottom", "none");
                              $(".myContents").not(this).css(
                                    "border-bottom",
                                    "1px solid black");
                           })
                     $("#writeListBtn").on("click",function(){ //내가 쓴 글 버튼 누르면 관련 테이블 나오게 이벤트
	    	  			 $("#writeList").css("display","table");
	      	  			 $("table").not("table#writeList").css("display","none");
     				 })
      
       				 $("#replyListBtn").on("click",function(){ //내가 쓴 댓글 버튼 누르면 관련 테이블 나오게 이벤트
	    	 			 $("#replyList").css("display","table");
	      				 $("table").not("table#replyList").css("display","none");
      				})
      				
      				$("#replyListBtn").on("click",function(){ //내가 쓴 댓글 버튼 누르면 관련 테이블 나오게 이벤트
	    	 			 $("#reviewMark").css("display","table");
	      				 $("table").not("table#reviewMark").css("display","none");
      				})
      
       				$("#favoriteStoreListBtn").on("click",function(){ //즐겨찾기 버튼 누르면 관련 테이블 나오게 이벤트
	      	  			$.ajax({
	      	  				url:"/selectFavoriteStore.store",
	      	  				type:"post"
	      	  			}).done(function(resp){
	      	  				resp = JSON.parse(resp);
	      	  				console.log(resp);
	      	  				let str = "";
	      	  				resp.FavoriteStoreList.forEach(function (value, index){
		      	  			  	console.log(value);
		      	  			});
	      	  			})
	    	 			$("#favoriteStoreList").css("display","table");
	      	  			$("table").not("table#favoriteStoreList").css("display","none");
      				})
      
      				$("#consultListBtn").on("click",function(){ //1:1문의 버튼 누르면 관련 테이블 나오게 이벤트
	    	  			$("#consultList").css("display","table");
	      	  			$("table").not("table#consultList").css("display","none");
      				})        
                  })

      $("#updateForm").on("submit",function() { //수정 regex

               let regexPw = /^[A-Za-z0-9]{7,13}$/;
               let regexPhone = /^010[0-9]{8}$/;
               let regexEmail = /.+@.+\..+/;

               let pw1 = $("#pw1");
               let pw2 = $("#pw2");
               let phone = $("#phone");
               let email = $("#email");

               if (pw1.value != "" && pw2.value != "" && phone.value != ""
                     && email.value != "") {

                  let result1 = regexPw.test(pw2.value);
                  let result2 = regexPhone.test(phone.value);
                  let result3 = regexEmail.test(email.value);

                  if (pw1.value != pw2.value) {
                     alert("패스워드를 다시 확인해주세요.");
                     return false;
                  } else if (!result1) {
                     alert("패스워드 형식이 잘못됐습니다.");
                     return false;
                  } else if (!result2) {
                     alert("핸드폰 번호 형식이 잘못됐습니다.")
                     return false;
                  } else if (!result3) {
                     alert("이메일 형식이 잘못됐습니다.")
                     return false;
                  } else {
                     alert("정보를 다 입력해주세요.")
                     return false;
                  }
               }
            })

      $("#pw2").on("keyup", function() { //패스워드 일치여부
         let inputPw1 = $("#pw1");
         let inputPw2 = $("#pw2");

         if (inputPw1.val() == inputPw2.val()) {
            $("#pwConfirm").html("패스워드가 일치합니다").css({
               "color" : "blue",
               "font-size" : "13px"
            });
         } else {
            $("#pwConfirm").html("패스워드가 일치하지 않습니다").css({
               "color" : "red",
               "font-size" : "13px"
            });
         }
      })
   </script>
</body>
</html>