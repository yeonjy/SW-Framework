<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지 - 수정</title>

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
    <%-- 페이지 내용 영역 --%>
    <div class="contents">
        <form id="modify_form" method="post">
        <table>
            <tr>
                <th>닉네임</th>
                <td>
                    <input type="text" id="userNickName_input" class="required" name="userNickName" value="${member.userNickName}" title="닉네임">
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="text" id="email_input" class="required" name="email" value="${member.email}" title="이메일">
                </td>
            </tr>
            <tr>
                <th>휴대폰 번호</th>
                <td>
                    <input type="text" id="phoneNum_input" class="required" name="phoneNum" value="${member.phoneNum}" title="휴대폰번호">
                </td>
            </tr>
            <tr>
                <th>자기소개</th>
                <td>
                    <input type="text" id="content_input" class="required" name="content" value="${member.content}" title="자기소개">
                </td>
            </tr>

        </table>

        <div class="button-wrap">
            <span id="btn_modify" class="button">수정</span>
        </div>
        </form>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        <%-- 미개발 메뉴 처리 --%>
        $('.preparing').on('click', function() {
            alert("아직 준비중입니다.");
        });

        <%-- 엔터키 - 수정 버튼 클릭 처리 --%>
        $('#modify_form input').on('keyup', function(e) {
            if (e.keyCode == 13) {
                e.preventDefault();

                if ($(this).attr('id') == 'pwd_input') {
                    $('#btn_modify').click();
                }
            }
        });

        <%-- 수정 버튼 클릭 --%>
        $('#btn_modify').on('click', function() {

            var validTF = true;

            $('#modify_form .required').each(function() {
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
                url: '/mypage/modify',
                type: 'POST',
                data: $('#modify_form').serialize(),
                success: function(data) {
                    var result_cd = data.result_cd;
                    location.href = "/mypage";

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








