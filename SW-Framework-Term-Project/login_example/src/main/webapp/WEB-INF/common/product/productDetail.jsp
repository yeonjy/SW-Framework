<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

    <jsp:include page="../template/header.jsp"></jsp:include>

    <meta charset="UTF-8">
    <title>상품 상세 페이지</title>

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

    <jsp:include page="../template/script.jsp"></jsp:include>



    <%-- 페이지 내용 영역 --%>
    <div class="contents">
        <table>
            <tr>
                <td >
                    <img src="${product.imageUrl}" />
                </td>

            </tr>
            <tr>
                <th>상품 제목</th>
                <td>${product.title}</td>
            </tr>
            <tr>
                <th>상품 설명</th>
                <td>${product.contents}</td>
            </tr>
            <tr>
                <th>상품 가격</th>
                <td>${product.price}</td>
            </tr>
            <tr>
                <th>거래 상태</th>
                <td>
                    <c:choose>
                        <c:when test="${product.tradeStatus eq 'Available'}">
                            <a>거래 가능</a>
                        </c:when>
                        <c:when test="${product.tradeStatus eq 'Booked'}">
                            <a>예약중</a>
                        </c:when>
                        <c:when test="${product.tradeStatus eq 'Complete'}">
                            <a>판매 완료</a>
                        </c:when>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>상품 사진 첨부</th>
                <td>
                    <input type="file" id="profile_img" />
                </td>
            </tr>
        </table>


        <c:if test="${userId eq product.userId}">
            <div class="button-wrap">
                <span id="btn_modify" class="button">이미지 수정</span>
            </div>
            <p></p>
            <div class="button-wrap">
                <span id="btn_delete" class="button">상품 삭제</span>
            </div>
        </c:if>

    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#btn_modify').on('click', function() {
            // console.log($('#profile_img'));
            // return false;

            var formData = new FormData(),
                productId = ${product.productId};
            formData.append("productImg", $('#profile_img')[0].files[0]);


            $.ajax({
                type:"post",
                enctype:'multipart/form-data',
                url: "/" + productId + "/modify-product-image",
                data: formData,
                dataType:'json',
                processData : false,
                contentType : false,
                cache : false,
                success : function(data){
                    console.log("success : ", data);
                },
                error : function(e){
                    console.log("error : ", e);
                }
            });
        });


        <%-- 상품 삭제 버튼 클릭 --%>
        $('#btn_delete').on('click', function() {

            var productId = ${product.productId};

            // ajax 호출
            $.ajax({
                url: "/" + productId + "/delete",
                type: 'POST',
            });
        });

    });
</script>

</body>
</html>








