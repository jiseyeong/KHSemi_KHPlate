<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;

* {
	font-family: 'Nanum Gothic', sans-serif;
}

.text {
	width: 100px;
	margin-left:10px; 
}

.title {
	width: 100%;
}

.reviewbody {
	width: 100%;
}

#re_write_btn {
	width: 80px;
	height: 40px;
	margin-right: 0px;
}

.replyguide {
	background-color: #d0d0d0;
	border-radius: 10px;
}

#storeId{
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

.ck-editor__editable_inline {
	min-height: 150px;
	border: 1px solid white;
}

.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
	border: none;
}

.re_List_Container {
	height: 100px;
}

.contentsBtn {
	
}

.contentsBtn>button {
	width: 100px;
	height: 40px;
	background-color: #57b846;
	border: none;
	border-radius: 12px;
	cursor: pointer;
	color: white;
	font-size: 14px;
	margin-right: 20px;
	box-shadow: 1px 1px 5px 1px rgb(231, 231, 231);
}

.re_List_Container>button {
	width: 100px;
	height: 40px;
	background-color: #57b846;
	border: none;
	border-radius: 12px;
	cursor: pointer;
	color: white;
	font-size: 14px;
	margin-right: 20px;
	box-shadow: 1px 1px 5px 1px rgb(231, 231, 231);
}
</style>

</head>
<body>
	<div class="container">

		<!-- 본문란 -->
		<form action="/update.fullreview" class="frm" method="post">
			<input type="text" class="title" name="title"
				value="${contents.title }" readonly>

			<hr style="border-style: dotted;">

			<input type="text" class="userid" value="${writerName }" readonly>

			<hr style="border-style: dotted;">

			<input type="text" class="text" value="가게 이름 : " readonly> 
			<input type="text" class="storename" name="storename" value="${storeName }" readonly> 
				
				<select id="storeId" class="storeId" name="storeId" style="display: none">
				<option selected>음식점</option>
				<c:forEach items="${store }" var="i" varStatus="status">
					<option value="${i.storeID }">${i.name }</option>
				</c:forEach>

			</select> <input type="text" class="text" value="평점 : " readonly> <input
				type="text" class="score" name="score" value="${contents.score }"
				readonly> <input type="text" class="reviewid"
				name="reviewid" value="${contents.reviewID }" style="display: none">

			<hr style="border-style: dotted;">

			<div class="bodyBox">
				<textarea class="reviewbody" name="reviewbody" id="intro_editor"
					readonly>${contents.reviewBody }</textarea>
			</div>
			<br>
			<div class="contentsBtn">

				<c:choose>
					<c:when test="${sessionScope.userno eq contents.userNO}">
						<button class="modiBtn" type="button">수정하기</button>
						<button class="submitBtn" type="submit" style="display: none;">수정완료</button>
						<button class="delBtn" type="button" reviewId="${contents.reviewID}">삭제하기</button>
						<button class="toListBtn" type="button">목록으로</button>
					</c:when>

					<c:otherwise>
						<button class="toListBtn" type="button">목록으로</button>
					</c:otherwise>
				</c:choose>
			</div>
		</form>

		<hr 1px>

		<!-- 댓글 작성란 -->
		<form action="write.fullreviewreply" method="post">
			<div class="replyguide">
				<input type="text" id="userid" name="userid"
					value="${sessionScope.userId}" readonly
					style="height: 40px; margin-left: 10px; font-weight: bold;">
				<input type="text" class="userno" name="userno"
					value="${sessionScope.userno}" style="display: none;"> <input
					type="text" class="reviewid" name="reviewid"
					value="${contents.reviewID }" style="display: none;"> <br>
				<input type="text" id="body" name="body" placeholder="작성할 댓글 입력"
					style="height: 40px; width: 92%; margin-left: 5px;"> <input
					type="submit" value="작성완료" id="re_write_btn" name="re_write_btn">
			</div>
		</form>

		<hr 1px>

		<!-- 댓글목록란 -->
		<c:if test="${replyList!=null}">
			<c:forEach var="i" items="${replyList}">
				<form action="/update.fullreviewreply" method="post">
					<div class="re_List_Container">
						<input type="text" class="re_list_writer" value="${i.userid }"
							style="height: 50%;" readonly>

						<c:choose>
							<c:when test="${sessionScope.userId eq i.userid}">
								<button class="re_list_updbtn" type="button">수정</button>
								<button class="re_list_delbtn" type="button"
									commentid="${i.commentid }" reviewid="${contents.reviewID }">삭제</button>
								<input type="submit" value="수정완료" class="re_list_updCompBtn"
									style="display: none">

								<input type="text" class="reviewid" id="reviewid"
									name="reviewid" value="${contents.reviewID }"
									style="display: none">
								<input type="text" class="commentid" id="commentid"
									name="commentid" value="${i.commentid }" style="display: none">

							</c:when>
						</c:choose>

						<input type="text" value="${i.body }" class="re_list_body"
							name="re_list_body" style="width: 100%; height: 50%;" readonly>
					</div>
				</form>
				<br>
			</c:forEach>
		</c:if>

	</div>

	<script>
	var myEditor = null;
	//에디터 스크립트
	ClassicEditor
		.create(document.querySelector("#intro_editor"), {
			toolbar: ['heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList', 'insertTable', 'blockQuote', 'undo', 'redo',]
		})
		.then(function (editor) {
			const toolbarElement = editor.ui.view.toolbar.element;
			myEditor = editor;
			editor.on('change:isReadOnly', (evt, propertyName, isReadOnly) => {
				if (isReadOnly) {
					toolbarElement.style.display = 'none';
				} else {
					toolbarElement.style.display = 'flex';
				}
			});
			editor.enableReadOnlyMode('');
		})
		.catch(error => { console.error(error) });

		
	
		$(".toListBtn").on("click", function() {
			location.href = "/select.fullreview";
		})

		$(".modiBtn").on("click", function() {
			$(".modiBtn").css("display", "none");
			$(".delBtn").css("display", "none");
			$(".toListBtn").css("display", "none");
			$(".submitBtn").css("display", "block");
			$(".storename").css("display", "none");
			$(".storeId").css("display", "inline-block");
			$(".title").removeAttr("readonly");
			$(".storeId").removeAttr("readonly");
			$(".score").removeAttr("readonly");
			$(".reviewbody").removeAttr("readonly");
			myEditor.disableReadOnlyMode("");
		})

		$(".re_list_updbtn").on("click", function() {
			$(this).css("display", "none");
			$(this).next().css("display", "none");
			$(this).next().next().css("display", "block");
			$(this).parent().prev().children().removeAttr("readonly");
		})

		$(".re_list_delbtn").on(
				"click",
				function() {
					if (confirm("댓글을 정말로 삭제하시겠습니까?")) {
						location.href = "/delete.fullreviewreply?reviewid="
								+ $(this).attr("reviewid") + "&commentid="
								+ $(this).attr("commentid");
					} else {
						return false;
					}
				})

		$(".delBtn").on(
				"click",
				function() {
					if (confirm("게시글을 정말로 삭제하시겠습니까?")) {
						location.href = "/delete.FullReview?reviewid="
								+ $(this).attr("reviewid");
					} else {
						return false;
					}
				})
	</script>
</body>
</html>