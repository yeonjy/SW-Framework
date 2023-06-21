<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>

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

    <%-- 페이지 내용 영역 --%>
    <div class="contents">
        <table>
            <tr>
                <th>이름</th>
                <td>${member.name}</td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>${member.userNickName}</td>
            </tr>
            <tr>
                <th>휴대폰 번호</th>
                <td>${member.phoneNum}</td>
            </tr>
            <tr>
                <th>자기소개</th>
                <td>${member.content}</td>
            </tr>

        </table>

        <div class="button-wrap">
            <a href="/mypage/modify" class="button">수정하기</a>
        </div>
        <div>
            <p> </p>
        </div>
        <div class="button-wrap">
            <span id="btn_delete" class="button">회원 탈퇴</span>
        </div>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">


    $(document).ready(function() {
        <%-- 탈퇴 버튼 클릭 --%>
        $('#btn_delete').on('click', function() {
            // ajax 호출
            $.ajax({
                url: '/mypage/delete',
                type: 'POST',
            });
        });



    });
</script>

</body>
</html>








