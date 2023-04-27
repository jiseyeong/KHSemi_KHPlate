<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Register Form</title>

    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<style>

/* ==========================================================================
   #FONT
   ========================================================================== */
.font-robo {
  font-family: "Roboto", "Arial", "Helvetica Neue", sans-serif;
}

/* ==========================================================================
   #GRID
   ========================================================================== */
.row {
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-wrap: wrap;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
}

.row-space {
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
  -moz-box-pack: justify;
  -ms-flex-pack: justify;
 
}

.col-2 {
  width: -webkit-calc((100% - 60px) / 2);
  width: -moz-calc((100% - 60px) / 2);
  width: calc((100% - 60px) / 2);
}

@media (max-width: 767px) {
  .col-2 {
    width: 100%;
  }
}

/* ==========================================================================
   #BOX-SIZING
   ========================================================================== */
/**
 * More sensible default box-sizing:
 * css-tricks.com/inheriting-box-sizing-probably-slightly-better-best-practice
 */
html {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

* {
  padding: 0;
  margin: 0;
}

*, *:before, *:after {
  -webkit-box-sizing: inherit;
  -moz-box-sizing: inherit;
  box-sizing: inherit;
}

/* ==========================================================================
   #RESET
   ========================================================================== */
/**
 * A very simple reset that sits on top of Normalize.css.
 */
body,
h1, h2, h3, h4, h5, h6,
blockquote, p, pre,
dl, dd, ol, ul,
figure,
hr,
fieldset, legend {
  margin: 0;
  padding: 0;
}

/**
 * Remove trailing margins from nested lists.
 */
li > ol,
li > ul {
  margin-bottom: 0;
}

/**
 * Remove default table spacing.
 */
table {
  border-collapse: collapse;
  border-spacing: 0;
}

/**
 * 1. Reset Chrome and Firefox behaviour which sets a `min-width: min-content;`
 *    on fieldsets.
 */
fieldset {
  min-width: 0;
  /* [1] */
  border: 0;
}

button {
  outline: none;
  background: none;
  border: none;
}

/* ==========================================================================
   #PAGE WRAPPER
   ========================================================================== */
.page-wrapper {
  min-height: 100vh;
}

body {
  font-family: "Roboto", "Arial", "Helvetica Neue", sans-serif;
  font-weight: 400;
  font-size: 14px;
}

h1, h2, h3, h4, h5, h6 {
  font-weight: 400;
}

h1 {
  font-size: 36px;
}

h2 {
  font-size: 30px;
}

h3 {
  font-size: 24px;
}

h4 {
  font-size: 18px;
}

h5 {
  font-size: 15px;
}

h6 {
  font-size: 13px;
}

/* ==========================================================================
   #BACKGROUND
   ========================================================================== */

.bg-red {
  background: #ED1C16;
}

/* ==========================================================================
   #SPACING
   ========================================================================== */
.p-t-100 {
  padding-top: 100px;
}

.p-t-180 {
  padding-top: 180px;
}

.p-t-20 {
  padding-top: 20px;
}

.p-t-30 {
  padding-top: 30px;
}

.p-b-100 {
  padding-bottom: 100px;
}

/* ==========================================================================
   #WRAPPER
   ========================================================================== */
.wrapper {
  margin: 0 auto;
}

.wrapper--w960 {
  max-width: 960px;
}

.wrapper--w680 {
  max-width: 680px;
}

/* ==========================================================================
   #BUTTON
   ========================================================================== */
.btn {
  line-height: 40px;
  display: inline-block;
  padding: 0 25px;
  cursor: pointer;
  color: #fff;
  font-family: "Roboto", "Arial", "Helvetica Neue", sans-serif;
  -webkit-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  -moz-transition: all 0.4s ease;
  transition: all 0.4s ease;
  font-size: 14px;
  font-weight: 700;
}

.btn--radius {
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
}

.btn--green {
  background: #57b846;
}

.btn--green:hover {
  background: #4dae3c;
}


/* ==========================================================================
   #FORM
   ========================================================================== */
input {
  outline: none;
  margin: 0;
  border: none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
  width: 100%;
  font-size: 14px;
  font-family: inherit;
}

/* input group 1 */
/* end input group 1 */
.input-group {
  position: relative;
  margin-bottom: 30px;
  border-bottom: 1px solid #e5e5e5;
}

.input-icon {
  position: absolute;
  font-size: 18px;
  color: #ccc;
  right: 8px;
  top: 50%;
  -webkit-transform: translateY(-50%);
  -moz-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  -o-transform: translateY(-50%);
  transform: translateY(-50%);
  cursor: pointer;
}

.input--style-2 {
  padding: 9px 0;
  color: #666;
  font-size: 16px;
  font-weight: 500;
}

.input--style-2::-webkit-input-placeholder {
  /* WebKit, Blink, Edge */
  color: #808080;
}

.input--style-2:-moz-placeholder {
  /* Mozilla Firefox 4 to 18 */
  color: #808080;
  opacity: 1;
}

.input--style-2::-moz-placeholder {
  /* Mozilla Firefox 19+ */
  color: #808080;
  opacity: 1;
}

.input--style-2:-ms-input-placeholder {
  /* Internet Explorer 10-11 */
  color: #808080;
}

.input--style-2:-ms-input-placeholder {
  /* Microsoft Edge */
  color: #808080;
}

/* ==========================================================================
   #SELECT2
   ========================================================================== */
.select--no-search .select2-search {
  display: none !important;
}

.rs-select2 .select2-container {
  width: 100% !important;
  outline: none;
}

.rs-select2 .select2-container .select2-selection--single {
  outline: none;
  border: none;
  height: 36px;
}

.rs-select2 .select2-container .select2-selection--single .select2-selection__rendered {
  line-height: 36px;
  padding-left: 0;
  color: #808080;
  font-size: 16px;
  font-family: inherit;
  font-weight: 500;
}

.rs-select2 .select2-container .select2-selection--single .select2-selection__arrow {
  height: 34px;
  right: 4px;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
  -webkit-justify-content: center;
  -moz-box-pack: center;
  -ms-flex-pack: center;
  justify-content: center;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -moz-box-align: center;
  -ms-flex-align: center;
  align-items: center;
}

.rs-select2 .select2-container .select2-selection--single .select2-selection__arrow b {
  display: none;
}

.rs-select2 .select2-container .select2-selection--single .select2-selection__arrow:after {
  font-family: "Material-Design-Iconic-Font";
  content: '\f2f9';
  font-size: 18px;
  color: #ccc;
  -webkit-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  -moz-transition: all 0.4s ease;
  transition: all 0.4s ease;
}

.rs-select2 .select2-container.select2-container--open .select2-selection--single .select2-selection__arrow::after {
  -webkit-transform: rotate(-180deg);
  -moz-transform: rotate(-180deg);
  -ms-transform: rotate(-180deg);
  -o-transform: rotate(-180deg);
  transform: rotate(-180deg);
}

.select2-container--open .select2-dropdown--below {
  border: none;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  border: 1px solid #e0e0e0;
  margin-top: 5px;
  overflow: hidden;
}

/* ==========================================================================
   #TITLE
   ========================================================================== */

.title {
  text-transform: uppercase;
  font-weight: 700;
  margin-bottom: 35px;
}

/* ==========================================================================
   #CARD
   ========================================================================== */
.card {
  overflow: hidden;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  background: #fff;
}

.card-2 {
  -webkit-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  width: 100%;
  display: table;
}

.card-2 .card-heading {
  background: url("https://t4.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/6xp/image/S8Yex9htG67CcWaAbhU6Fy1w4qo.jpg") top left/cover no-repeat;
  width: 29%;
  display: table-cell;
}

.card-2 .card-body {
  display: table-cell;
  padding: 70px 80px;
  padding-bottom: 88px;
}

@media (max-width: 767px) {
  .card-2 {
    display: block;
  }
  .card-2 .card-heading {
    width: 100%;
    display: block;
    padding-top: 300px;
    background-position: left center;
  }
  .card-2 .card-body {
    display: block;
    padding: 60px 50px;
  }
}

#eyes {
    cursor: pointer;
    z-index: 5;
}

#naverIdLogin {
            width: 215px;
            height: 55px;
            background-color: rgb(3, 199, 90);
            font-size: 18px;
        }



        a {
            text-decoration: none;
        }

        #searchid {
            color: black;
        }

        #searchid.hover {
            color: #ED1C16;
        }

        #searchpw {
            color: black;
        }

        #searchpw.hover {
            color: #ED1C16;
        }

        #signup {
            color: black;
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
            font-size: 18px;
        }   */
        .NaverLogin img {
            width: 215px;
            height: 55px;

        }

        #kakaobtn2 img{
            width: 220px;
            height: 57px;
        }
/* 
        #KakaoLogin {
            width: 248px;
            height: 50px;
            background-color: #FEE500;
            color: black;
            border-radius: 12px;
            font-size: 18px;
        } */
    
</style>
<body>
    <body>
        <div class="page-wrapper bg-red p-t-180 p-b-100 font-robo">
            <div class="wrapper wrapper--w960">
                <div class="card card-2">
                    <div class="card-heading"></div>
                    <div class="card-body">
                        <h2 class="title">로그인</h2>
                        <form class="frm" method="POST">
                
                            <div class="input-group" id="inputid">ID: 
                                <input class="input--style-2" type="text" placeholder="아이디" id="id" name="id" placeholder="아이디를 입력해주세요."> 
                            </div>

                             <div class="input-group" id="inputpw">PW: 
                                <input class="input--style-2" type="text" placeholder="비밀번호" id="pw" name="pw" placeholder="비밀번호를 입력해주세요."> 
                                <i class="fa fa-eye fa-lg" id="eyes"></i>
                            </div>
                       

                            <div class="row row-space">
                                <div class="col-2">
                                    <div class="input-wrap">
                                    <input type="checkbox" id="checkId" name="checkId">
                                    <label for="checkId"></label>
                                </div>
                                  </div>
                                <div id="idsave">아이디 저장</div>
</div>

                               
                                    
                                       
<div class="row row-space">
    <div class="col-3"> 
    <div class="p-t-30">
       <button class="btn btn--radius btn--green" id="loginbutton">ENTER!</button>
    </div>
</div>
<div class="col-3">
    <div class="p-t-30">
    <button class="btn btn--radius btn--green" id="idCheck">네이버로그인</button>
</div>
</div>
<div class="col-3">
    <div class="p-t-30">
    <button class="btn btn--radius btn--green" id="idCheck">카카오로그인</button>
</div>
</div>
</div>
                       
                            
                        

                            <br>

                            <!-- <div class="login-area">
                                <div id="button_area"> 
                            <div id="naverIdLogin"></div>
                           </div>
                            </div> -->
                            <!-- <img id="NaverLogin" src="naver.png" style="width:100px; height:100px;" margin=100px> -->
                           <!-- <div class="NaverLogin"><img src="naver2.png"></div>   -->
                            <!-- <button name="KakaoLI" id="KakaoLogin">Kakao Login</button> -->
            
            
                          <!--  <div id ="kakaobtn2" onclick="kakaoLogin();">
                                <a href="javascript:void(0)">
                                        <span><img src="kakao.png"></span>    
                                </a>
                            </div> -->
            
                  
                            <div class="row row-space">
                                <div class="col-3"> 
                                    <div class="input-group" id="searchid">
                                        <a href="https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=0&acr=1&acq=%EC%84%9D%EA%B3%84+%EB%A7%A4%EC%9A%B4&qdt=0&ie=utf8&query=%EC%84%9D%EA%B3%84+%EB%A7%A4%EC%9A%B4%EC%A1%B1%EB%B0%9C">아이디
                                            찾기</a>
                                    </div>
                            </div>
                            <div class="col-3"> 
                                <div class="input-group" id="searchpw">
                                    <a href="http://www.naver.com">비밀번호 찾기</a>
                                </div>
                        </div>
                        <div class="col-3"> 
                            <div class="input-group" id="signup">
                                <a href="/signup.html">회원 가입</a>
                            </div>
                    </div>
                </div>
            
            
                        <!-- <a href="http://www.daum.net">
                            <img src="kakao.png" width="100%" height="100%">
                        </a> -->
            
                       
                         
                       
            
            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    
        <!-- Jquery JS-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <!-- Vendor JS-->
        <script src="vendor/select2/select2.min.js"></script>
        <script src="vendor/datepicker/moment.min.js"></script>
        <script src="vendor/datepicker/daterangepicker.js"></script>
    
        <!-- Main JS-->
        <script src="js/global.js"></script>
    
        <script>

            $(function () {
                // 눈표시 클릭 시 패스워드 보이기
                $('#eyes').on('click', function () {
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










      