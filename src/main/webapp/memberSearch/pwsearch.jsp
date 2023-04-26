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
    <title>비밀번호 찾기</title>
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
        border-width: 2px;
    }

    #searchpw {
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

    .input {
        margin-top: 90px;
    }

    .input2 {
        position: relative;
        top: 100px;
        left: 80px;
    }
</style>

<body>

    <div id="container">
        <form id="frm" action="" method="post">

            <div id="container">
                <table align="center">

                    <tr>
                        <th colspan="3" id="searchpw">비밀번호 찾기</th>
                    </tr>

                    <div class="input">
                        <tr>

                            <td>
                                <input type="text" name="name" id="name" placeholder="이름 입력">
                            </td>
                        </tr>
                        <tr>

                            <td>
                                <input type="text" id="id" name="id" placeholder="아이디 입력">
                            </td>
                        </tr>
                        <tr>

                            <td>
                                <input type="text" id="phone" name="phone" placeholder="핸드폰번호 입력">
                            </td>
                        </tr>
                    </div>
                    <tr>
                        <td colspan="2" align="center">

                            <div class="input2">
                                <button type=button id="reset">다시 입력</button>
                                <button type=submit id="next" name="next">다음</button>
                            </div>
                        </td>
                    </tr>
            </div>
            </table>

        </form>
    </div>

    <script>



        $("#reset").on("click", function () { //다시입력 버튼 클릭 시 input창 reset
            $("input").val("");
        });

        $("#frm").on(
            "submit",
            function () {
                //입력 형식 제한
                var regexID = /^[a-z0-9_]{7,13}$/;
                var regexPW = /^[A-Za-z0-9]{7,13}$/;
                var regexName = /^[가-힣]+$/;
                var regexPhone = /^010[0-9]{8}$/;


                var id = $("#id").val();
                var pw1 = $("#pw1").val();
                var name = $("#name").val();
                var phone = $("#phone").val();



                if (id == "" || name == ""
                    || phone == "") { //필수항목 입력 여부 체크
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "필수 항목을 모두 입력해주세요."
                    });
                    return false;
                }



                //형식 제한 준수 여부 체크
                if (!regexID.test(id)) {
                    Swal.fire({
                        icon: "error",
                        title: "ID 형식 오류",
                        text: "7-13자의 알파벳 소문자, 숫자, _",
                    });
                    return false;
                }

                if (!regexName.test(name)) {
                    Swal.fire({
                        icon: "error",
                        title: "NAME 형식 오류",
                        text: "한글만 입력 가능",
                    });
                    return false;
                }
                if (!regexPhone.test(phone)) {
                    Swal.fire({
                        icon: "error",
                        title: "PHONE 형식 오류",
                        text: "핸드폰 번호 다시 확인",
                    });
                    return false;
                }
            })
    </script>


</body>

</html>