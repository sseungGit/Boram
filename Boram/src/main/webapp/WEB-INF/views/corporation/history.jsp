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
	.container > img {

	  width: 100%;

	  }
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
<div class="container" style="margin:0px 150px 250px 150px">
	<img src="${pageContext.request.contextPath}/resources/img/corporhistory.jpg">
 </div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>