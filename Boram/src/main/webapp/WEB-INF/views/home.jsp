<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Index Page</h1>
<<<<<<< HEAD
	<a href="${pageContext.request.contextPath}/users/login.do">로그인 하기</a>
	<a href="${pageContext.request.contextPath }/customer/qna.do">문의게시판</a>
	<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃 하기(정연)</a>
	<a href="${pageContext.request.contextPath }/notice/list.do">공지사항</a>
	<!-- 문준욱 -->
	<a href="${pageContext.request.contextPath}/users/reserve.do">예약하기</a>
	<!-- 이슬애 -->
	<a href="${pageContext.request.contextPath}/corporation/brand.do">브랜드 소개</a>
	<a href="${pageContext.request.contextPath}/users/login.do">로그인 하기</a><br>
=======
	<a href="${pageContext.request.contextPath }/users/login.do">로그인하기</a><br>
>>>>>>> 4fa0b75682992b3c345c5853b927f3a17f8b6f0f
	<a href="${pageContext.request.contextPath }/customer/qna.do">문의게시판</a><br>
	<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃 하기(정연)</a><br>
	<a href="${pageContext.request.contextPath }/notice/list.do">공지사항</a><br>
	<a href="${pageContext.request.contextPath}/users/reserve.do">예약하기</a>
	<a href="${pageContext.request.contextPath}/users/reserve.do">예약하기</a><br>
	<a href="${pageContext.request.contextPath}/users/reservationList.do">예약 리스트</a><br>

</body>
</html>