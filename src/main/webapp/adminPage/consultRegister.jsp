<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1상담 등록</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
<style>
    *{
        box-sizing: border-box;
    }
    .container_noboot {
        margin-left: 0;
        margin-right: 0;
        max-width: 1920px;
    }

    .sidebar {
        width: 500px;
    }

    .body {
        width: 1420px;
    }

    select.category {
        width:15%;
        margin-right:10%;
        float:left;
    }

    input.title {
        width:75%;
        float:left;
    }

    .left{
        width:20%;
        margin-right:5%;
        float:left;
        text-align: center;
    }
    .right{
        width:75%;
        float:left;
    }
</style>
</head>
<body>
    <div class="container_noboot">
        <div class="sidebar">

        </div>
        <div class="body">
            <form id="myForm" action="" method="post" enctype="multipart/form-data">
                <fieldset>
                    <legend>Customer Service Page</legend>
                    <div style="overflow: hidden;">
                        <select class="category">
                            <option>문의</option>
                            <option>신고</option>
                            <option>건의</option>
                        </select>
                        <input type="text" name="title" class="title" placeholder="제목을 입력해주세요.">
                    </div>
                    <div style="overflow:hidden;">
                        <div class="left">
                            <div>
                                <img src="#none" alt="#none" id="image">
                            </div>
                            <div>
                                <input id="input_image" name="img" type='file' accept='image/*'>
                            </div>
                        </div>
                        <div class="right">
                            <textarea name="body" id="editor"></textarea>
                        </div>
                    </div>
                </fieldset>
                <div style="text-align:center">
                	<button>Submit</button>
                </div>
            </form>
        </div>
        <script>
            ClassicEditor
            .create(document.querySelector("#editor"), {
                 toolbar: ['heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList', 'insertTable', 'blockQuote', 'undo', 'redo',]
            })
            .catch(error => { console.error(error) });

            $("#myForm").submit(function(){
                let imgForms = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
                if (!$("#input_image").val().match(imgForms)) {
                    alert("이미지 파일만 업로드 가능합니다.");
                    return false;
                }
            });
            $("#input_image").change(function(){
                let input = document.getElementById("input_image");
                let fReader = new FileReader();
                fReader.onload = function(e){
                	$("#image").attr("src", e.target.result);
                }
                fReader.readAsDataURL(input.file[0]);
            });
        </script>
</body>
</html>