<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인박스</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>

	<c:if test="${param.state=='a_j'}">
		<script>
			alert("Thank You for Join Us!");
		</script>
	</c:if>

	<c:choose>
		<c:when test="${loginID == null}">
			<form action="/login.members" method="post">
				<table border="1" align="center">
					<tr>
						<th colspan="2">Login Box</th>
					</tr>
					<tr>
						<td align="center">ID:</td>
						<td><input type="text" name="id" placeholder="Input id here">
						</td>
					</tr>
					<tr>
						<td align="center">PW:</td>
						<td><input type="password" name="pw" placeholder="Input password here"> 
						<input type="checkbox">Remember this ID></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="submit" name="Login" id="Login" value="Login"><br>
					</tr>
					<tr>
						<td align="center">
						<input type="button" name="NaverLI" id="NaverLI" value="Naver Login"> 
						<input type="button" name="KakaoLI" id="KakaoLI" value="Kakao Login"></td>
					</tr>
				</table>
			</form>
			<script>
			$("#NaverLI").on("click", function() {
				location.href = "/login.naverlogin.jsp"
			});
			
			$("#KakaoLI").on("click", function() {
				location.href = "/login.kakaologin.html"
			});

			
			</script>
		</c:when>
	</c:choose>
</body>
</html>