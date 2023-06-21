<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>

<c:if test="${sessionScope.sUserId ne null}">
    <script type="text/javascript">
        alert('잘못된 접근입니다.');
        location.href = '/';
    </script>
</c:if>

<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지</title>

    <jsp:include page="../template/script.jsp"></jsp:include>

    <link type="text/css" rel="stylesheet" href="/web/css/common/login/login.css" />

</head>
<body>

<div class="container">
    <%-- 헤더 영역 --%>
    <jsp:include page="../template/header.jsp"></jsp:include>

    <%-- 페이지 내용 영역 --%>
    <div class="contents">
        <div class="login-wrap">
            <div class="login">
                <form id="join_form" method="post">
                    <div>
                        <input type="text" id="name_input" class="required" name="name" placeholder="이름을 입력해주세요" title="이름" />
                        <div class="alarm">이름을 입력해주세요.</div>
                    </div>
                    <div>
                        <input type="text" id="nickname_input" class="required" name="userNickName" placeholder="닉네임을 입력해주세요" title="닉네임" />
                        <div class="alarm">닉네임을 입력해주세요.</div>
                    </div>
                    <div>
                        <input type="text" id="email_input" class="required" name="email" placeholder="이메일을 입력해주세요" title="이메일" />
                        <div class="alarm">이메일을 입력해주세요.</div>
                    </div>
                    <div>
                        <input type="password" id="pwd_input" class="required" name="password" placeholder="비밀번호를 입력해주세요" title="비밀번호" />
                        <div class="alarm">비밀번호를 입력해주세요.</div>
                    </div>
                    <div>
                        <input type="text" id="phone_number_input" class="required" name="phoneNum" placeholder="휴대폰 번호를 입력해주세요" title="휴대폰 번호" />
                        <div class="alarm">휴대폰 번호를 입력해주세요.(예시: 010-0000-0000)</div>
                    </div>
                    <div>
                        <input type="text" id="content_input" class="required" name="content" placeholder="내용을 입력해주세요" title="내용" />
                        <div class="alarm">자기소개를 입력해주세요.</div>
                    </div>

                </form>

                <a href="#" id="btn_join" class="login-button">회원가입하기</a>
            </div>
            <div class="sub-menu">
                <a href="login" class="menu">로그인</a>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        <%-- 미개발 메뉴 처리 --%>
        $('.preparing').on('click', function() {
            alert("아직 준비중입니다.");
        });

        <%-- 엔터키 - 회원가입 버튼 클릭 처리 --%>
        $('#join_form input').on('keyup', function(e) {
            if (e.keyCode == 13) {
                e.preventDefault();

                if ($(this).attr('id') == 'pwd_input') {
                    $('#btn_join').click();
                }
            }
        });

        <%-- 회원가입 버튼 클릭 --%>
        $('#btn_join').on('click', function() {

            var validTF = true;

            $('#join_form .required').each(function() {
                if ($.trim($(this).val()) == '') {
                    // $(this).siblings('div.alarm').text('변경된 문구!!!!!!!!');
                    $(this).siblings('div.alarm').show();

                    validTF = false;
                    return false;

                } else {
                    $(this).siblings('div.alarm').hide();
                }
            });

            if (!validTF) {
                return false;
            }

            // ajax 호출
            $.ajax({
                url: '/join',
                type: 'POST',
                data: $('#join_form').serialize(),
                success: function(data) {
                    var result_cd = data.result_cd;
                    if (result_cd == '00') {
                        // 메인페이지로 이동
                        location.href = "/login";

                    } else {
                        var result_msg = data.result_msg;
                        alert(result_msg);
                    }
                },
                error: function(error) {
                    console.log(error);
                }
            });
        });
    });
</script>
</body>
</html>