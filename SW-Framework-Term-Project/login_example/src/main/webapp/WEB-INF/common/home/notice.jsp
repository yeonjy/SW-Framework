<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 페이지</title>

    <jsp:include page="../template/header.jsp"></jsp:include>
    <link type="text/css" rel="stylesheet" href="/web/css/common/login/login.css" />
</head>
<body>

<div class="container">
    <%-- 헤더 영역 --%>
    <jsp:include page="../template/script.jsp"></jsp:include>

    <%-- 공지사항 내용 영역 --%>
    <div class="contents">
        <c:forEach var="notice" items="${noticeList}">
            <c:if test="${userId eq notice.userId}">
            </c:if>
            <table border="1">
                <tr>
                    <td width="70">내용</td>
                    <td>${notice.content}</td>
                </tr>
                <tr>
                    <td>게시일</td>
                    <td>${notice.createdAt}</td>
                </tr>
                <tr>
                    <td>수정일</td>
                    <td>${notice.updatedAt}</td>
                </tr>
                <div class="menu-wrap">
                    <a href="/notice/${notice.noticeId}/detail" class="menu">상세보기</a>
                </div>

            </table>
        </c:forEach>
    </div>
</div>

</body>
</html>