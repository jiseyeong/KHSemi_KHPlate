<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 보기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/octicons/3.3.0/octicons.min.css"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>

<style>
/* 헤더 및 sideBar 부분 스타일 - 건들지 말것 */
* {
	box-sizing: border-box;
	padding: 0px;
}

.body {
	margin: auto;
}

.sideList {
	border: 1px solid black;
}

/* 하단부터 메인부분 스타일 작성 요망 */
</style>
</head>
<body>
	<div class="container-fluid themed-container m-0 g-0">
		<!-- 헤더부분 건들지 말것 -->
		<jsp:include page="/page/header.jsp" flush="false"></jsp:include>



		<!-- body 부분 row div 건들지 말것 -->
		<div class="row g-0 justify-content-center body">
			<!-- sideBar부분 건들지 말것 -->
			<jsp:include page="/page/sideBar.jsp" flush="false"></jsp:include>

			<div class="col-12 col-lg-9 g-0 themed-grid-col bodyContents">
				<!-- Main 내용 부분 하단부터 수정 요망 -->
				<div class="row">
					<div class="col-12">
						<div class="accordion" id="accordionFAQ">
							<c:choose>
								<c:when test="${fn:length(list) > 0}">
									<c:forEach var="i" begin="0" end="${fn:length(list)-1}" step="1">
										<div class="accordion-item">
											<h2 class="accordion-header" id="heading${i}">
												<button class="accordion-button bg-light text-dark" type="button"
													data-bs-toggle="collapse" data-bs-target="#collapse${i}"
													aria-expanded="true" aria-controls="collapse${i}">
													${list.get(i).title}</button>
											</h2>
											<div id="collapse${i}" class="accordion-collapse collapse show"
												aria-labelledby="heading${i}" data-bs-parent="#accordionFAQ">
												<div class="accordion-body">
													<div id="editor${i}">${list.get(i).body}</div>
													<script>
														let i = "<c:out value='${i}'></c:out>"
														ClassicEditor
															.create(document.querySelector("#editor" + i), {
																toolbar: ['heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList', 'insertTable', 'blockQuote', 'undo', 'redo',]
															})
															.then(function (editor) {
																const toolbarElement = editor.ui.view.toolbar.element;
																editor.on('change:isReadOnly', (evt, propertyName, isReadOnly) => {
																	if (isReadOnly) {
																		toolbarElement.style.display = 'none';
																	} else {
																		toolbarElement.style.display = 'flex';
																	}
																});
																editor.enableReadOnlyMode('');
															})
															.catch(error => { console.error(error) });
													</script>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="accordion-item">
										<h2 class="accordion-header" id="headingOne">
											<button class="accordion-button bg-light text-dark" type="button" data-bs-toggle="collapse"
												data-bs-target="#collapseOne" aria-expanded="true"
												aria-controls="collapseOne">FAQ
												#1</button>
										</h2>
										<div id="collapseOne" class="accordion-collapse collapse show"
											aria-labelledby="headingOne" data-bs-parent="#accordionFAQ">
											<div class="accordion-body">
												<div id="editor">등록된 FAQ가 없습니다.</div>
												<script>
													ClassicEditor
														.create(document.querySelector("#editor"), {
															toolbar: ['heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList', 'insertTable', 'blockQuote', 'undo', 'redo',]
														})
														.then(function (editor) {
															const toolbarElement = editor.ui.view.toolbar.element;
															editor.on('change:isReadOnly', (evt, propertyName, isReadOnly) => {
																if (isReadOnly) {
																	toolbarElement.style.display = 'none';
																} else {
																	toolbarElement.style.display = 'flex';
																}
															});
															editor.enableReadOnlyMode('');
														})
														.catch(error => { console.error(error) });
												</script>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>

				<!-- body main 수정 여기까지, 하단 건들지 말것. -->
			</div>
		</div>
		<jsp:include page="/page/footer.jsp" flush="false"></jsp:include>
	</div>
</body>
</html>