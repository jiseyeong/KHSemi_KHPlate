<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1상담 목록</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
</style>
</head>
<body>
	<div class="container_noboot">
        <div class="sidebar">

        </div>
        <div class="body">
            <table border="1" align="center">
                <tr>
                    <th width="10%">글 번호</th>
                    <th width="40%">제목</th>
                    <th width="15%">질문자</th>
                    <th width="10%">답변 여부</th>
                    <th width="15%">업로드 일자</th>
                    <th width="10%">분류</th>
                </tr>
                <c:if test="${fn:length(list) > 0}">
                    <c:forEach var="i" begin="0" end="${fn:length(list)-1}" step="1">
                        <tr>
                            <td>${list.get(i).consultID}</td>
                            <td><a href="/view.consult?consultID=${list.get(i).consultID}">${list.get(i).title}</a></td>
                            <td>${writerList.get(i)}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${list.get(i).reply eq 'Y'}">
                                        응답
                                    </c:when>
                                    <c:otherwise>
                                        미응답
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${list.get(i).writeDate}</td>
                            <td>${list.get(i).category}</td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </div>
    </div>
</body>
</html>