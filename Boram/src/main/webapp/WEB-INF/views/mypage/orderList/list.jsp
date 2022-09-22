<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
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
	<jsp:param value="guide" name="thisPage"/>
	<jsp:param value="area" name="subPage"/>
</jsp:include>
</body>
</html>