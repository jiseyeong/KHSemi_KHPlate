<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>FAQ</title>
                <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
                </style>
            </head>

            <body>
                <div class="container_noboot">
                    <div class="sidebar">

                    </div>
                    <div class="body">
                        <div class="content">
                            <div class="accordion" id="accordionFAQ">
                                <c:choose>
                                    <c:when test="${fn:length(list) > 0}">
                                        <c:forEach var="i" begin="0" end="${fn:length(list)-1}" step="1">
                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="heading${i}">
                                                    <button class="accordion-button" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#collapse${i}"
                                                        aria-expanded="true" aria-controls="collapse${i}">
                                                        ${list.get(i).title}
                                                    </button>
                                                </h2>
                                                <div id="collapse${i}" class="accordion-collapse collapse show"
                                                    aria-labelledby="heading${i}" data-bs-parent="#accordionFAQ">
                                                    <div class="accordion-body">
                                                        <div id="editor${i}">
                                                            ${list.get(i).body}
                                                        </div>
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
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseOne" aria-expanded="true"
                                                    aria-controls="collapseOne">
                                                    FAQ #1
                                                </button>
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
                </div>
            </body>

            </html>