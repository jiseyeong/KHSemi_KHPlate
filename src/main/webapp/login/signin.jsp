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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <!--CDN 링크 -->

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background-color: #f5f6f7;
            line-height: 1.5em;
            color: #222;
        }

        #login {
            font-size: 40px;
            font-weight: bold;
        }

        #inputid {
            font-size: 28px;
            margin-top: 135px;
            margin-left: 67px;
        }

        #id {
            position: absolute;
            width: 450px;
            left: 150px;
            height: 44px;
            text-align: center;
            top: 188px;
            left: 205px;
        }

        #inputpw {
            font-size: 28px;
            margin-top: 50px;
            margin-left: 50px;
        }

        #password {
            width: 450px;
            position: absolute;
            margin-top: -32px;
            left: 205px;
            height: 44px;
            text-align: center;

        }

        .eyes {
            cursor: pointer;
            margin-left: 565px;
            margin-top: -22px;
            position: absolute;
            z-index: 5;
        }

        input::-webkit-input-placeholder {
            color: black;
            font-style: italic;
            font-size: 1.3em;
        }

        #fildset {
            margin: 30px;
        }

        #idsave {
            font-size: 15px;
            margin-left: 180px;
            margin-top: -23px;
        }

        #checkId {
            margin-left: 155px;
            margin-top: 40px;
            cursor: pointer;
        }

        #loginbutton {
            width: 430px;
            height: 60px;
            background-color: black;
            border-radius: 12px;
            cursor: pointer;
            color: white;
            margin-left: 620px;
            margin-top: 55px;
            font-size: 30px;
        }

        #loginbutton.hover {
            background-color: #ED1C16;
        }




        #naverIdLogin {
            width: 215px;
            height: 55px;
            background-color: rgb(3, 199, 90);

            position: relative;
            top: 18px;

            cursor: pointer;
            margin-left: 620px;
            margin-top: 30px;
            font-size: 18px;
        }



        a {
            text-decoration: none;
        }

        #searchid {
            color: black;
            margin-left: 660px;
            margin-top: 150px;
        }

        #searchid.hover {
            color: #ED1C16;
        }

        #searchpw {
            color: black;
            margin-left: 860px;
            margin-top: -25px;
        }

        #searchpw.hover {
            color: #ED1C16;
        }

        #signup {
            color: black;
            margin-left: 1070px;
            margin-top: -24px;
        }

        #signup.hover {
            color: #ED1C16;
        }

        #naverIdLogin img {
            width: 100%;
            height: 100%;
            opacity: 0;
        }

        #naverIdLogin {
            background-color: #ED1C1600;
        }


        /* #NaverLogin {
            width: 248px;
            height: 50px;
            background-color: rgb(3, 199, 90);
            color: white;
            border-radius: 12px;
            cursor: pointer;
            margin-left: 700px;
            margin-top: 10px;
            font-size: 18px;
        }   */
        .NaverLogin img {
            width: 215px;
            height: 55px;
            margin-top: -80px;
            margin-left: 620px;

        }

        #kakaobtn2 img{
            width: 220px;
            height: 57px;
            margin-left: 837px;
            margin-top: -83px;
            position: relative;
            top:-23px;
        }
/* 
        #KakaoLogin {
            width: 248px;
            height: 50px;
            background-color: #FEE500;
            color: black;
            border-radius: 12px;
            cursor: pointer;
            margin-left: 0px;
            margin-top: -50px;
            font-size: 18px;
        } */
    </style>
</head>

<body>

    <div class="container">
        <form action="" id="loginForm">

            <fieldset id="fildset">
                <legend>
                    <div id="login">LOGIN</div>
                </legend>
                <div id="inputid">ID : <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요."> </div>
                <div class="input password">
                    <label for="password" class="label password"></label>
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


                <button name="loginbutton" id="loginbutton">로그인</button>
                <br>
                <!-- <div class="login-area">
                    <div id="button_area"> -->
                <div id="naverIdLogin"></div>
                <!-- </div>
                </div> -->
                <!-- <img id="NaverLogin" src="naver.png" style="width:100px; height:100px;" margin=100px> -->
                <div class="NaverLogin"><img src="naver2.png"></div>
                <!-- <button name="KakaoLI" id="KakaoLogin">Kakao Login</button> -->


                <div id ="kakaobtn2" onclick="kakaoLogin();">
                    <a href="javascript:void(0)">
                        <span><img src="kakao.png"></span>
                    </a>
                </div>

            </fieldset>

            <div id="searchid"><a
                    href="https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=0&acr=1&acq=%EC%84%9D%EA%B3%84+%EB%A7%A4%EC%9A%B4&qdt=0&ie=utf8&query=%EC%84%9D%EA%B3%84+%EB%A7%A4%EC%9A%B4%EC%A1%B1%EB%B0%9C">아이디
                    찾기</a></div>
            <div id="searchpw"><a href="http://www.naver.com">비밀번호 찾기</a></div>
            <div id="signup"><a href="/signup.html">회원 가입</a></div>


            <!-- <a href="http://www.daum.net">
                <img src="kakao.png" width="100%" height="100%">
            </a> -->

           
             
           

        </form>
    </div>
    <script>

        $(function () {
            // 눈표시 클릭 시 패스워드 보이기
            $('.eyes').on('click', function () {
                $('.input.password').toggleClass('active');

                if ($('.input.password').hasClass('active') == true) {
                    $(this).find('.fa-eye').attr('class', "fa fa-eye-slash fa-lg").parents('.input').find('#password').attr('type', "text");
                    // i 클래스                // 텍스트 보이기 i 클래스
                }
                else {
                    $(this).find('.fa-eye-slash').attr('class', "fa fa-eye fa-lg").parents('.input').find('#password').attr('type', 'password');
                }
            });
        });

        //
        $(document).ready(function () {
            // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
            var key = getCookie("key");
            $("#id").val(key);

            // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
            if ($("#id").val() != "") {
                $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
            }
        })
        $("#checkId").change(function () { // 체크박스에 변화가 있다면,
            if ($("#checkId").is(":checked")) { // ID 저장하기 체크했을 때,
                setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
            } else { // ID 저장하기 체크 해제 시,
                deleteCookie("key");
            }
        });

        // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
        $("#id").keyup(function () { // ID 입력 칸에 ID를 입력할 때,
            if ($("#checkId").is(":checked")) { // ID 저장하기를 체크한 상태라면,
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








        //naver
        const naverLogin = new naver.LoginWithNaverId(
            {
                clientId: "Mm9YQgxstdSEuf5xt0jg",
                callbackUrl: "http://127.0.0.1:8090/naver-login",
                loginButton: { color: "green", type: 2, height: 40 }
            }
        );
        naverLogin.init(); // 로그인 설정

        naverLogin.getLoginStatus(function (status) {
            if (status) {
                const nickName = naverLogin.user.getNickName();
                const age = naverLogin.user.getAge();
                const birthday = naverLogin.user.getBirthday();

                //닉네임을 선택하지 않으면 선택창으로 돌아갑니다.
                if (nickName === null || nickName === undefined) {
                    alert("별명이 필요합니다. 정보제공을 동의해주세요.");
                    naverLogin.reprompt();
                    return;
                } else {
                    setLoginStatus(); //모든 필수 정보 제공 동의하면 실행하는 함수
                }
            }
        });
        naverLogin.init(); // 로그인 설정


        //kakao

        Kakao.init('25e12e36964674d52a9931b02d3b7cc1'); //발급받은 키 중 javascript키를 사용해준다.
        console.log(Kakao.isInitialized());               // sdk초기화여부판단

        //카카오로그인
        function kakaoLogin() {
            Kakao.Auth.login({
                success: function (response) {
                    Kakao.API.request({
                        url: '/v2/user/me',
                        success: function (response) {
                            console.log(response)
                        },
                        fail: function (error) {
                            console.log(error)
                        },
                    })
                },
                fail: function (error) {
                    console.log(error)
                },
            })
        }


    </script>
</body>

</html>