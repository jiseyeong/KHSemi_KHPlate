<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="/update.fullreview" class="frm">
			<input type="text" placeholder="제목란" class="title" name="title" value="${contents.title }" readonly>
			<div class="storeId" name="storeId">음식점</div>
			<div class="score" name="score">별점란</div>
			<div class="bodyBox">
				<textarea class="reviewBody" readonly>${contents.reviewbody }</textarea>
			</div>
			<br>
			<div>
				<button class="modiBtn" type="button">수정하기</button>
				<button class="delBtn" type="button" reviewId="${contents.reviewId }">삭제하기</button>
				<button class="submitBtn" type="submit" style="display:none">수정완료</button>
				<button class="toListBtn" type="button">목록으로</button>
			</div>
		</form>
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