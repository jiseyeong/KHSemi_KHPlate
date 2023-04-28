<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복검사</title>
<script  src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<style>
	.container{margin:auto}
	table{width:100%;
		height:90vh;
		text-align:center;
	}
	#result{color:red}
</style>
	
	<div class="container">
	<c:choose>

		<c:when test="${result==true}"> 
			<table border="1">
				<tr>
					<th>중복검사 결과</th>
				</tr>
				<tr>
					<td>이미 사용중인 ID입니다.</td>
				</tr>
				<tr>
					<td><button id="close">닫기</button></td>
					<script>
						$("#close").on("click",function(){
							window.close();
							//팝업은 child window, 팝업을 띄운 창은 parent window 
							// 팝업에서 parent window를 호출하기 위해선 opener
							opener.document.getElementById("id").value="";
						})
					</script>
				</tr>
			</table>
		</c:when>
		
		<c:otherwise> 
			<table border="1">
				<tr>
					<th colspan=2>중복검사 결과</th>
				</tr>
				<tr>
					<td colspan=2 id="result">사용가능</td>
				</tr>
				<tr>
					<td colspan=2>이 아이디를 사용하시겠습니까?</td>
				</tr>
				<tr>
					<td><button type="button" id="use">사용하기</button></td>
					<td><button type="button" id="cancle">닫기</button></td>
				<script>
						$("#use").on("click",function(){
							opener.idValidFlag= true; //회원가입에 id 중복여부 확인 체크
							//이외 버튼 클릭시에는 false로 가입거부
							window.close();
						});
						$("#cancle").on("click",function(){
							opener.document.getElementById("id").value="";
							window.close();
						});
					</script>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
	</div>
	
	
	
</body>
</html>