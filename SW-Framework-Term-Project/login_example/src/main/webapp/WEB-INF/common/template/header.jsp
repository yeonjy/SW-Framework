<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="header">
	<div class="menu-wrap">
		<c:choose>
			<c:when test="${sessionScope.sUserId ne null}">
				<a href="/logout" class="menu">로그아웃</a>
				<a href="/mypage" class="menu">마이페이지</a>

			</c:when>
			<c:otherwise>
				<a href="/login" class="menu">로그인</a>
				<a href="/join" class="menu">회원가입</a>
			</c:otherwise>
		</c:choose>
			<a href="/notice" class="menu">공지사항</a>
			<a > * 모든 기능은 로그인 후 정상적인 이용이 가능합니다!</a>

	</div>
	<div class="main-wrap" >
		<div id="logo" style="display: inline-block; margin: 15px 15px 15px 10px;">
			<div class="dummy" style="width: 170px; padding: 15px 0;">
				<a href="/" class="menu" style="text-decoration:none"> 천둥장터⛈️</a>
			</div>
		</div>
	</div>


</div>