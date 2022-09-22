<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/corporation/brand.jsp</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
	<style>
		body{background-color:#666;}
	</style>
</head>
<body>
<!-- main nav바  -->
<jsp:include page="/include/nav.jsp"></jsp:include>
<!-- sub nav바 -->
<!-- 
      thisPage는 대메뉴를 구별하는데 사용
      subPage는 소메뉴를 구별하는데 사용
-->
<jsp:include page="/include/subnav.jsp">
	<jsp:param value="brand" name="thisPage"/>
	<jsp:param value="corpor" name="subPage"/>
</jsp:include>

	<br><br><br><br><br>
	<div>
		<p>우리집 모바일 세탁소 런드리365</p>
		<br><br><br>
		<p>잠들기 전 내놓으면 한밤만에 세탁 끝!</p>
		<br><br>
		<p>세탁은 런드리365에 맡기고 </p>
		<p>의미있는 시간을 보내 보세요.</p>
		<br><br>
		<p>편리하고 스마트한 세탁 서비스로 </p>
		<p>생활의 여유를 찾아 드리겠습니다 :) </p>
	</div>
	<br><br><br><br><br>
	<img src="${pageContext.request.contextPath}/resources/img/brand.JPG">
	<br><br><br><br><br>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>