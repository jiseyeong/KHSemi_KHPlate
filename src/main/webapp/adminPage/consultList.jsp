<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1상담 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/octicons/3.3.0/octicons.min.css"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<style>
/* 헤더 및 sideBar 부분 스타일 - 건들지 말것 */
* {
	box-sizing: border-box;
	padding: 0px;
}
table{
	text-align:center;
}
.body {
	margin: auto;
}

.sideList {
	border: 1px solid black;
}

/* 하단부터 메인부분 스타일 작성 요망 */
</style>
</head>
<body>
	<div class="container-fluid themed-container m-0 g-0">
		<!-- 헤더부분 건들지 말것 -->
		<jsp:include page="/page/header.jsp" flush="false"></jsp:include>



		<!-- body 부분 row div 건들지 말것 -->
		<div class="row g-0 justify-content-center body" style="margin-top:70px;">
			<!-- sideBar부분 건들지 말것 -->
			<jsp:include page="/page/sideBar.jsp" flush="false"></jsp:include>

			<div class="col-12 col-lg-9 g-0 themed-grid-col bodyContents">
				<!-- Main 내용 부분 하단부터 수정 요망 -->
				<table align="center" class="table table-secondary table-striped">
					<tr>
						<th width="10%">글 번호</th>
						<th width="40%">제목</th>
						<th width="15%">질문자</th>
						<th width="10%">답변 여부</th>
						<th width="15%">업로드 일자</th>
						<th width="10%">분류</th>
					</tr>
					<c:if test="${fn:length(list) > 0}">
						<c:forEach var="i" begin="0" end="${fn:length(list)-1}" step="1">
							<tr>
								<td>${list.get(i).consultID}</td>
								<td><a href="/view.consult?consultID=${list.get(i).consultID}">${list.get(i).title}</a></td>
								<td>${writerList.get(i)}</td>
								<td>
									<c:choose>
										<c:when test="${list.get(i).reply eq 'Y'}">
											응답
										</c:when>
										<c:otherwise>
											미응답
										</c:otherwise>
									</c:choose>
								</td>
								<td>${list.get(i).writeDate}</td>
								<td>${list.get(i).category}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<!-- body main 수정 여기까지, 하단 건들지 말것. -->
			</div>
		</div>
		<jsp:include page="/page/footer.jsp" flush="false"></jsp:include>
	</div>
</body>
</html>