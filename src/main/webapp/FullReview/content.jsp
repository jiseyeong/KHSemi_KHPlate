<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</style>

</head>
<body>
	<div class="container">

		<!-- 본문란 -->
		<form action="/update.fullreview" class="frm" method="post">
			<input type="text" class="title" name="title"
				value="${contents.title }" readonly> <input type="text"
				class="storename" name="storename" value="${storeName }" readonly>

			<select id="storeId" class="storeId" name="storeId"
				style="display: none">
				<option selected>음식점</option>
				<c:forEach items="${store }" var="i" varStatus="status">
					<option value="${i.storeID }">${i.name }</option>
				</c:forEach>
			</select> <input type="text" class="score" name="score"
				value="${contents.score }" readonly> <input type="text"
				class="reviewid" name="reviewid" value="${contents.reviewID }"
				style="display: none">
			<div class="bodyBox">
				<textarea class="reviewbody" name="reviewbody" readonly>${contents.reviewBody }</textarea>
			</div>
			<br>
			<div>

				<c:choose>
					<c:when test="${sessionScope.userno eq contents.userNO}">
						<button class="modiBtn" type="button">수정하기</button>
						<button class="delBtn" type="button"
							reviewId="${contents.reviewID}">삭제하기</button>
						<button class="submitBtn" type="submit" style="display: none">수정완료</button>
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
					<input type="text" class="re_list_writer" value="${i.userid }"readonly> 
					<input type="text" value="${i.body }" class="re_list_body" name="re_list_body" readonly>

					<c:choose>
						<c:when test="${sessionScope.userId eq i.userid}">
							<button class="re_list_updbtn" type="button">수정</button>
							<button class="re_list_delbtn" type="button"
								commentid="${i.commentid }" reviewid="${contents.reviewID }">삭제</button>
							<input type="submit" value="수정완료" class="re_list_updCompBtn" style="display: none">

							<input type="text" class="reviewid" id="reviewid" name="reviewid"
								value="${contents.reviewID }" style="display: none">
							<input type="text" class="commentid" id="commentid"
								name="commentid" value="${i.commentid }" style="display: none">

						</c:when>
					</c:choose>

				</form>
				<br>
			</c:forEach>
		</c:if>

	</div>

	<script>
		$(".toListBtn").on("click", function() {
			location.href = "/select.fullreview";
		})

		$(".modiBtn").on("click", function() {
			$(".modiBtn").css("display", "none");
			$(".delBtn").css("display", "none");
			$(".toListBtn").css("display", "none");
			$(".submitBtn").css("display", "block");
			$(".storename").css("display", "none");
			$(".storeId").css("display", "block");
			$(".title").removeAttr("readonly");
			$(".storeId").removeAttr("readonly");
			$(".score").removeAttr("readonly");
			$(".reviewbody").removeAttr("readonly");
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