<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .container_noboot{
        margin-left:0;
        margin-right:0;
        max-width: 1920px;
    }
</style>
</head>
<body>
    <div class="container_noboot">
        <c:choose>
            <c:when test="${fn:length(list) > 0}">
                <c:forEach var="i" items="${list}">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                          <h5 class="card-title">Card title</h5>
                          <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                      </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div style="text-align: center; height:500px; line-height:500px;">
                    검색할 대상이 없습니다.
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>