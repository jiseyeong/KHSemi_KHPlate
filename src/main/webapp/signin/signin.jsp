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
   <style>

            *{box-sizing: border-box;
                     }
            .container{
            width:1250px;
            height: 1300px;
            margin: auto;
            
        }
        .write{
            font-size: 20px;
        }

    </style> 


</head>
<body>
    <div class="container">
   
    <fieldset>
        <legend id="signup">SIGN UP</legend><br><br>
        <input type="text" placeholder="아이디를 입력" width=100 class="write"> <button>아이디 중복 확인</button><br><br>
        <input type="password" placeholder="비밀번호 입력" class="write"><br><br>
        <input type="password" placeholder="비밀번호 재확인" class="write"><br><br>
        <input type="text" placeholder="이름 입력" class="write"><br><br>
        <input type="text" placeholder="핸드폰 번호 입력" class="write"><br><br>
        <input type="text" placeholder="이메일 입력" class="write"><br><br>
        <select id="class">
            <option>클래스 선택</option>
            <option value="01">A</option>
            <option value="02">B</option>
            <option value="03">C</option>
            <option value="04">D</option>
            <option value="05">E</option>
            <option value="06">F</option>
            <option value="07">G</option>
            <option value="08">H</option>
           
        </select><br><br>
       
        <input type="text" placeholder="제목 입력" class="write"><br><br>
        <input type="text" placeholder="제목 입력" class="write"><br><br>

        
    </fieldset>
</div>
   
</body>
</html>