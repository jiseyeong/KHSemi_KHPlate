<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ Register</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
<style>
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

    .inputHeader {
		float: left;
	    width: 20%;
	}

	.inputs {
		float: left;
		width: 80%;
	}
</style>
</head>
<body>
    <div class="container_noboot">
        <div class="sidebar">

        </div>
        <div class="body">
            <form action="register.faq" method="get">
                <fieldset>
                    <legend>FAQ 등록</legend>
                    <div class="inputHeader">제목 : </div>
                    <input type="text" class="inputs" name="title" placeholder="제목을 입력해주세요.">
                    <div>FAQ 내용</div>
                    <textarea name="body" id="editor"></textarea>
                </fieldset>
            </form>
        </div>
    </div>
    <script>
        ClassicEditor
            .create(document.querySelector("#editor"), {
                 toolbar: ['heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList', 'insertTable', 'blockQuote', 'undo', 'redo',]
            })
            .catch(error => { console.error(error) });
    </script>
</body>
</html>