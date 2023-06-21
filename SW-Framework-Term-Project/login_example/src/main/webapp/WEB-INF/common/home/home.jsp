<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>

<jsp:include page="../template/header.jsp"></jsp:include>
<link type="text/css" rel="stylesheet" href="/web/css/common/login/login.css" />
</head>
<body>

<div class="container">
	<%-- 헤더 영역 --%>
	<jsp:include page="../template/script.jsp"></jsp:include>

	<%-- 페이지 내용 영역 --%>
	<div class="contents">

		<c:forEach var="product" items="${productList}">
			<div class="dummy" style="width: 170px; padding: 15px 0;">
				<a href="/${product.productId}/detail">상품 제목 : ${product.title}</a>
				<a>가격 : ${product.price}</a>
				<c:choose>
					<c:when test="${product.tradeStatus eq 'Available'}">
						<p>거래 가능</p>
					</c:when>
					<c:when test="${product.tradeStatus eq 'Booked'}">
						<p>예약중</p>
					</c:when>
					<c:when test="${product.tradeStatus eq 'Complete'}">
						<p>판매 완료</p>
					</c:when>
				</c:choose>
			</div>
		</c:forEach>

	</div>
</div>

</body>
</html>