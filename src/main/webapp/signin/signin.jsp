<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<title>회원가입</title>
<style>
*{box-sizing: border-box;
                     }
                     
            .container{
            width:1250px;
            height: 1300px;
            margin: auto; 
            font-size: 20px;
            
        }


td:first-child {
	text-align: right;
}
</style>

<body>
	  <div class="container">
   
    <fieldset>
        <legend id="signup">SIGN UP</legend><br><br>
		<table>
			<tr>
				<th colspan="3" style="text-align: center;">SignUp</th>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="id" id="id" placeholder="아이디를 입력하세요."></td>
				<td><button type="button" id="idCheck">Check</button></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="pw" id="pw1" placeholder="비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<td>PW CHECK</td>
				<td><input type="password" name="pw2" id="pw2" placeholder="비밀번호를 한번 더 입력하세요."></td>
				<td id="pwCheck"></td>
			</tr>
			<tr>
				<td>NAME</td>
				<td><input type="text" name="name" id="name" placeholder="이름을 입력하세요."></td>
			</tr>
			<tr>
				<td>PHONE NUM.</td>
				<td><input type="text" name="phone" id="phone" placeholder="전화번호를 입력하세요."></td>
			</tr>
			<tr>
				<td>EMAIL</td>
				<td><input type="text" name="email" id="email" placeholder="이메일을 입력하세요."></td>
			</tr>
			<tr>
				<td>CLASS</td>
				<td><select>
				<option>A</option>
				<option>B</option>
				<option>C</option>
				<option>D</option>
				<option>E</option>
				<option>F</option>
				</select></td>
			</tr>
			<tr>
				<td>POST NUM.</td>
				<td><input type="text" name="zipcode" id="zipcode" readonly></td>
				<td><button id="search">Search</button></td>
			</tr>
			<tr>
				<td>ADDRESS1</td>
				<td><input type="text" name="address1" id="address1"
					placeholder="주소를 입력하세요."></td>
			</tr>
			<tr>
				<td>ADDRESS2</td>
				<td><input type="text" name="address2" id="address2"
					placeholder="상세주소를 입력하세요."></td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;">
					<button type=submit id="signup">Sign Up</button>
					<button type=button id="reset">Reset</button>
				</td>
			</tr>
		</table>
 </fieldset>
</div>

	<script>
		var idValidFlag = false;

		$("#idCheck").on(
				"click",
				function() {
					window.open("/IdCheck.members?id=" + $("#id").val(), "",
							"width=350px, height=250px");
				});

		$("#id").on("change", function() {
			idValidFlag = false;
		})

		$("#pw2").on("keyup", function() { //비밀번호 일치여부 표시
			if ($("#pw2").val() == $("#pw1").val()) {
				$("#pwCheck").html("비밀번호가 일치합니다 :)").css("color", "dodgerblue");
			} else {
				$("#pwCheck").html("비밀번호가 일치하지 않습니다 :(").css("color", "red");
			}
		});

		document.getElementById("search").onclick = function() { //우편번호 API
			new daum.Postcode({
				oncomplete : function(data) {
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					document.getElementById("zipcode").value = data.zonecode;
					document.getElementById("address1").value = roadAddr;
				}
			}).open();
			return false;
		}

		$("#reset").on("click", function() { //다시입력 버튼 클릭 시 input창 reset
			$("input").val("");
		});

		$("#frm").on(
				"submit",
				function() {
					//입력 형식 제한
					var regexID = /^[a-z0-9_]{7,13}$/;
					var regexPW = /^[A-Za-z0-9]{7,13}$/;
					var regexName = /^[가-힣]+$/;
					var regexPhone = /^010[0-9]{8}$/;
					var regexEmail = /.+@.+\..+/;

					var id = $("#id").val();
					var pw1 = $("#pw1").val();
					var pw2 = $("#pw2").val();
					var name = $("#name").val();
					var phone = $("#phone").val();
					var email = $("#email").val();

					if (id == "" || pw1 == "" || pw2 == "" || name == ""
							|| phone == "" || email == "") { //필수항목 입력 여부 체크
						Swal.fire({
							icon : "error",
							title : "Oops...",
							text : "필수 항목을 모두 입력해주세요."
						});
						return false;
					}
					if (pw1 != pw2) { //패스워드 일치 여부 체크
						Swal.fire({
							icon : "error",
							title : "Oops...",
							text : "패스워드를 다시 확인해주세요"
						});
						return false;
					}

					// if (id=="") {
					//     Swal.fire({
					//         icon: "error",
					//         title: "Oops...",
					//         text: "아이디를 입력해주세요"
					//     });
					//     return false;
					// }
					// if(pw1==""||pw2==""){
					//     Swal.fire({
					//         icon: "error",
					//         title: "Oops...",
					//         text: "패스워드를 입력해주세요"
					//     });
					//     return false;
					// }
					// if(name==""){
					//     Swal.fire({
					//         icon: "error",
					//         title: "Oops...",
					//         text: "이름을 입력해주세요"
					//     });
					//     return false;
					// }
					// if(phone==""){
					//     Swal.fire({
					//         icon: "error",
					//         title: "Oops...",
					//         text: "전화번호를 입력해주세요"
					//     });
					//     return false;
					// }
					// if(email==""){
					//     Swal.fire({
					//         icon: "error",
					//         title: "Oops...",
					//         text: "이메일을 입력해주세요"
					//     });
					//     return false;
					// }

					//형식 제한 준수 여부 체크
					if (!regexID.test(id)) {
						Swal.fire({
							icon : "error",
							title : "ID 형식 오류",
							text : "7-13자의 알파벳 소문자, 숫자, _",
						});
						return false;
					}
					if (!regexPW.test(pw1)) {
						Swal.fire({
							icon : "error",
							title : "Password 형식 오류",
							text : "7-13자의 알파벳 대소문자, 숫자",
						});
						return false;
					}
					if (!regexName.test(name)) {
						Swal.fire({
							icon : "error",
							title : "NAME 형식 오류",
							text : "한글만 입력 가능",
						});
						return false;
					}
					if (!regexPhone.test(phone)) {
						Swal.fire({
							icon : "error",
							title : "PHONE 형식 오류",
							text : "- 제외 입력",
						});
						return false;
					}
					if (!regexEmail.test(email)) {
						Swal.fire({
							icon : "error",
							title : "EMAIL 형식 오류",
							text : "ID@address 형식으로 입력",
						});
						return false;
					}
				});
	</script>
</body>
</html>
