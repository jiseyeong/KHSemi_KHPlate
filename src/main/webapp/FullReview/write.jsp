<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.reviewBody {
	width: 100%;
	height: 100%;
}

.bodyBox {
	width: 100%;
	height: 1000px;
}

.title {
	width: 600px;
}

.submitBtn {
	float: right;
}
</style>

</head>
<body>
	<div class="container">
		<form action="/write.fullreview" method="post">
			<input type="text" placeholder="제목란" class="title" name="title">
			<input type="text" class="userId" name="userId" value="${sessionScope.userId}" readonly>
			<input type="text" class="userNo" name="userNo" value="${sessionScope.userno}" style="display:none">
			<div class="void"><br></div>
			<input type="text" placeholder="음식점 선택란" class="storeId" name="storeId">
			<input type="text" placeholder="별점" class="score" name="score">
			<div class="void"><br></div>
			<div class="storeId" name="storeId"></div>
			<div class="bodyBox">
				<textarea class="reviewBody" name="reviewBody"></textarea>
			</div>
			<br>
			<div>
				<button class="submitBtn" type="submit">작성완료</button>
			</div>
		</form>
	</div>
</body>
</html>