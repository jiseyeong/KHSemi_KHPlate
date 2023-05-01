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
	.title{
		width:100%;
	}
	
	.reviewbody{
		width:100%;
	}
</style>

</head>
<body>
	<div class="container">
		
		<!-- 본문란 -->
		<form action="/update.fullreview" class="frm" method="post">
			<input type="text" placeholder="제목란" class="title" name="title" value="${contents.title }" readonly>
			
			<div class="storeId" name="storeId">음식점</div>
			<div class="score" name="score">별점란</div>
			<div class="bodyBox">
				<textarea class="reviewbody" readonly>${contents.reviewbody }</textarea>
			</div>
			<br>
			<div>
				<button class="modiBtn" type="button">수정하기</button>
				<button class="delBtn" type="button" reviewId="${contents.reviewId }">삭제하기</button>
				<button class="submitBtn" type="submit" style="display:none">수정완료</button>
				<button class="toListBtn" type="button">목록으로</button>
			</div>
		</form>
		
		<!-- 댓글 작성란 -->
			<form action="write.fullreviewreply" method="post">
		<table border="1">
			<tr>
				<td colspan="2">작성자 ID : <input type="text" id="re_writer"
					name="re_writer" value="${sessionScope.loginId}" readonly>
					<input type="text" class="seq" name="seq" value="${dto.seq }">
				</td>
			</tr>
			<tr>
				<td><input type="text" id="re_contents" name="re_contents"
					placeholder="작성할 댓글 입력" size="87%"></td>
				<td><input type="submit" value="작성완료" id="re_write_btn"
					name="re_write_btn"></td>
			</tr>
		</table>
	</form>
		
		
		<!-- 댓글목록란 -->
		<c:if test="${replyList!=null}">
		<c:forEach var="i" items="${replyList}">
			<form action="update.fullreviewreply" method="post">
				<table border="1">
					<tr>
						<td colspan="2">작성자 id : <input type="text"
							class="re_lsit_writer" value="${i.writer }" readonly></td>
					</tr>
					<tr>
						<td><input type="text" value="${i.contents }"
							class="re_list_contents" name="re_li_contents" readonly></td>

						<td><c:choose>
								<c:when test="${sessionScope.loginId eq i.writer}">
									<button class="re_list_updbtn" type="button">수정</button>
									<button class="re_list_delbtn" type="button" re_seq="${i.seq }"
										re_pa_seq="${dto.seq }">삭제</button>
									<input type="submit" value="수정완료" class="re_list_updCompBtn"
										style="display: none">

									<input type="text" class="seq" id="re_pa_seq" name="re_pa_seq"
										value="${dto.seq }">
									<input type="text" class="seq" id="re_seq" name="re_seq"
										value="${i.seq }">

								</c:when>
							</c:choose></td>
					</tr>
				</table>
			</form>
			<br>
		</c:forEach>
	</c:if>
		
	</div>
	
	<script>
		$(".toListBtn").on("click",function(){
			location.href="/FullReview/FullReviewList.jsp";
		})
		
		$(".modiBtn").on("click",function(){
			$(".modiBtn").css("display","none");
			$(".submitBtn").css("display","block");
			$(".title").removeAttr("readonly");
			$(".reviewBody").removeAttr("readonly");
		})

		$(".delBtn").on("click",function(){
			if (confirm("게시글을 정말로 삭제하시겠습니까?")) {
				location.href = "/delete.FullReview?reviewId=" + $(this).attr("reviewId");
			} else {
				return false;
			}
		})
		
		
		</script>
</body>
</html>