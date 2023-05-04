<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.ck-editor__editable_inline {
    min-height: 400px;
}

input {
	border: none;
	border-radius: 10px;
	background-color: #ffffff00;
}

input:focus {
	outline: none !important;
}

textarea {
	border: none;
}

.re_List_Container {
	height: 100px;
}

.reviewBody {
	width: 100%;
	height: 100%;
}

.bodyBox {
	width: 100%;
}

.title {
	width: 600px;
}

.submitBtn {
	float: right;
	width: 100px;
	height: 40px;
	background-color: #57b846;
	border-radius: 3px;
	cursor: pointer;
	border:none;
	color: white;
	font-size: 14px;
	box-shadow:1px 1px 5px 1px rgb(231, 231, 231)
}

.score{
	margin-left:25px;
	margin-right:25px;
}

</style>

</head>
<body>
	<div class="container">
		<form action="/write.fullreview" method="post">
			<input type="text" placeholder="제목란" class="title" name="title">
			
			<hr style="border-style: dotted;">
			
			<input type="text" class="userId" name="userId" value="${sessionScope.userId}" readonly>
			<input type="text" class="userNo" name="userNo" value="${sessionScope.userno}" style="display:none">
			
			<hr style="border-style: dotted;">
			
			<select id = "storeId" class="storeId" name="storeId">
				<option selected>음식점</option>
					<c:forEach items="${store }" var="i" varStatus="status">
						<option value="${i.storeID }">${i.name }</option>
					</c:forEach>
			</select>
			<input type="text" placeholder="별점" class="score" name="score">
			<div class="void"><br></div>
			<div class="storeId" name="storeId"></div>
			<div class="bodyBox">
				<textarea class="reviewBody" name="reviewBody" id="editor"></textarea>
			</div>
			<br>
			<div>
				<button class="submitBtn" type="submit">작성완료</button>
			</div>
		</form>
	</div>
	
	<script>
	ClassicEditor
	.create(document.querySelector("#editor"), {
		 toolbar: ['heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList', 'insertTable', 'blockQuote', 'undo', 'redo',]
	})
	.catch(error => { console.error(error) });
	
	</script>
	
	
</body>
</html>