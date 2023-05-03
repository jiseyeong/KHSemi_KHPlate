<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	p{font-size:20px; font-weight:bold;}
</style>
</head>
<body>

   	<a href="/page/main.jsp"><button style="width:200px; height:100px;">메인페이지 접속</button></a><br>

	<hr>
	<p>페이지 만드는 중</p><br>
	지도로 음식점 검색? -><a href="/allstore_inquiry/allstore_inquiry.jsp">allstore_inquiry.jsp</a><br>
	음식점 검색 결과 -> <a href="/common/main_storeSearchResult.jsp">main_storeSearchResult.jsp</a><br>
	블로그형 글 검색 결과 -> <a href="/common/main_blogSearchResult.jsp">main_blogSearchResult.jsp</a><br>
	검색 필터 -> <a href="/common/sort_filter.html">sort_filter.html</a><br>
	<hr>
	가게 정보 확인 -> <a href="/store/view.jsp">view.jsp</a>
	<hr>
	<p>수정 완료 > 컨트롤러 적용 예정</p>
	<br>
	마이페이지 -> <a href="/mypage/myPageVer2.jsp">myPageVer2.jsp</a><br>
	메인 페이지 -> <a href="/page/main.jsp">main.jsp</a><br>
	<br>
	<hr>
	<p>컨트롤러 적용 완료</p><br>
	블로그 리뷰 글보기 -> <a href="FullReview/FullReviewContent.jsp">FullReviewContent.jsp</a><br>
	블로그 리뷰 리스트 -> <a href="FullReview/FullReviewList.jsp">FullReviewList.jsp</a><br>
	블로그 리뷰 글쓰기 -> <a href="FullReview/writeFullReview.jsp">writeFullReview.jsp</a>
	<hr>
	
	<br>
	<p>컨트롤러,디자인 적용 완료</p><br>
	회원가입 -> <a href="/joinform/joinform.jsp">joinform.jsp</a><br>
	아이디 중복확인 -> <a href="/joinform/isIdExist.jsp">isIdExist.jsp</a><br>
	<hr>
	헤더 -> <a href="/page/header.jsp">header.jsp</a><br>
	사이드바 -> <a href="/page/sideBar.jsp">sideBar.jsp</a><br>
	footer -> <a href="/page/footer.jsp">footer.jsp</a><br>
	페이지 틀 -> <a href="/page/test.jsp">test.jsp</a><br>
	<hr>
	카카오 로그인 -> <a href="/login/kakaologin.html">kakaologin.html</a><br>
	네이버 로그인 -> <a href="/login/naverlogin.jsp">naverlogin</a><br>
	네이버 callback -> <a href="/login/navercallback.jsp">navercallback</a><br>
	로그인 -> <a href="/login/login.jsp">login.jsp</a><br>
	아이디 찾기 -> <a href="/memberSearch/idsearch.jsp">idsearch.jsp</a><br>
	새 비밀번호 설정 -> <a href="/memberSearch/newpassword.jsp">newpassword.jsp</a><br>
	비밀번호 찾기 -> <a href="/memberSearch/pwsearch.jsp">pwsearch.jsp</a>
	<hr>
	회원탈퇴 -> <a href="/memberout/memberout.jsp">memberout.jsp</a>
	<hr>
	문의 작성 -> <a href="/adminPage/consultRegister.jsp">consultRegister.jsp</a><br>
	문의 내역 -> <a href="/adminPage/consultList.jsp">counsultList.jsp</a><br>	
	문의 답변 작성 -> <a href="/adminPage/consultReplyRegister.jsp">consultReplyRegister.jsp</a><br>
	문의 글 보기 -> <a href="/adminPage/consultView.jsp">consultView.jsp</a><br>
	FAQ 등록 -> <a href="/adminPage/FAQRegister.jsp">FAQRegister.jsp</a><br>
	FAQ 리스트 -> <a href="/adminPage/FAQView.jsp">FAQView.jsp</a><br>
	<hr>
	가게 정보 등록 -> <a href="/store/registerForm.jsp">registerForm.jsp</a><br>
</body>
</html>