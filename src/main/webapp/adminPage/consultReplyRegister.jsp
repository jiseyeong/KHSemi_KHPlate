<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 상담 답변 등록</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
</head>
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
    .previewImg{
    	width:100%;
        object-fit: contain;
    }
    .category {
        width:15%;
        margin-right:10%;
        float:left;
    }
    .category>label,.title>label,.writer>label{
        float:left;
    }
    .category>input,.title>input,.writer>input{
        float:left;
    }
    .title {
        width:75%;
        float:left;
    }
    .writer {
        width:25%;
    }
    #toList {
	    width: 250px;
	    height: 50px;
	    background-color: black;
	    border-radius: 12px;
	    cursor: pointer;
	    color: white;
	    margin-left: 700px;
	    margin-top: 55px;
	    font-size: 20px;
    }

    #submitBtn {
	    width: 250px;
	    height: 50px;
	    background-color: black;
	    border-radius: 12px;
	    cursor: pointer;
	    color: white;
	    margin-left: 900px;
	    margin-top: 55px;
	    font-size: 20px;
    }
</style>
<body>
	<div class="container_noboot">
        <div class="sidebar">

        </div>
        <div class="body">
        	<fieldset style="margin-bottom:50px;">
                <legend>대상 고객 글</legend>
                <div style="overflow: hidden;">
                    <div class="category">
                        <label style="width:40%;">카테고리</label>
                        <input type="text" value="${parentDTO.category}" style="width:60%;" readonly>
                    </div>
                    <div class="title">
                        <label style="width:5%;">제목</label>
                        <input type="text" class="title" value="${parentDTO.title}" style="width:95%;" readonly>
                    </div>
                    <div class="writer">
                        <label style="width: 20%;">작성자</label>
                        <input type="text" class="writer" value="${parentWriter}" style="width:80%;" readonly>
                    </div>
                </div>
                <div style="overflow: hidden;">
                	<div style="text-align:center;">작성 내용</div>
                	<div class="left">
                        <div>
                            <img src="${parentImage}" alt="${parentImage}" id="image" class="previewImg">
                        </div>
                    </div>
                    <div class="right">
                       <div id="readEditor">${parentDTO.body}</div>
                    </div>
                </div>
        	</fieldset>
            
            <form>
                <fieldset>
                    <legend>답변 등록</legend>
                    <input type="text" name="writer" value="${sessionScope.loginID}" style="display:none;">
                    <input type="text" name="consultID" value="${parentDTO.consultID}" style="display:none;">
                    <div style="width:100%">
                        <label style="width:5%; float:left;">제목</label>
                        <input type="text" class="title" name="title" placeholder="제목을 입력해주세요." style="flaot:left; width:95%;">
                    </div>
                    <div>
                        <textarea name="body" id="editor"></textarea>
                    </div>
                    </div>
                </fieldset>
                <div style="text-align:center;">
                	<button type="submit">submit</button>
                </div>
            </form>
        </div>
    </div>
    
    <script>
    	ClassicEditor
    		.create(document.querySelector("#readEditor"))
    		.then(function (editor) {
        		const toolbarElement = editor.ui.view.toolbar.element;
                toolbarElement.style.display = 'none';
        		editor.enableReadOnlyMode('');
    		})
    		.catch(error => { console.error(error) });

        ClassicEditor
            .create(document.querySelector("#editor"), {
                 toolbar: ['heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList', 'insertTable', 'blockQuote', 'undo', 'redo',]
            })
            .catch(error => { console.error(error) });
    </script>
</body>
</html>