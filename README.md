<h1>KH PLATE</h1>

<h2>✔개요</h2>
 <li>
   학원 근처 주변 음식점의 정보를 한 번에 조회하고 평가할 수 있는 사이트
 </li>


<h4>📄 만든 목적</h4>
  <li>수강생들의 점심 고민 해결을 위함</li>
  
<h4>⏱ 일정</h4>
  <li>﻿2023년 4월 20일 ~ 2023년 5월 7일</li>
  <li>참여도 : 20% (6인 프로젝트)</li>

<h4>🔖 배포 주소</h4>
  <li>http://khplate.duckdns.org:8090/</li>
  <h2>✔사용 기술 및 환경</h2>
  <li>OS : Windows OS</li>
  <li>Tool : Eclipse, IntelliJ</li>
  <li>DBMS : Oracle DB</li>
  <li>Server : Apache Tomcat 8.5</li>
  <li>Language : Java, HTML5, CSS, JavaScript, JQuery, Servlet, JSP, Ajax</li>

<h2>✔ERD</h2>

![image](https://github.com/jiseyeong/KH_Project/assets/128104813/c0f4d9c0-0bfd-4e44-b57e-10b48f846111)
![image](https://github.com/jiseyeong/KH_study/assets/128104813/925cb72c-5241-482e-a5ed-a006f8d87ecf)

<h2>✔주요 기능</h2>
<h4>🔒 마이페이지</h4>
 <ul>
   <li>내 정보 출력, 수정, 내 프로필 등록, 수정</li>
   <li>회원 탈퇴</li>
   <li>내가 쓴 글 목록 출력, 내가 쓴 리뷰 목록 출력, 내가 스크랩한 리뷰 목록 출력, 내가 즐겨찾기한 가게 목록 출력, 내가 쓴 1:1문의 글 목록 출력</li>
 </ul>
 
![image](https://github.com/jiseyeong/KH_study/assets/128104813/542a00ef-b882-4df1-9ae3-7478e151adf5)
![image](https://github.com/jiseyeong/KH_study/assets/128104813/0e0a2ca4-bcfe-40d9-ad32-06aa2e5b8425)

<h4>🍕 맛집 상세페이지</h4>
 <ul>
   <li>캐러쉘을 활용한 등록된 맛집의 사진 출력 구현</li>
   <li>지도API를 활용한 등록된 맛집의 위치 출력 구현</li>
   <li>﻿평균 평점 출력 구현, 좋아요 여부 구현</li>
   <li>﻿한줄 리뷰 기능 구현 (리뷰 입력, 리뷰 수정, 리뷰 삭제, 리뷰 출력)</li>
 </ul>
 
![image](https://github.com/jiseyeong/KH_study/assets/128104813/dbf770f3-3a3d-42c1-b056-726cf8c5ce1d)
![image](https://github.com/jiseyeong/KH_study/assets/128104813/51969db1-6ea9-4b3b-bd00-a2a641bfe5ac)

<h4>﻿메인 페이지</h4>
 <ul>
  <li>메인 페이지 내 메인 캐러셀로 대표 맛집 메뉴를 표시</li>
  <li>카드 형식의 추천 맛집 리스트를 출력</li>
  <li>JSP:Include로 메인 페이지를 포함한 페이지 전반의 공통 요소들을 묶어 Component로 구현 및 사용(Header, Sidebar, Footer)</li>
 </ul>
<h4>회원가입 및 로그인 페이지</h4>
 <ul>
   <li>기존 정규식 과정과 ID 중복 여부 체크를 활용한 회원가입 폼</li>
   <li>SMTP 서버를 활용한 JavaMail API로 회원가입 후 링크를 통한 메일 인증으로 회원가입 절차 완료</li>
   <li>네이버, 카카오 내 간편 로그인 API를 활용하여 전송된 토큰 값에 따른 간편 로그인 기능을 적용</li>
 </ul>
<h4>카테고리별 맛집 리스트 조회</h4>
 <ul>
   <li>음식 카테고리와 검색 및 필터를 통한 맛집 리스트 조회</li>
   <li>리스트 내에서 Ajax를 활용한 좋아요 등록/삭제 기능 구현</li>
 </ul>
<h4>지도를 활용한 맛집 탐방 서비스</h4>
 <ul>
   <li>카카오 지도 API를 활용한 맛집 리스트들을 표시</li>
   <li>검색 필터와 연동하여 필터링된 맛집 리스트들을 별도로 표시하는 기능을 구현</li>
 </ul>
<h4>진심 리뷰 블로그 페이지</h4>
  <ul>
    <li>맛집에 대한 진심 리뷰를 담을 수 있는 게시판</li>
    <li>WYSIWYG 편집기인 CK Editor를 활용한 게시판 및 댓글 CRUD 구현</li>
  </ul>
