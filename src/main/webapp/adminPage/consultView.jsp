<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 상담</title>
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
</style>
</head>
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
                        <input type="text" value="${dto.category}" style="width:60%;" readonly>
                    </div>
                    <div class="title">
                        <label style="width:5%;">제목</label>
                        <input type="text" class="title" value="${dto.title}" style="width:95%;" readonly>
                    </div>
                    <div class="writer">
                        <label style="width: 20%;">작성자</label>
                        <input type="text" class="writer" value="${writer}" style="width:80%;" readonly>
                    </div>
                </div>
                <div style="overflow: hidden;">
                    <div style="text-align:center;">작성 내용</div>
                    <div class="left">
                        <div>
                            <img src="${image}" alt="${image}" id="image" class="previewImg">
                        </div>
                    </div>
                    <div class="right">
                        <div id="readEditor">${dto.body}</div>
                    </div>
                </div>
            </fieldset>

            <c:choose>
                <c:when test="${not empty replyDTO}">
                    <fieldset style="margin-bottom:50px;">
                        <legend>답글</legend>
                        <div style="overflow: hidden;">
                            <div class="title">
                                <label style="width:5%;">제목</label>
                                <input type="text" class="title" value="${replyDTO.title}" style="width:95%;" readonly>
                            </div>
                            <div class="writer">
                                <label style="width: 20%;">작성자</label>
                                <input type="text" class="writer" value="${replyWriter}" style="width:80%;" readonly>
                            </div>
                        </div>
                        <div style="overflow: hidden;">
                            <div style="text-align:center;">작성 내용</div>
                            <div id="readEditor2">${replyDTO.body}</div>
                            <script>
                                ClassicEditor
                                    .create(document.querySelector("#readEditor2"))
                                    .then(function (editor) {
                                        const toolbarElement = editor.ui.view.toolbar.element;
                                        toolbarElement.style.display = 'none';
                                        editor.enableReadOnlyMode('');
                                    })
                                    .catch(error => { console.error(error) });
                            </script>
                        </div>
                    </fieldset>
                </c:when>
                <c:otherwise>
                    <c:if test="sessionScope.loginIsAdmin">
                        <a href="/replyForm.consult?consultID=${dto.consultID}"><button type="button" id="btn_reply">답글달기</button></a>
                    </c:if>
                </c:otherwise>
            </c:choose>
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
    </script>
</body>
</html>