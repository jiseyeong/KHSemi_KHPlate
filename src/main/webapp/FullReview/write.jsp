<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.ck-editor__editable_inline {
	min-height: 400px;
}

input {
	border: none;
	border-radius: 10px;
	background-color: #ffffff00;
}

input:focus {
	outline: none !important;
}

textarea {
	border: none;
}

.re_List_Container {
	height: 100px;
}

.reviewBody {
	width: 100%;
	height: 100%;
}

.bodyBox {
	width: 100%;
}

.title {
	width: 600px;
}

.btn-outline-secondary{
	width: 100px;
	height: 40px;
	background-color: #57b846;
	border-radius: 12px;
	cursor: pointer;
	border: none;
	color: white;
	font-size: 14px;
	box-shadow: 1px 1px 5px 1px rgb(231, 231, 231);
}

.submitBtn {
	float: right;
	width: 100px;
	height: 40px;
	background-color: #57b846;
	border-radius: 12px;
	cursor: pointer;
	border: none;
	color: white;
	font-size: 14px;
	box-shadow: 1px 1px 5px 1px rgb(231, 231, 231);
}

.score {
	margin-left: 25px;
	margin-right: 25px;
}
</style>

</head>
<body>
	<div class="container">
		<form action="/write.fullreview" method="post" id="frm"
			enctype="multipart/form-data">
			<input type="text" placeholder="제목란" class="title" name="title">

			<hr style="border-style: dotted;">

			<input type="text" class="userId" name="userId"
				value="${sessionScope.userId}" readonly> <input type="text"
				class="userNo" name="userNo" value="${sessionScope.userno}"
				style="display: none">

			<hr style="border-style: dotted;">

			<select id="storeId" class="storeId" name="storeId">
				<option selected>음식점</option>
				<c:forEach items="${store }" var="i" varStatus="status">
					<option value="${i.storeID }">${i.name }</option>
				</c:forEach>
			</select> <input type="text" placeholder="별점" class="score" name="score">
			<div class="void">
				<br>
			</div>
			<div class="storeId" name="storeId"></div>
			<div class="bodyBox">
				<textarea class="reviewBody" name="reviewBody" id="editor"></textarea>
			</div>
			<br>
			

			<div class="col-12">
				<button type="button" id="btn_image_add"
					class="btn-outline-secondary">이미지 등록</button>
			</div>
			<div class="col-12">
				<!-- 여기에 name이 image0, image1 식의 name으로 file input 추가됨. 보내기 직전 name 태그 붙이기 시작. -->
				<div id="img_field"></div>
				<!-- <input type="text" name="imgLength" style="display: none;"> -->
			</div>


			<br>
			<div>
				<button class="submitBtn" type="submit">작성완료</button>
			</div>
		</form>
	</div>

	<script>
	ClassicEditor
	.create(document.querySelector("#editor"), {
		 toolbar: ['heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList', 'insertTable', 'blockQuote', 'undo', 'redo',]
	})
	.catch(error => { console.error(error) });
	
	$("#frm").on("submit",function(){
		let imgForms = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
		if ($(".userId").val()==null){
			alert("로그인 후 작성 가능합니다.")
			return false;
		}else if ($(".title").val()==null){
			alert("제목을 입력해 주세요.")
			return false;
		}else if ($(".storeId").val()==null){
			alert("음식점을 입력해 주세요.")
			return false;
		}else if ($(".score").val()==null){
			alert("별점을 입력해 주세요.")
			return false;
		}
	})
	
	$("#input_image").change(function(){
						let input = document.getElementById("input_image");
						let fReader = new FileReader();
						fReader.onload = function(e){
							$("#image").attr("src", e.target.result);
						}
						fReader.readAsDataURL(input.files[0]);
						$("#image").css("display","block");
					});
	
	let imgs = [];
    let imgs_length = 4;
    let imgForms = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
    $("#btn_image_add").click(function () {
        if (imgs.length < imgs_length) {
            let div = $("<div>"),
                fileInput = $("<input type='file' accept='image/*'>"),
                btn_cancel = $("<button>");
            div.addClass("input-group");
            fileInput.addClass("form-control");
            btn_cancel.addClass("btn");
            btn_cancel.addClass("btn-outline-secondary")
            btn_cancel.append("x");
            div.append(fileInput, btn_cancel);
            $("#img_field").append(div);
            imgs.push(div);

            btn_cancel.click(function () {
                imgs.splice(imgs.indexOf(div), 1);
                div.remove();
            });
        }
    });
	
	</script>


</body>
</html>