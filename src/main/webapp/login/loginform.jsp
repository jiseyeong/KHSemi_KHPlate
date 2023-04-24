<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

   <style>


    *{box-sizing: border-box;}
   
    body{
        background-color: #f5f6f7;
        line-height: 1.5em;
        color : #222;
    }
    #login{
        font-size: 40px;
        font-weight: bold;
        
    }
    #inputid{
        font-size: 28px;
        
        margin-top: 100px;
        margin-left: 67px;
    }
   
    #id{
        position: absolute;
        width: 250px;
        left:150px;
        height: 47px;
        text-align: center;
        top:250px;
        left:290px;
    }
    #inputpw{
        font-size: 28px;
        margin-top: 50px;
        margin-left: 50px;
    }
    #password{
        width: 430px;
        position: absolute;
        margin-top: -32px;
        left:290px;
        height: 40px;
        text-align: center;

    }

    .eyes {
        cursor: pointer;
        margin-left: 530px;
        margin-top: -25px;
        position: absolute;
        z-index: 5;
    }
    input::-webkit-input-placeholder {
        color: black;
        font-style:italic;
        font-size: 1.3em;
        }
        #fildset{
            margin: 130px;
        }
        #idsave{
            font-size: 15px;
            margin-left: 165px;
            margin-top: -23px;
        }
        #checkId{
            margin-left: 140px;
            margin-top: 40px;
            cursor: pointer;
        }
        #loginbutton{
            width: 400px;
            height: 50px;
            background-color: black;
            cursor: pointer;
            color: whitesmoke;
            margin-left: 480px;
            margin-top: 100px;


        }
        a{
            text-decoration: none;
        }

        #searchid{
            color: beige;
            margin-left: 650px;
            margin-top: 200px;
        }
        #searchpw{
            color: antiquewhite;
            margin-left: 800px;
            margin-top: -25px;}
        #signup{
            color: black;
            margin-left: 980px;
            margin-top : -24px;
        }
   </style>
</head>
<body>

    <div class="container">
        <form action="" id="loginForm">

        <fieldset id="fildset">
            <legend>
            <div id="login">LOGIN</div>
            </legend>
                 <div id="inputid">ID : <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요." > </div>
                 <div class="input password">
                    <label for="password" class="label password" ></label>
                    <div id="inputpw">PW :</div>
                    <input type="password" id="password" class="form-input" placeholder="비밀번호를 입력해주세요.">
                    <div class="eyes">
                        <i class="fa fa-eye fa-lg"></i>
                    </div>
                  </div>
                  
                  <div class="box">
                    <span class="input-wrap">
                      <input type="checkbox" id="checkId" name="checkId">                                         
                      <label for="checkId"><span></span></label>
                    </span>
                    <div id="idsave">아이디 저장</div>
                  </div>

                  	<tr>
						<td colspan="2" align="center">
						<input type="button" name="loginbutton" id="loginbutton" value="로그인"><br>
					</tr>
					<tr>
						<td align="center">
						<input type="button" name="NaverLI" id="NaverLI" value="Naver Login"> 
						<input type="button" name="KakaoLI" id="KakaoLI" value="Kakao Login"></td>
					</tr>
                  
        </fieldset>
        
        <div id="searchid"><a href="https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=0&acr=1&acq=%EC%84%9D%EA%B3%84+%EB%A7%A4%EC%9A%B4&qdt=0&ie=utf8&query=%EC%84%9D%EA%B3%84+%EB%A7%A4%EC%9A%B4%EC%A1%B1%EB%B0%9C">아이디 찾기</a></div>
        <div id="searchpw"><a href="http://www.naver.com">비밀번호 찾기</a></div>
        <div id="signup"><a href="http://www.naver.com">회원 가입</a></div>


    </form>
    </div>
<script>

$(function(){
  // 눈표시 클릭 시 패스워드 보이기
  $('.eyes').on('click',function(){
    $('.input.password').toggleClass('active');

    if( $('.input.password').hasClass('active') == true ){
    	$(this).find('.fa-eye').attr('class',"fa fa-eye-slash fa-lg").parents('.input').find('#password').attr('type',"text");
    				// i 클래스                // 텍스트 보이기 i 클래스
    }
    else{
    	$(this).find('.fa-eye-slash').attr('class',"fa fa-eye fa-lg").parents('.input').find('#password').attr('type','password');
    }
  });
});



//
$(document).ready(function(){
		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#id").val(key); 
	     
	    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	    if($("#id").val() != ""){ 
	        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
    })
	    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });

	// 쿠키 저장하기 
	// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	// 쿠키 삭제
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}
     
	// 쿠키 가져오기
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) { // 쿠키가 존재하면
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
				end = cookieData.length;
                console.log("end위치  : " + end);
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}

	//네이버 간편 로그인
	$("#NaverLI").on("click", function() {
		location.href = "/login.naverlogin.jsp"
	});
	
	// 카카오 간편 로그인
	$("#KakaoLI").on("click", function() {
		location.href = "/login.kakaologin.html"
	});


</script>
</body>
</html>