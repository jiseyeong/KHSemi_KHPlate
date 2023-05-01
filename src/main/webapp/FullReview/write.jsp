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
		<form action="/write.fullreview">
			<input type="text" placeholder="제목란" class="title" name="title">
			<div class="storeId" name="storeId"></div>
			<div class="score" name="score">별점란</div>
			<div class="bodyBox">
				<textarea class="reviewBody"></textarea>
			</div>
			<br>
			<div>
				<button class="submitBtn" type="submit">작성완료</button>
			</div>
		</form>
	</div>
</body>
</html>