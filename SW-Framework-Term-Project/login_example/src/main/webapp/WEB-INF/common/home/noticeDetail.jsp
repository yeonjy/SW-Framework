<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세 페이지</title>

    <jsp:include page="../template/header.jsp"></jsp:include>
    <link type="text/css" rel="stylesheet" href="/web/css/common/login/login.css" />

    <style type="text/css">
        .contents table {
            width: 800px;
            border: 1px solid #000;
            border-collapse: collapse;
            margin-bottom: 15px;
        }

        .contents table th,.contents table td {
            border: 1px solid #000;
            padding: 4px 8px 5px 8px;
        }

        .contents .button-wrap {
            text-align: right;
        }
        .contents .button-wrap .button {
            cursor: pointer;
            padding: 5px 10px;
            background: #e0ebff;
            border: 1px solid #a3afc7;
        }
    </style>


</head>
<body>

<div class="container">
    <%-- 헤더 영역 --%>
    <jsp:include page="../template/script.jsp"></jsp:include>

    <%-- 공지사항 내용 영역 --%>
    <div class="contents">
            <c:if test="${userId eq notice.userId}">
                <div class="button-wrap">
                    <span id="btn_delete" class="button">공지사항 삭제</span>
                </div>
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

            </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        <%-- 공지사항 삭제 버튼 클릭 --%>
        $('#btn_delete').on('click', function() {

            var noticeId = ${notice.noticeId};

            // ajax 호출
            $.ajax({
                url: "/notice/" + noticeId + "/delete",
                type: 'POST',
            });
        });

    });
</script>


</body>
</html>