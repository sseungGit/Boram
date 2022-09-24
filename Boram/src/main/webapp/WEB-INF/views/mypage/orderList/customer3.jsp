<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/mypage/ orderList/customer3.jsp</title>
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
		<jsp:param value="mypage" name="thisPage"/>
		<jsp:param value="orderlist" name="subPage"/>
	</jsp:include>
	<h1>주문 상세 정보입니다</h1>
	<table>
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문가격</th>
				<th>배송지</th>
				<th>예약일</th>
				<th>수거일</th>
				<th>요청사항</th>
				<th>상태</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.code }</td>
					<td>${tmp.order_price }</td>
					<td>${tmp.order_addr }</td>
					<td>${tmp.regdate}</td>
					<td>${tmp.reservation_date }</td>
					<td>${tmp.request}</td>
					<td>${tmp.state }</td>
				     <c:if test="${tmp.orderer eq id and tmp.state eq '반환완료' }">
					<td><a href="${pageContext.request.contextPath }/review/insertform.do?code=${tmp.code }">후기쓰기</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="section" id="section4">
		<jsp:include page="/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>