<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
    <title>비밀번호 재발급</title>
</head>

<style>
    * {
        box-sizing: border-box;
        margin: auto;
    }


    #container {
        width: 450px;
        height: 550px;
        border: solid black;
        border-width: 4px;
    }

    #pwwrite {
        font-size: 25px;
    }

    #next {
        font-size: 20px;
        border: none;
        background-color: white;
        font-weight: bold;

    }

    #reset {
        font-size: 20px;
        border: none;
        background-color: white;
        font-weight: bold;

    }

    table {
        width: 300px;
        height: 300px;
    }

    th {
        width: 300px;
        height: 100px;
    }



    #name {
        font-size: 20px;
        text-align: center;
        width: 100%;
        height: 100%;
    }

    #phone {
        font-size: 20px;
        text-align: center;
        width: 100%;
        height: 100%;
    }

    #id {
        font-size: 20px;
        text-align: center;
        width: 100%;
        height: 100%;
    }

    #pwCheck {
        height: 0%;
        border: none;
    }

    #pw1 {
        width: 100%;
        height: 100%;
        font-size: 20px;
        text-align: center;
    }


    #pw2 {
        width: 100%;
        height: 100%;
        font-size: 20px;
        text-align: center;
    }

    .btn {
        position: relative;
        top: 100px;
        left: 80px;
    }

    .pwclass {
        margin-top: 90px;
    }
</style>

<body>


    <form id="frm" action="" method="post">

        <div id="container">
            <table align="center">

                <tr>
                    <th colspan="2" id="pwwrite">비밀번호 재발급</th>
                </tr>
                <div class="pwclass">
                    <tr>

                        <td>
                            <input type="password" name="pw1" id="pw1" placeholder="새로운 비밀번호 입력">
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <input type="password" id="pw2" name="pw2" placeholder="비밀번호 다시 입력">

                        </td>
                    </tr>
                </div>
                <td id="pwCheck"></td>


                <tr>
                    <td colspan="2" align="center">

                        <div class="btn">
                            <button type=button id="reset">다시 입력</button>
                            <button type=submit id="next" name="next">확인</button>
                        </div>
                    </td>
                </tr>
        </div>
        </table>

    </form>


    <script>



        $("#reset").on("click", function () { //다시입력 버튼 클릭 시 input창 reset
            $("input").val("");
        });

        $("#pw2").on(
            "keyup",
            function () { //비밀번호 일치여부 표시
                if ($("#pw2").val() == $("#pw1").val()) {
                    $("#pwCheck").html("비밀번호가 일치합니다 :)").css("color",
                        "dodgerblue");
                } else {
                    $("#pwCheck").html("비밀번호를 확인하세요 :(").css("color",
                        "red", font - size);
                }
            });


        $("#frm").on(
            "submit",
            function () {
                //입력 형식 제한


                var regexPW = /^[A-Za-z0-9]{7,13}$/;


                var pw1 = $("#pw1").val();
                var pw2 = $("#pw2").val();


                if (pw2 == "") { //필수항목 입력 여부 체크
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "비밀번호를 입력해주세요."
                    });
                    return false;
                }
                if (pw1 != pw2) { //패스워드 일치 여부 체크
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "패스워드를 다시 확인해주세요"
                    });
                    return false;
                }


                //형식 제한 준수 여부 체크


                if (!regexPW.test(pw1)) {
                    Swal.fire({
                        icon: "error",
                        title: "Password 형식 오류",
                        text: "7-13자의 알파벳 대소문자, 숫자",
                    });
                    return false;
                }
            })
    </script>


</body>

</html>