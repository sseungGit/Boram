<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
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
		<jsp:param value="manager" name="thisPage"/>
		<jsp:param value="manager" name="subPage"/>
	</jsp:include>
	<div id="detail_wr">
		<div id="body-content">
			<h1>주문정보</h1>
			<span>주문번호</span><input type="text" value="${order.code}"/><br />
			<span>주문상태</span><input type="text" value="${order.state}"/><br />
			<f:formatNumber value="${order.order_price }" pattern="#,###" />
			<span>주문금액</span><input type="text" value="${order.order_price}"/><br />
			<span>주문일</span><input type="text" value="${order.regdate}"/><br />
			<span>수거 요청일</span><input type="text" value="${order.reservation_date}"/><br />
			<span>수거 운송장번호</span><input type="text" value="${order.get_invoice_num}"/><br />
			<span>반환 운송장번호</span><input type="text" value="${order.send_invoice_num}"/><br />
			<br />
			<h1>고객정보</h1>
			<span>아이디</span><input type="text" value="${order.orderer}"/><br />
			<span>이름</span><input type="text" value="${order.name}"/><br />
			<span>전화번호</span><input type="text" value="${order.phone}"/><br />
			<span>주소</span><input type="text" value="${order.addr}"/><br />
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>