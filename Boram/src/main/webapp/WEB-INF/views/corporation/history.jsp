<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/corporation/history.jsp</title>
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
	<jsp:param value="history" name="subPage"/>
</jsp:include>
	
	<br><br><br><br><br>
	<div>
		<p>런드리365 연혁</p>
		<br><br><br>
		<p>2022년 9월</p>
		<br><br>
		<p>6일 팀 결성 </p>
		<br>
		<p>7일 역할 분담 및 회의</p>
		<br>
		<p>12일 git 테스트</p>
		<br>
		<p>16일 첫 대면 회의</p>
		<br>
		<p>22일 2차 대면 회의</p>
		<br>
		<p>23-25일 기능 점검</p>
		<br>
		<p>27일 3차 대면 회의</p>
		<br>
		<p>28일 서비스 런칭</p>
		<br>
	</div>
	<br>
	<img src="${pageContext.request.contextPath}/resources/img/history.JPG">
	<br><br><br><br><br>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>